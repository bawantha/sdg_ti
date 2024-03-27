import 'package:logger/logger.dart';

final _logger = Logger(
  printer: PrettyPrinter(methodCount: 0),
);

sealed class SDGLog {
  /// debug
  static void debug(String tag, String message) {
    _logger.d('$tag: $message');
  }

  /// info
  static void info(String tag, String message) {
    _logger.i('$tag: $message');
  }

  /// warn
  static void warn(String tag, String message) {
    _logger.w('$tag: $message');
  }

  /// trace
  static void trace(String tag, String message) {
    _logger.t('$tag: $message');
  }

  /// error
  static void error(String tag, Object error,
      {String? message, StackTrace? stackTrace}) {
    _logger.e('$tag: $message', error: error);
  }
}
