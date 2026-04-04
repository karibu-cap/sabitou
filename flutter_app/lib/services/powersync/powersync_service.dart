import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:powersync/powersync.dart';

import '../../utils/logger.dart';
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
  /// The singleton instance.
  static final PowerSyncService instance = GetIt.I.get<PowerSyncService>();

  final _logger = LoggerApp('PowerSyncService');

  PowerSyncDatabase? _db;

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

  /// Constructs a [PowerSyncService].
  PowerSyncService();

  /// Initializes the database connection.
  ///
  /// If provided, the database file will be scoped to that user.
  /// If null, a default (shared) database is used.
  Future<void> initialize() async {
    await _open();
  }

  /// Opens (or reuses) the database.
  Future<PowerSyncDatabase> _open({bool connectSync = true}) async {
    try {
      final currentDb = _db;
      if (currentDb != null) {
        return currentDb;
      }

      await close();

      final dbPath = await _databasePath();
      final db = PowerSyncDatabase(schema: schema, path: dbPath);

      await db.initialize();

      if (connectSync) {
        final connector = PowerSyncConnector();
        await db.connect(connector: connector);
        _logger.log('PowerSync sync stream connected');
      } else {
        _logger.log('PowerSync opened in offline mode');
      }
      _db = db;

      return db;
    } catch (e) {
      _logger.severe('Failed PowerSyncService open: $e');
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
    }
  }

  /// Returns the per-user database file path.
  static Future<String> _databasePath() async {
    final Directory dir;
    final filename = 'sabitou.db';

    if (kIsWeb) {
      return filename;
    } else {
      dir = await getApplicationDocumentsDirectory();
    }

    return p.join(dir.path, filename);
  }
}
