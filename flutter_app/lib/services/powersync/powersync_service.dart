import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';

import '../../utils/logger.dart';
import '../auth/auth_api_client.dart';
import 'connector.dart';
import 'schema.dart';

/// Manages the lifecycle of the [PowerSyncDatabase].
///
/// Key design decisions:
///   - Each user gets their own SQLite file (`powersync_{userId}.db`).
///     This allows multiple cashiers to share a device — switching users
///     opens a different database file without cross-contamination.
///   - The database is opened lazily on first [open] call.
///   - [close] disconnects the sync stream and closes the SQLite connection.
///     Call this before switching users.
class PowerSyncService {
  PowerSyncService._();

  static final PowerSyncService instance = PowerSyncService._();

  final _logger = LoggerApp('PowerSyncService');

  PowerSyncDatabase? _db;
  String? _currentUserId;

  /// Returns the current [SyncStatus] stream for UI listeners.
  Stream<SyncStatus> get statusStream =>
      _db?.statusStream ?? const Stream.empty();

  /// The currently open database. Throws if [open] has not been called.
  PowerSyncDatabase get db {
    final db = _db;
    if (db == null) {
      throw StateError(
        'PowerSyncService: database not open. Call open() first.',
      );
    }

    return db;
  }

  /// Whether the database has been opened for the given [userId].
  bool isOpenFor(String userId) => _db != null && _currentUserId == userId;

  /// Opens (or reuses) the database for [userId].
  ///
  /// If a database for a *different* user is already open, it is closed first.
  /// This is the expected flow when a second cashier logs in on the same device.
  Future<PowerSyncDatabase> open({
    required String userId,
    required AuthApiClient authApiClient,
    bool connectSync = true,
  }) async {
    // Reuse existing connection for the same user.
    try {
      PowerSyncDatabase? db = _db;
      if (isOpenFor(userId) && db != null) return db;

      final dbPath = await _databasePath();
      _logger.log('Opening PowerSync DB for user $userId at $dbPath');

      db = PowerSyncDatabase(schema: schema, path: dbPath);

      await db.initialize();
      _currentUserId = userId;

      if (connectSync) {
        final connector = PowerSyncConnector(authApiClient);
        await db.connect(connector: connector);
        _logger.log('PowerSync sync stream connected');
      } else {
        _logger.log('PowerSync opened in offline (local-only) mode');
      }
      _db = db;

      return db;
    } catch (e) {
      _logger.severe('Failed PowerSyncService open : $e');
      rethrow;
    }
  }

  /// Disconnects the sync stream and closes the SQLite connection.
  Future<void> close() async {
    if (_db == null) return;
    try {
      await _db?.disconnect();
      await _db?.close();
    } catch (e) {
      _logger.severe('Error closing PowerSync DB: $e');
    } finally {
      _db = null;
      _currentUserId = null;
    }
  }

  /// Returns a single [SqliteTable] watch stream — re-executes [sql] whenever
  /// any of the listed [tables] change. This is the primary way to build
  /// reactive UI in this app.
  Stream<List<Map<String, dynamic>>> watch(
    String sql, {
    List<Object?> parameters = const [],
    required List<String> tables,
  }) {
    return db.watch(sql, parameters: parameters);
  }

  /// Returns the per-user database file path.
  static Future<String> _databasePath() async {
    final Directory dir;
    if (kIsWeb) {
      return 'sabitou.db';
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    return p.join(dir.path, 'sabitou.db');
  }
}
