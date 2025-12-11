import 'package:flutter/foundation.dart';
import 'package:talker/talker.dart';

part 'error.dart';
part 'info.dart';
part 'log.dart';
part 'request_response.dart';

class L {
  static final Talker _talker = Talker();

  static void info(String title, String message) {
    _talker.logCustom(_InfoWithTitle(title, message));
  }

  static void error(String title, String message) {
    _talker.logCustom(_ErrorWithTitle(title, message));
  }

  static void log(String title, String message) {
    if (kDebugMode) {
      _talker.logCustom(_LogWithTitle(title, message));
    }
  }

  /// INFO (green)
  static void i(String message) {
    _talker.logCustom(_Info(message));
  }

  /// ERROR (red – уже есть)
  static void e(String message) {
    _talker.logCustom(_Error(message));
  }

  /// Generic LOG (gray)
  static void l(String message) {
    if (kDebugMode) {
      _talker.logCustom(_Log(message));
    }
  }

  /// HTTP / API request log (own color)
  static void request(String message) {
    _talker.logCustom(_Request(message));
  }

  /// HTTP / API response log (own color)
  static void response(String message) {
    _talker.logCustom(_Response(message));
  }
}
