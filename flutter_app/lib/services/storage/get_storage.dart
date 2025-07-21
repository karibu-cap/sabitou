import 'package:get_storage/get_storage.dart';

import 'app_storate.dart';

/// The get storage service.
class GetStorageService implements AppStorageService {
  final GetStorage _box = GetStorage();

  @override
  Future<void> write(String key, dynamic value) async {
    await _box.write(key, value);
  }

  @override
  T? read<T>(String key) {
    return _box.read<T>(key);
  }

  @override
  Future<void> remove(String key) async {
    await _box.remove(key);
  }

  @override
  Future<void> clear() async {
    await _box.erase();
  }

  @override
  bool hasData(String key) {
    return _box.hasData(key);
  }

  @override
  T getValues<T>() {
    return _box.getValues<T>();
  }

  @override
  T getKeys<T>() {
    return _box.getKeys<T>();
  }
}
