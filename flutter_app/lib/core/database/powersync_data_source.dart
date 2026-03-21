// flutter_app/lib/services/powersync/powersync_data_source.dart

import 'package:powersync/powersync.dart';
import 'package:powersync/sqlite_async.dart';
import 'package:uuid/uuid.dart';

import 'local_data_source.dart';
import 'query/sql_condition.dart';
import 'query/sql_join.dart';

/// The [PowerSyncDataSource].
class PowerSyncDataSource implements LocalDataSource {
  final PowerSyncDatabase Function() _dbProvider;

  PowerSyncDatabase get _db => _dbProvider();

  /// Constructor of new [PowerSyncDataSource].
  const PowerSyncDataSource(this._dbProvider);

  // ---------------------------------------------------------------------------
  // Reads
  // ---------------------------------------------------------------------------

  @override
  Future<List<RawRow>> getCollection(
    String table, {
    List<dynamic> filters = const [],
    SqlOrderBy? orderBy,
    int? limit,
    int? offset,
    List<String>? columns,
  }) async {
    final select = columns != null ? columns.join(', ') : '*';
    final (where, args) = _buildWhere(filters);
    final order = orderBy != null ? 'ORDER BY ${orderBy.toSql()}' : '';
    final lim = limit != null ? 'LIMIT $limit' : '';
    final off = offset != null ? 'OFFSET $offset' : '';

    return _db.getAll(
      'SELECT $select FROM $table $where $order $lim $off'.trim(),
      args,
    );
  }

  @override
  Future<RawRow?> getDocument(
    String table,
    String id, {
    String primaryKey = 'id',
    List<String>? columns,
  }) async {
    final select = columns != null ? columns.join(', ') : '*';
    final rows = await _db.getAll(
      'SELECT $select FROM $table WHERE $primaryKey = ? LIMIT 1',
      [id],
    );

    return rows.firstOrNull;
  }

  @override
  Future<List<RawRow>> getJoinedCollection({
    required String table,
    required String tableAlias,
    required List<SqlJoin> joins,
    List<dynamic> filters = const [],
    List<String> extraColumns = const [],
    SqlOrderBy? orderBy,
    String? groupBy,
    String? having,
    int? limit,
  }) async {
    final (sql, args) = _buildJoinedSql(
      table: table,
      tableAlias: tableAlias,
      joins: joins,
      filters: filters,
      extraColumns: extraColumns,
      orderBy: orderBy,
      groupBy: groupBy,
      having: having,
      limit: limit,
    );

    return _db.getAll(sql, args);
  }

  @override
  Future<List<RawRow>> executeRaw(
    String sql, [
    List<Object?> args = const [],
  ]) => _db.getAll(sql, args);

  @override
  Future<int> count(
    String table, {
    List<dynamic> filters = const [],
    String? countColumn,
  }) async {
    final col = countColumn != null ? 'COUNT($countColumn)' : 'COUNT(*)';
    final (where, args) = _buildWhere(filters);
    final rows = await _db.getAll(
      'SELECT $col AS total FROM $table $where'.trim(),
      args,
    );

    return (rows.firstOrNull?['total'] as num?)?.toInt() ?? 0;
  }

  @override
  Future<Map<String, int>> countGroupedBy(
    String table,
    String groupColumn, {
    List<dynamic> filters = const [],
  }) async {
    final (where, args) = _buildWhere(filters);
    final rows = await _db.getAll(
      'SELECT $groupColumn, COUNT(*) AS total FROM $table $where GROUP BY $groupColumn'
          .trim(),
      args,
    );

    return {
      for (final row in rows)
        row[groupColumn].toString(): (row['total'] as num).toInt(),
    };
  }

  @override
  Stream<List<RawRow>> watchCollection(
    String table, {
    List<dynamic> filters = const [],
    SqlOrderBy? orderBy,
    int? limit,
    List<String>? columns,
  }) {
    final select = columns != null ? columns.join(', ') : '*';
    final (where, args) = _buildWhere(filters);
    final order = orderBy != null ? 'ORDER BY ${orderBy.toSql()}' : '';
    final lim = limit != null ? 'LIMIT $limit' : '';

    return _db.watch(
      'SELECT $select FROM $table $where $order $lim'.trim(),
      parameters: args,
    );
  }

  @override
  Stream<RawRow?> watchDocument(
    String table,
    String id, {
    String primaryKey = 'id',
  }) {
    return _db
        .watch(
          'SELECT * FROM $table WHERE $primaryKey = ? LIMIT 1',
          parameters: [id],
        )
        .map((rows) => rows.firstOrNull);
  }

