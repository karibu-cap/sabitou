import 'package:logger/logger.dart';

/// The logger configuration.
final class LoggerApp {
  /// The class name.
  final String? className;

  /// The logger configuration.
  final Logger logger = Logger(
    printer: PrettyPrinter(
      dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
    ),
    level: Level.trace,
  );

  /// Log a message at level [Level.warning].
  void warning(String message, {Object? error, StackTrace? stackTrace}) =>
      logger.w(
        className == null ? message : '$className: $message',
        error: error,
        stackTrace: stackTrace,
      );

  /// Log a message at level [Level.info].
  void info(String message) => Logger(
        printer: SimplePrinter(
          printTime: true,
        ),
      ).i(
        className == null ? message : '$className: $message',
      );

  /// Log a message at level [Level.log].
  void log(String message) => Logger(
        printer: SimplePrinter(
          printTime: true,
        ),
      ).d(
        className == null ? message : '$className: $message',
      );

  /// Log a message at level [Level.e].
  void severe(String message, {Object? error, StackTrace? stackTrace}) =>
      logger.e(
        className == null ? message : '$className: $message',
        error: error,
        stackTrace: stackTrace,
      );

  /// Constructor of new [LoggerApp].
  LoggerApp([this.className]);
}
