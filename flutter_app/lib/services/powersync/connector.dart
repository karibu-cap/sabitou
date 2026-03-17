// flutter_app/lib/services/powersync/connector.dart

import 'package:powersync/powersync.dart';

import '../../utils/app_config.dart';
import '../../utils/logger.dart';
import '../auth/auth_api_client.dart';
import '../auth/token_service.dart';

/// [PowerSyncConnector] bridges the PowerSync client to our Go connector.
///
/// Responsibilities:
///   1. Provide a valid JWT to PowerSync so it can open the sync stream.
///   2. Forward local CRUD operations to the connector's upload endpoint.
///
/// PowerSync calls these methods internally — your application code does not
/// call them directly.
class PowerSyncConnector extends PowerSyncBackendConnector {
  final AuthApiClient _authApiClient;
  final _logger = LoggerApp('PowerSyncConnector');
  Future<void>? _refreshFuture;

  PowerSyncConnector(this._authApiClient);

  // ---------------------------------------------------------------------------
  // 1. Token provision
  // ---------------------------------------------------------------------------

  /// Called by PowerSync before opening (or re-opening) the sync stream.
  /// Must return a [PowerSyncCredentials] with a valid, non-expired JWT.
  ///
  /// We return the stored access token directly if still valid.
  /// If not, we attempt a silent refresh. If that fails, we return null,
  /// which keeps PowerSync in a disconnected state until the user re-logs in.
  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    await _refreshFuture;
    try {
      // Try valid (non-expired) token first.
      var token = await TokenService.instance.getValidAccessToken();

      if (token == null) {
        // Try silent refresh.
        final refreshToken = await TokenService.instance.getRefreshToken();
        if (refreshToken == null) return null;

        _logger.log('Access token expired, attempting silent refresh');
        final newTokens = await _authApiClient.refreshTokens(refreshToken);
        await TokenService.instance.saveTokens(
          accessToken: newTokens.accessToken,
          refreshToken: newTokens.refreshToken,
        );
        token = newTokens.accessToken;
      }

      return PowerSyncCredentials(
        endpoint: AppConfig.powerSyncUrl,
        token: token,
        userId: await TokenService.instance.getUserId(),
      );
    } catch (e) {
      // Log the full error so we can distinguish OperationError (Web Crypto),
      // network errors, and ConnectException (refresh RPC failed).
      _logger.severe('fetchCredentials failed: ${e.runtimeType} — $e');
      // Return null → PowerSync will call invalidCredentials and retry.

      return null;
    }
  }

  @override
  void invalidateCredentials() {
    _refreshFuture = TokenService.instance.getRefreshToken();
  }

  // ---------------------------------------------------------------------------
  // 2. Upload local mutations to Postgres via the Go connector
  // ---------------------------------------------------------------------------

  /// Called by PowerSync when there are local writes that need to reach the
  /// server. We translate the [SyncBucket] operations into the format the
  /// Go connector expects and POST them.
  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) return;

    final operations = <Map<String, dynamic>>[];

    for (final entry in transaction.crud) {
      final op = <String, dynamic>{
        'op': _crudOpToString(entry.op),
        'table': entry.table,
        'id': entry.id,
        if (entry.opData != null) 'data': entry.opData,
      };
      operations.add(op);
    }

    try {
      await transaction.complete();
    } catch (e) {
      _logger.severe('uploadData failed: $e');
      // Do NOT call complete() — PowerSync will retry on the next sync cycle.
      rethrow;
    }
  }

  String _crudOpToString(UpdateType op) {
    return switch (op) {
      UpdateType.put => 'PUT',
      UpdateType.delete => 'DELETE',
      UpdateType.patch => 'PATCH',
    };
  }
}
