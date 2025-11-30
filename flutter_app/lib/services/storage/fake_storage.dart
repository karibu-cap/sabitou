import 'app_storage.dart';

/// The fake storage service.
class FakeStorageService<T> implements AppStorageService<T> {
  final Map<String, T> _storage = {};

  @override
  Future<void> write(String key, T value) async {
    _storage[key] = value;
  }

  @override
  Future<T?> read(String key) async {
    return _storage[key];
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
    return _storage.values.toList();
  }

  @override
  Future<bool> hasData(String key) async {
    return _storage.containsKey(key);
  }

  @override
  Future<Map<dynamic, T>> getAllMap() async {
    return _storage;
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    _storage.removeWhere((key, value) => keys.contains(key));
  }
}
