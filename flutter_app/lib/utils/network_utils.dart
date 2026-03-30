import 'package:dio/dio.dart';

import 'app_config.dart';
import 'logger.dart';

/// Lightweight network helpers.
///
/// We deliberately avoid packages like `connectivity_plus` because they only
/// report interface state (WiFi/mobile), not actual server reachability. A
/// device can be on WiFi on an intranet with no internet — we need to know
/// whether *our* server is reachable, not the internet.
abstract final class NetworkUtils {
  static final _logger = LoggerApp('NetworkUtils');
  static final _dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    ),
  );

  /// Returns true if the Go connector's `/health` endpoint responds within
  /// the timeout. Works for internet AND intranet deployments.
  static Future<bool> isServerReachable() async {
    try {
      final response = await _dio.get('${AppConfig.connectorUrl}/health');

      return response.statusCode == 200;
    } catch (_) {
      _logger.log('Server unreachable at ${AppConfig.connectorUrl}');

      return false;
    }
  }
}
