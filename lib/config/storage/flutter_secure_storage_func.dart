import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// A simple helper for working with auth tokens in secure storage.
class FlutterSecureStorageFunc {
  FlutterSecureStorageFunc._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage();
  static const String _accessTokenKey = 'auth_token';
  static const String _refreshTokenKey = 'refresh_token';
  static const String _attemptIdKey = 'attempt_id';
  static const String _roleKey = 'role';

  static Future<void> saveRole(String role) async {
    await _storage.write(key: _roleKey, value: role);
  }

  static Future<String?> getRole() async {
    final value = await _storage.read(key: _roleKey);
    return value != null ? value : null;
  }

  static Future<void> deleteRole() async {
    await _storage.delete(key: _roleKey);
  }


  // --- Save Attempt ID ---
  static Future<void> saveAttemptId(int id) async {
    await _storage.write(key: _attemptIdKey, value: id.toString());
  }

  static Future<int?> getAttemptId() async {
    final value = await _storage.read(key: _attemptIdKey);
    return value != null ? int.tryParse(value) : null;
  }

  static Future<void> deleteAttemptId() async {
    await _storage.delete(key: _attemptIdKey);
  }

  // --- Access Token ---
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _accessTokenKey, value: token);
  }

  static Future<String?> getToken() async {
    return _storage.read(key: _accessTokenKey);
  }

  static Future<void> updateToken(String newToken) async {
    await _storage.write(key: _accessTokenKey, value: newToken);
  }

  static Future<void> deleteToken() async {
    await _storage.delete(key: _accessTokenKey);
  }

  // --- Refresh Token ---
  static Future<void> saveRefreshToken(String token) async {
    await _storage.write(key: _refreshTokenKey, value: token);
  }

  static Future<String?> getRefreshToken() async {
    return _storage.read(key: _refreshTokenKey);
  }

  static Future<void> updateRefreshToken(String newToken) async {
    await _storage.write(key: _refreshTokenKey, value: newToken);
  }

  static Future<void> deleteRefreshToken() async {
    await _storage.delete(key: _refreshTokenKey);
  }
}
