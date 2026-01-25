import 'app_storage.dart';

/// The fake storage service.
class FakeStorageService<T> implements AppStorageService<T> {
  final Map<String, dynamic> _storage;

  /// Constructor of new [FakeStorageService].
  FakeStorageService({required Map<String, dynamic> initialStorage})
    : _storage = initialStorage;

  @override
  Future<void> write(String key, T value) async {
    _storage[key] = value;
  }

  @override
  Future<T?> read(String key) async {
    return _storage[key] as T?;
  }

  @override
  Future<void> remove(String key) async {
    _storage.remove(key);
  }

  @override
  Future<void> clear() async {
    _storage.clear();
  }

  @override
  Future<List<T>> getAll() async {
    return _storage.values.cast<T>().toList();
  }

  @override
  Future<bool> hasData(String key) async {
    return _storage.containsKey(key);
  }

  @override
  Future<Map<dynamic, T>> getAllMap() async {
    return _storage.cast<dynamic, T>();
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    _storage.removeWhere((key, value) => keys.contains(key));
  }
}
