import 'dart:async' show unawaited;

import 'package:dio/dio.dart';
import 'package:powersync/powersync.dart';

import '../../utils/app_config.dart';
import '../../utils/logger.dart';
import '../auth/token_refresh_service.dart';
import '../auth/token_service.dart';

/// The PowerSync connector.
class PowerSyncConnector extends PowerSyncBackendConnector {
  final _logger = LoggerApp('PowerSyncConnector');

  // Dio only for uploading mutations to Postgres via the Go connector.
  // No generics — avoid the dart2js RTI bug.
  final Dio _uploadDio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );

  /// Constructs a new [PowerSyncConnector].
  PowerSyncConnector();

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    try {
      var token = await TokenService.instance.getValidAccessToken();

      if (token == null) {
        final refreshService = TokenRefreshService.instance;

        if (refreshService.activeRefresh != null) {
          // One refresh is already in progress — wait for it.
          _logger.log('fetchCredentials: attente du refresh en cours...');
          try {
            await refreshService.activeRefresh;
          } catch (_) {
            // The refresh failed — let PowerSync retry via fetchCredentials.
            _logger.log('fetchCredentials: refresh failed, retour null');
          }
          token = await TokenService.instance.getValidAccessToken();
        }

        if (token == null) {
          // No token in progress. we start him with `unawaited()` for him to
          // be called on the main event loop, outside the credentials callback
          // context (avoids the dart2js RTI bug). PowerSync will retry in a
          // few seconds — here we return null to let PowerSync retry.
          _logger.log(
            'fetchCredentials: token expired, start refrest (unawaited), '
            'return null for PowerSync to retry',
          );
          unawaited(refreshService.refreshNow());

          return null;
        }
      }

      return PowerSyncCredentials(
        endpoint: AppConfig.powerSyncUrl,
        token: token,
        userId: await TokenService.instance.getUserId(),
      );
    } catch (e) {
      _logger.severe('fetchCredentials failed: ${e.runtimeType} — $e');
      return null;
    }
  }

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) return;

    final operations = <Map<String, dynamic>>[];
    for (final entry in transaction.crud) {
      operations.add({
        'op': _crudOpToString(entry.op),
        'table': entry.table,
        'id': entry.id,
        if (entry.opData != null) 'data': entry.opData,
      });
    }

    try {
      final token = await TokenService.instance.getValidAccessToken();

      // Pas de type générique explicite → évite le dart2js RTI bug.
      await _uploadDio.post(
        '${AppConfig.connectorUrl}/api/v1/sync/upload',
        data: {'operations': operations},
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            if (token != null) 'Authorization': 'Bearer $token',
          },
          validateStatus: (status) => status == 204,
        ),
      );
      await transaction.complete();
    } on DioException catch (e) {
      _logger.severe(
        'uploadData failed: ${e.response?.statusCode} — ${e.response?.data}',
      );
      rethrow;
    } catch (e) {
      _logger.severe('uploadData unexpected error: $e');
      rethrow;
    }
  }

  String _crudOpToString(UpdateType op) => switch (op) {
    UpdateType.put => 'PUT',
    UpdateType.delete => 'DELETE',
    UpdateType.patch => 'PATCH',
  };
}
