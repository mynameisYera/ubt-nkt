import 'package:dio/dio.dart';
import 'package:ubt_pbb/config/endpoints/endpoints.dart';
import 'package:ubt_pbb/config/logger/l.dart';
import 'package:ubt_pbb/config/storage/flutter_secure_storage_func.dart';

class ApiException implements Exception {
  final String message;
  ApiException(this.message);
}

// Мап ошибок сервера → человеко-понятный текст
String mapError(String code) {
  switch (code) {
    case 'invalid_phone':
      return 'Неправильный номер телефона';
    case 'invalid_credentials':
      return 'Неправильно ввели данные';
    case 'otp_rate_limited':
      return 'Кейінірек байқап көріңіз';
    default:
      return 'Ошибка, попробуйте ещё раз';
  }
}
class DioSender {
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: Endpoints.baseUrl,
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // Добавляем access токен
          try {
            final token = await FlutterSecureStorageFunc.getToken();
            if (token != null && token.isNotEmpty) {
              options.headers['Authorization'] = 'Bearer $token';
              L.log('TOKEN', 'Token found: ${token.substring(0, 20)}...');
            } else {
              L.log('TOKEN', 'No token available');
            }
          } catch (e) {
            L.error('TOKEN', 'Error getting token: $e');
          }
          L.log(
            'REQUEST',
            '${options.method} ${options.baseUrl}${options.path}'
            '\nHeaders: ${options.headers}'
            '\nQuery: ${options.queryParameters}'
            '\nData: ${options.data}',
          );
          handler.next(options);
        },
        onResponse: (response, handler) {
          L.log(
            'RESPONSE',
            '${response.requestOptions.method} '
            '${response.requestOptions.baseUrl}${response.requestOptions.path}'
            '\nStatus: ${response.statusCode}'
            '\nData: ${response.data}',
          );
          handler.next(response);
        },
        onError: (error, handler) async {
          final requestOptions = error.requestOptions;

          // Если сервер вернул 401 Unauthorized
          if (error.response?.statusCode == 401 &&
              requestOptions.extra['retry'] != true) {
            try {
              L.log('TOKEN_REFRESH', 'Attempting to refresh token due to 401');
              
              final refreshResult = await _refreshToken();
              if (refreshResult != null && refreshResult['access'] != null) {
                final newAccessToken = refreshResult['access'] as String;
                try {
                  await FlutterSecureStorageFunc.saveToken(newAccessToken);
                  
                  // Если пришел новый refresh token, сохраняем его
                  if (refreshResult['refresh'] != null) {
                    await FlutterSecureStorageFunc.saveRefreshToken(
                      refreshResult['refresh'] as String,
                    );
                  }
                } catch (e) {
                  // Игнорируем ошибки сохранения токенов
                  L.error('TOKEN_REFRESH', 'Error saving tokens: $e');
                }

                L.log('TOKEN_REFRESH', 'Token refreshed successfully');

                // Повторяем оригинальный запрос с новым токеном
                final opts = Options(
                  method: requestOptions.method,
                  headers: {
                    ...requestOptions.headers,
                    'Authorization': 'Bearer $newAccessToken',
                  },
                  extra: {...requestOptions.extra, 'retry': true},
                );

                final cloneReq = await _dio.request(
                  requestOptions.path,
                  data: requestOptions.data,
                  queryParameters: requestOptions.queryParameters,
                  options: opts,
                );
                return handler.resolve(cloneReq);
              } else {
                L.error('TOKEN_REFRESH', 'Failed to refresh token: no access token received');
                
                // Если refresh не удался, удаляем токены и пробрасываем ошибку
                await FlutterSecureStorageFunc.deleteToken();
                await FlutterSecureStorageFunc.deleteRefreshToken();
                return handler.reject(error);
              }
            } catch (refreshError) {
              L.error('TOKEN_REFRESH', 'Error refreshing token: $refreshError');
              // Если refresh не удался, удаляем токены
              await FlutterSecureStorageFunc.deleteToken();
              await FlutterSecureStorageFunc.deleteRefreshToken();
              return handler.reject(error);
            }
          }

          handler.next(error);
        }

      ),
    );

  static Future<Map<String, dynamic>?> _refreshToken() async {
    try {
      final refreshToken = await FlutterSecureStorageFunc.getRefreshToken();
      final accessToken = await FlutterSecureStorageFunc.getToken();

      if (refreshToken == null || refreshToken.isEmpty) {
        L.error('TOKEN_REFRESH', 'No refresh token available \n refresh token: $refreshToken');
        L.error('TOKEN_ACCESS', 'No access token available \n access token: $accessToken');
        return null;
      }

      L.log('TOKEN_REFRESH', 'Sending refresh request');
      
      // Создаем отдельный Dio экземпляр без interceptors для refresh запроса
      // чтобы избежать бесконечной рекурсии
      final dio = Dio(
        BaseOptions(
          baseUrl: Endpoints.baseUrl,
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      final response = await dio.post(
        Endpoints.refresh,
        data: {'refresh': refreshToken},
      );

      if (response.statusCode == 200 && response.data is Map) {
        final data = response.data as Map<String, dynamic>;
        L.log('TOKEN_REFRESH', 'Refresh successful');
        return data;
      } else {
        L.error('TOKEN_REFRESH', 'Invalid response: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      L.error('TOKEN_REFRESH', 'DioException: ${e.message}');
      if (e.response?.statusCode == 401) {
        // Refresh token тоже истек
        L.error('TOKEN_REFRESH', 'Refresh token expired');
      }
      return null;
    } catch (e) {
      L.error('TOKEN_REFRESH', 'Unexpected error: $e');
      return null;
    }
  }



  static Future<Response> _safeRequest(Future<Response> Function() request) async {
    try {
      return await request();
    } on DioException catch (e) {
      final statusCode = e.response?.statusCode;
      final data = e.response?.data;
      final requestPath = e.requestOptions.path;
      final requestData = e.requestOptions.data;

      // Логируем детали ошибки
      L.error(
        'API_ERROR',
        'Request failed: ${e.requestOptions.method} ${e.requestOptions.baseUrl}$requestPath'
        '\nStatus Code: $statusCode'
        '\nError Message: ${e.message}'
        '\nResponse Data: $data'
        '\nRequest Data: $requestData',
      );

      if (data is Map) {
        // Проверяем различные форматы ошибок от сервера
        if (data['error'] != null) {
          final String serverError = data['error'] is String 
              ? data['error'] as String 
              : data['error'].toString();
          throw ApiException(mapError(serverError));
        }
        
        // Проверяем другие возможные форматы ошибок
        if (data['message'] != null) {
          final String message = data['message'] is String 
              ? data['message'] as String 
              : data['message'].toString();
          throw ApiException(message);
        }
        
        if (data['detail'] != null) {
          final String detail = data['detail'] is String 
              ? data['detail'] as String 
              : data['detail'].toString();
          throw ApiException(detail);
        }
      }

      // Если статус код есть, формируем более информативное сообщение
      if (statusCode != null) {
        throw ApiException('Ошибка сервера (код $statusCode). Попробуйте ещё раз');
      }

      throw ApiException('Ошибка сети, попробуйте ещё раз');
    }
  }

  static Future<Response> get(String url) async =>
      _safeRequest(() => _dio.get(url));

  static Future<Response> post(String url, dynamic data) async =>
      _safeRequest(() => _dio.post(url, data: data));

  static Future<Response> put(String url, dynamic data) async =>
      _safeRequest(() => _dio.put(url, data: data));

  static Future<Response> patch(String url, dynamic data) async =>
      _safeRequest(() => _dio.patch(url, data: data));

  static Future<Response> delete(String url) async =>
      _safeRequest(() => _dio.delete(url));
}
