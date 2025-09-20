import 'dart:async';
import 'dart:typed_data';
import 'package:isar_community/isar.dart';

/// Fake isar collection.
class FakeIsarCollection<T> implements IsarCollection<T> {
  final List<T> _items = [];
  final _controller = StreamController<List<T>>.broadcast();

  @override
  Isar get isar => throw UnimplementedError();

  @override
  String get name => throw UnimplementedError();

  @override
  CollectionSchema<T> get schema => throw UnimplementedError();

  /// Find all objects.
  Future<List<T>> findAll() async => List.unmodifiable(_items);

  /// Put an object.
  @override
  Future<int> put(T obj) async {
    _items.add(obj);
    _controller.add(List.unmodifiable(_items));

    return _items.length;
  }

  @override
  Future<bool> delete(Id id) async {
    if (_items.isEmpty) return false;
    _items.removeAt(0);
    _controller.add(List.unmodifiable(_items));

    return true;
  }

  /// Watch collection.
  Stream<List<T>> watch({bool fireImmediately = false}) {
    if (fireImmediately) {
      Future.microtask(() => _controller.add(List.unmodifiable(_items)));
    }

    return _controller.stream;
  }

  @override
  Query<R> buildQuery<R>({
    List<WhereClause> whereClauses = const [],
    bool whereDistinct = false,
    Sort whereSort = Sort.asc,
    FilterOperation? filter,
    List<SortProperty> sortBy = const [],
    List<DistinctProperty> distinctBy = const [],
    int? offset,
    int? limit,
    String? property,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<void> clear() {
    _items.clear();
    _controller.add(List.unmodifiable(_items));

    return Future.value();
  }

  @override
  void clearSync() {
    _items.clear();
    _controller.add(List.unmodifiable(_items));
  }

  @override
  Future<int> count() {
    return Future.value(_items.length);
  }

  @override
  int countSync() {
    return _items.length;
  }

  @override
  Future<int> deleteAll(List<Id> ids) {
    throw UnimplementedError();
  }

  @override
  Future<int> deleteAllByIndex(String indexName, List<IndexKey> keys) {
    throw UnimplementedError();
  }

  @override
  int deleteAllByIndexSync(String indexName, List<IndexKey> keys) {
    throw UnimplementedError();
  }

  @override
  int deleteAllSync(List<Id> ids) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteByIndex(String indexName, IndexKey key) {
    throw UnimplementedError();
  }

  @override
  bool deleteByIndexSync(String indexName, IndexKey key) {
    throw UnimplementedError();
  }

  @override
  bool deleteSync(Id id) {
    throw UnimplementedError();
  }

  @override
  QueryBuilder<T, T, QFilterCondition> filter() {
    throw UnimplementedError();
  }

  @override
  Future<T?> get(Id id) {
    throw UnimplementedError();
  }

  @override
  Future<List<T?>> getAll(List<Id> ids) {
    throw UnimplementedError();
  }

  @override
  Future<List<T?>> getAllByIndex(String indexName, List<IndexKey> keys) {
    throw UnimplementedError();
  }

  @override
  List<T?> getAllByIndexSync(String indexName, List<IndexKey> keys) {
    throw UnimplementedError();
  }

  @override
  List<T?> getAllSync(List<Id> ids) {
    throw UnimplementedError();
  }

  @override
  Future<T?> getByIndex(String indexName, IndexKey key) {
    throw UnimplementedError();
  }

  @override
  T? getByIndexSync(String indexName, IndexKey key) {
    throw UnimplementedError();
  }

  @override
  Future<int> getSize({
    bool includeIndexes = false,
    bool includeLinks = false,
  }) {
    throw UnimplementedError();
  }

  @override
  int getSizeSync({bool includeIndexes = false, bool includeLinks = false}) {
    throw UnimplementedError();
  }

  @override
  T? getSync(Id id) {
    throw UnimplementedError();
  }

  @override
  Future<void> importJson(List<Map<String, dynamic>> json) {
    throw UnimplementedError();
  }

  @override
  Future<void> importJsonRaw(Uint8List jsonBytes) {
    throw UnimplementedError();
  }

  @override
  void importJsonRawSync(Uint8List jsonBytes) {
    throw UnimplementedError();
  }

  @override
  void importJsonSync(List<Map<String, dynamic>> json) {
    throw UnimplementedError();
  }

  @override
  Future<List<Id>> putAll(List<T> objects) {
    throw UnimplementedError();
  }

  @override
  Future<List<Id>> putAllByIndex(String indexName, List<T> objects) {
    throw UnimplementedError();
  }

  @override
  List<Id> putAllByIndexSync(
    String indexName,
    List<T> objects, {
    bool saveLinks = true,
  }) {
    throw UnimplementedError();
  }

  @override
  List<Id> putAllSync(List<T> objects, {bool saveLinks = true}) {
    throw UnimplementedError();
  }

  @override
  Future<Id> putByIndex(String indexName, T object) {
    throw UnimplementedError();
  }

  @override
  Id putByIndexSync(String indexName, T object, {bool saveLinks = true}) {
    throw UnimplementedError();
  }

  @override
  Id putSync(T object, {bool saveLinks = true}) {
    throw UnimplementedError();
  }

  @override
  Future<void> verify(List<T> objects) {
    throw UnimplementedError();
  }

  @override
  Future<void> verifyLink(
    String linkName,
    List<int> sourceIds,
    List<int> targetIds,
  ) {
    throw UnimplementedError();
  }

  @override
  Stream<void> watchLazy({bool fireImmediately = false}) {
    throw UnimplementedError();
  }

  @override
  Stream<T?> watchObject(Id id, {bool fireImmediately = false}) {
    throw UnimplementedError();
  }

  @override
  Stream<void> watchObjectLazy(Id id, {bool fireImmediately = false}) {
    throw UnimplementedError();
  }

  @override
  QueryBuilder<T, T, QWhere> where({
    bool distinct = false,
    Sort sort = Sort.asc,
  }) {
    throw UnimplementedError();
  }
}
