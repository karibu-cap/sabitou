import 'query/sql_condition.dart';
import 'query/sql_join.dart';

/// Résultat paginé
class PagedResult<T> {
  /// The [items].
  final List<T> items;

  /// Whether the page has mode [items].
  final bool hasMore;

  /// The total item count.
  final int totalCount;

  /// Constructor of new [PagedResult].
  const PagedResult({
    required this.items,
    required this.hasMore,
    required this.totalCount,
  });
}

/// Résultat d'une query avec projection custom (JOIN, COUNT, etc.).
typedef RawRow = Map<String, dynamic>;

/// The [LocalDataSource] interface.
abstract interface class LocalDataSource {
  /// Get a collection of rows.
  Future<List<RawRow>> getCollection(
    String table, {
    List<dynamic> filters = const [],
    SqlOrderBy? orderBy,
    int? limit,
    int? offset,
    List<String>? columns, // null = SELECT *
  });

  /// Get a document by its id.
  Future<RawRow?> getDocument(
    String table,
    String id, {
    String primaryKey = 'id',
    List<String>? columns,
  });

  /// Get a collection of rows with a custom query.
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
  });

  /// Execute a raw SQL query.
  Future<List<RawRow>> executeRaw(String sql, [List<Object?> args = const []]);

  /// Count rows in a table.
  Future<int> count(
    String table, {
    List<dynamic> filters = const [],
    String? countColumn, // null = COUNT(*)
  });

  /// Count rows in a table grouped by a column.
  Future<Map<String, int>> countGroupedBy(
    String table,
    String groupColumn, {
    List<dynamic> filters = const [],
  });

  /// Streams reactive.
  Stream<List<RawRow>> watchCollection(
    String table, {
    List<dynamic> filters = const [],
    SqlOrderBy? orderBy,
    int? limit,
    List<String>? columns,
  });

  /// Streams reactive.
  Stream<RawRow?> watchDocument(
    String table,
    String id, {
    String primaryKey = 'id',
  });

  /// Streams reactive.
  Stream<List<RawRow>> watchJoinedCollection({
    required String table,
    required String tableAlias,
    required List<SqlJoin> joins,
    List<dynamic> filters = const [],
    List<String> extraColumns = const [],
    SqlOrderBy? orderBy,
    String? groupBy,
  });

  /// Streams reactive.
  Stream<List<RawRow>> watchRaw(String sql, [List<Object?> args = const []]);

  /// Writes data to the database.
  Future<void> setRecord({
    required String table,
    required Map<String, dynamic> record,
    List<String> conflictColumns = const ['id'],
  });

  /// Writes lust of data to the database.
  Future<void> setRecords({
    required String table,
    required List<Map<String, dynamic>> records,
    bool replace = true,
  });

  /// Creates a record.
  Future<String> createRecord({
    required String table,
    required Map<String, dynamic> record,
    String primaryKey = 'id',
  });

  /// Updates a record.
  Future<void> updateRecord({
    required String table,
    required String id,
    required Map<String, dynamic> fields,
    String primaryKey = 'id',
  });

  /// Deletes a record.
  Future<void> deleteRecord({
    required String table,
    required String id,
    String primaryKey = 'id',
  });

  /// Deletes records.
  Future<void> deleteWhere({
    required String table,
    required List<dynamic> filters,
  });

  /// The [LocalDataSource] implementation.
  Future<T> runTransaction<T>(Future<T> Function(LocalDataSource tx) action);
}