  @override
  Stream<List<RawRow>> watchJoinedCollection({
    required String table,
    required String tableAlias,
    required List<SqlJoin> joins,
    List<dynamic> filters = const [],
    List<String> extraColumns = const [],
    SqlOrderBy? orderBy,
    String? groupBy,
  }) {
    final (sql, args) = _buildJoinedSql(
      table: table,
      tableAlias: tableAlias,
      joins: joins,
      filters: filters,
      extraColumns: extraColumns,
      orderBy: orderBy,
      groupBy: groupBy,
    );

    return _db.watch(sql, parameters: args);
  }

  @override
  Stream<List<RawRow>> watchRaw(String sql, [List<Object?> args = const []]) =>
      _db.watch(sql, parameters: args);

  @override
  Future<void> setRecord({
    required String table,
    required Map<String, dynamic> record,
    List<String> conflictColumns = const ['id'],
  }) async {
    if (record.isEmpty) return;

    final cols = record.keys.join(', ');
    final placeholders = List.filled(record.length, '?').join(', ');
    final conflictTarget = conflictColumns.join(', ');

    final updateSet = record.keys
        .where((key) => !conflictColumns.contains(key))
        .map((key) => '$key = excluded.$key')
        .join(', ');

    final sql =
        '''
    INSERT INTO $table ($cols) 
    VALUES ($placeholders)
    ON CONFLICT($conflictTarget) DO UPDATE SET $updateSet
  ''';
    await _db.execute(sql, record.values.toList());
  }

  @override
  Future<void> setRecords({
    required String table,
    required List<Map<String, dynamic>> records,
    bool replace = true,
  }) async {
    if (records.isEmpty) return;
    await _db.writeTransaction((tx) async {
      final verb = replace ? 'INSERT OR REPLACE' : 'INSERT OR IGNORE';
      for (final record in records) {
        final cols = record.keys.join(', ');
        final placeholders = List.filled(record.length, '?').join(', ');
        await tx.execute(
          '$verb INTO $table ($cols) VALUES ($placeholders)',
          record.values.toList(),
        );
      }
    });
  }

  @override
  Future<String> createRecord({
    required String table,
    required Map<String, dynamic> record,
    String primaryKey = 'id',
  }) async {
    final id = record[primaryKey] as String? ?? const Uuid().v4();
    final withId = {...record, primaryKey: id};
    final cols = withId.keys.join(', ');
    final placeholders = List.filled(withId.length, '?').join(', ');
    await _db.execute(
      'INSERT INTO $table ($cols) VALUES ($placeholders)',
      withId.values.toList(),
    );

    return id;
  }

  @override
  Future<void> updateWhere({
    required String table,
    required Map<String, dynamic> fields,
    required List<dynamic> filters,
  }) async {
    if (filters.isEmpty) {
      throw Exception(
        'updateWhere called without any filters — refusing to UPDATE entire table',
      );
    }
    if (fields.isEmpty) return;

    // Remove PowerSync's internal `id` column from the SET clause.
    // PowerSync manages `id` — attempting to set it causes a constraint error.
    // Also remove any field whose value is null to avoid overwriting existing
    // data with nulls when only partial updates are intended.
    final safeFields = Map<String, dynamic>.fromEntries(
      fields.entries.where((e) => e.key != 'id' && e.value != null),
    );
    if (safeFields.isEmpty) return;

    final sets = safeFields.keys.map((k) => '$k = ?').join(', ');
    final (where, whereArgs) = _buildWhere(filters);

    await _db.execute('UPDATE $table SET $sets $where'.trim(), [
      ...safeFields.values,
      ...whereArgs,
    ]);
  }

  @override
  Future<void> deleteRecord({
    required String table,
    required String id,
    String primaryKey = 'id',
  }) => _db.execute('DELETE FROM $table WHERE $primaryKey = ?', [id]);

  @override
  Future<void> deleteWhere({
    required String table,
    required List<dynamic> filters,
  }) async {
    if (filters.isEmpty) {
      throw Exception(
        'deleteWhere called without any filters — refusing to DELETE entire table',
      );
    }
    final (where, args) = _buildWhere(filters);
    await _db.execute('DELETE FROM $table $where'.trim(), args);
  }

  @override
  Future<T> runTransaction<T>(Future<T> Function(LocalDataSource tx) action) =>
      _db.writeTransaction((tx) => action(_TransactionDataSource(tx)));

