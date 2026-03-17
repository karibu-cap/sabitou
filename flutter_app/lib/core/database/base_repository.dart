import 'local_data_source.dart';
import 'query/sql_condition.dart';

/// The [BaseRepository] class.
abstract class BaseRepository<T> {
  /// The [LocalDataSource] implementation.
  LocalDataSource get dataSource;

  /// The table name.
  String get tableName;

  /// The primary key.
  String get primaryKey => 'id';

  /// The columns.
  List<String>? get columns => null;

  /// Convert a [RawRow] to an entity.
  T fromRow(RawRow row);

  /// Convert an entity to a [RawRow].
  RawRow toRow(T entity);

  /// Find an entity by its id.
  Future<T?> findById(String id) async {
    final row = await dataSource.getDocument(
      tableName,
      id,
      primaryKey: primaryKey,
      columns: columns,
    );

    return row != null ? fromRow(row) : null;
  }

  /// Find all entities.
  Future<List<T>> findAll({SqlOrderBy? orderBy}) async {
    final rows = await dataSource.getCollection(
      tableName,
      orderBy: orderBy,
      columns: columns,
    );

    return rows.map(fromRow).toList();
  }

  /// Find entities by a list of filters.
  Future<List<T>> findWhere(
    List<SqlQuery> filters, {
    SqlOrderBy? orderBy,
    int? limit,
  }) async {
    final rows = await dataSource.getCollection(
      tableName,
      filters: filters,
      orderBy: orderBy,
      limit: limit,
      columns: columns,
    );

    return rows.map(fromRow).toList();
  }

  /// Streams reactive.
  Stream<List<T>> watchAll({SqlOrderBy? orderBy}) {
    return dataSource
        .watchCollection(tableName, orderBy: orderBy, columns: columns)
        .map((rows) => rows.map(fromRow).toList());
  }

  /// Streams reactive.
  Stream<List<T>> watchWhere(List<SqlQuery> filters, {SqlOrderBy? orderBy}) {
    return dataSource
        .watchCollection(tableName, filters: filters, orderBy: orderBy)
        .map((rows) => rows.map(fromRow).toList());
  }

  /// Streams reactive.
  Stream<T?> watchOne(String id) {
    return dataSource
        .watchDocument(tableName, id, primaryKey: primaryKey)
        .map((row) => row != null ? fromRow(row) : null);
  }

  /// Save an entity.
  Future<void> save(T entity) =>
      dataSource.setRecord(table: tableName, record: toRow(entity));

  /// Save a list of entities.
  Future<void> saveAll(List<T> entities) => dataSource.setRecords(
    table: tableName,
    records: entities.map(toRow).toList(),
  );

  /// Delete an entity.
  Future<void> delete(String id) =>
      dataSource.deleteRecord(table: tableName, id: id, primaryKey: primaryKey);
}
