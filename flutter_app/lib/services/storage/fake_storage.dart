import 'app_storate.dart';

/// The fake storage service.
class FakeStorageService implements AppStorageService {
  final Map<String, dynamic> _storage;

  /// The fake storage service.
  FakeStorageService({Map<String, dynamic>? storage})
    : _storage = storage ?? {};

  @override
  Future<void> write(String key, dynamic value) async {
    _storage[key] = value;
  }

  @override
  T? read<T>(String key) {
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
  T getKeys<T>() {
    return _storage.keys.toList() as T;
  }

  @override
  T getValues<T>() {
    return _storage.values.toList() as T;
  }

  @override
  bool hasData(String key) {
    return _storage.containsKey(key);
  }
}