  (String, List<Object?>) _buildJoinedSql({
    required String table,
    required String tableAlias,
    required List<SqlJoin> joins,
    List<dynamic> filters = const [],
    List<String> extraColumns = const [],
    SqlOrderBy? orderBy,
    String? groupBy,
    String? having,
    int? limit,
  }) {
    final allColumns = [
      if (extraColumns.isEmpty)
        '$tableAlias.*'
      else
        ...extraColumns.map((c) => '$tableAlias.$c'),
      ...joins.expand((j) => j.aliasedColumns),
    ];

    final select = allColumns.join(', ');
    final joinClauses = joins.map((j) => j.toSql()).join(' ');
    final (where, args) = _buildWhere(filters, tableAlias);
    final order = orderBy != null
        ? 'ORDER BY ${orderBy.toSql(tableAlias)}'
        : '';
    final group = groupBy != null ? 'GROUP BY $groupBy' : '';
    final hav = having != null ? 'HAVING $having' : '';
    final lim = limit != null ? 'LIMIT $limit' : '';

    final sql =
        'SELECT $select FROM $table $tableAlias $joinClauses $where $group $hav $order $lim';

    return (sql.trim().replaceAll(RegExp(r'\s+'), ' '), args);
  }
}

class _TransactionDataSource implements LocalDataSource {
  final SqliteWriteContext _tx;
  const _TransactionDataSource(this._tx);

  @override
  Future<String> createRecord({
    required String table,
    required Map<String, dynamic> record,
    String primaryKey = 'id',
  }) async {
    final id = record[primaryKey] as String? ?? const Uuid().v4();
    final withId = {...record, primaryKey: id};
    final cols = withId.keys.join(', ');
    final placeholders = List.filled(withId.length, '?').join(', ');
    await _tx.execute(
      'INSERT INTO $table ($cols) VALUES ($placeholders)',
      withId.values.toList(),
    );

    return id;
  }

  @override
  Future<void> updateWhere({
    required String table,
    required Map<String, dynamic> fields,
    required List<dynamic> filters,
  }) async {
    if (filters.isEmpty) {
      throw Exception('updateWhere called without filters inside transaction');
    }
    if (fields.isEmpty) return;

    // Strip PowerSync-managed `id` and null values from SET clause.
    final safeFields = Map<String, dynamic>.fromEntries(
      fields.entries.where((e) => e.key != 'id' && e.value != null),
    );
    if (safeFields.isEmpty) return;

    final sets = safeFields.keys.map((k) => '$k = ?').join(', ');
    final (where, whereArgs) = _buildWhere(filters);
    await _tx.execute('UPDATE $table SET $sets $where'.trim(), [
      ...safeFields.values,
      ...whereArgs,
    ]);
  }

  @override
  Future<void> deleteRecord({
    required String table,
    required String id,
    String primaryKey = 'id',
  }) => _tx.execute('DELETE FROM $table WHERE $primaryKey = ?', [id]);

  @override
  Future<void> setRecord({
    required String table,
    required Map<String, dynamic> record,
    List<String> conflictColumns = const ['id'],
  }) async {
    if (record.isEmpty) return;
    final cols = record.keys.join(', ');
    final placeholders = List.filled(record.length, '?').join(', ');
    final conflictTarget = conflictColumns.join(', ');
    final updateSet = record.keys
        .where((key) => !conflictColumns.contains(key))
        .map((key) => '$key = excluded.$key')
        .join(', ');
    final sql =
        '''
        INSERT INTO $table ($cols)
        VALUES ($placeholders)
        ON CONFLICT($conflictTarget) DO UPDATE SET $updateSet
      ''';
    await _tx.execute(sql, record.values.toList());
  }

  // Reads and streaming are not available inside a write transaction.
  @override
  Never noSuchMethod(Invocation i) => throw UnsupportedError(
    '${i.memberName} is not supported inside a write transaction',
  );
}

// ---------------------------------------------------------------------------
// WHERE clause builder
// ---------------------------------------------------------------------------

(String, List<Object?>) _buildWhere(
  List<dynamic> filters, [
  String? tableAlias,
]) {
  if (filters.isEmpty) return ('', []);

  final clauses = <String>[];
  final args = <Object?>[];

  for (final filter in filters) {
    if (filter is SqlQuery) {
      final (clause, fArgs) = filter.toSql(tableAlias);
      clauses.add(clause);
      args.addAll(fArgs);
    } else if (filter is SqlOrGroup) {
      final (clause, fArgs) = filter.toSql(tableAlias);
      clauses.add(clause);
      args.addAll(fArgs);
    }
  }

  return ('WHERE ${clauses.join(' AND ')}', args);
}
