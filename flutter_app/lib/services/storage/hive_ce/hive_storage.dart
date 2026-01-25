import 'package:hive_ce/hive.dart';

import '../app_storage.dart';

/// The get storage service.
class HiveStorageService<T> implements AppStorageService<T> {
  late Box<T> _box;
  final String _boxKey;
  bool _isInitialized = false;

  /// Constructor of new [HiveStorageService].
  HiveStorageService({required String boxKey}) : _boxKey = boxKey {
    _initBox();
  }

  Future<void> _initBox() async {
    if (_isInitialized) return;

    _box = !Hive.isBoxOpen(_boxKey)
        ? await Hive.openBox<T>(_boxKey)
        : Hive.box<T>(_boxKey);

    _isInitialized = true;
  }

  Future<void> _ensureInitialized() async {
    if (!_isInitialized) {
      await _initBox();
    }
  }

  @override
  Future<void> write(String key, T value) async {
    await _ensureInitialized();

    await _box.put(key, value);
  }

  @override
  Future<List<T>> getAll() async {
    await _ensureInitialized();

    return _box.values.toList();
  }

  @override
  Future<Map<dynamic, T>> getAllMap() async {
    await _ensureInitialized();

    return _box.toMap();
  }

  @override
  Future<T?> read(String key) async {
    await _ensureInitialized();

    return _box.get(key);
  }

  @override
  Future<void> remove(String key) async {
    await _ensureInitialized();
    await _box.delete(key);
  }

  @override
  Future<void> deleteAll(List<String> keys) async {
    await _ensureInitialized();
    await _box.deleteAll(keys);
  }

  @override
  Future<void> clear() async {
    await _ensureInitialized();
    await _box.clear();
  }

  @override
  Future<bool> hasData(String key) async {
    await _ensureInitialized();

    return _box.containsKey(key);
  }
}
