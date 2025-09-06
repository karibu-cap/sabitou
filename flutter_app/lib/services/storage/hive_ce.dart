import 'package:flutter/widgets.dart';
import 'package:hive_ce/hive.dart';

import 'app_storage.dart';

/// The get storage service.
class HiveCeService<T> implements AppStorageService {
  final Box _box = Hive.box('app');

  @override
  Future<void> write(String key, dynamic value) async {
    await _box.put(key, value);
  }

  @override
  T? read<T>(String key) {
    final value = _box.get(key);
    if (value == null) {
      return null;
    }
    if (value is T) {
      return value;
    }
    if (value is String) {
      try {
        return (T as dynamic).fromJson(value) as T;
      } catch (e) {
        debugPrint('$e');

        return null;
      }
    }

    return null;
  }

  @override
  Future<void> remove(String key) async {
    await _box.delete(key);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }

  @override
  bool hasData(String key) {
    return _box.containsKey(key);
  }
}
