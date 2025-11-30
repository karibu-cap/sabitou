import 'package:hive_ce_flutter/adapters.dart';

import '../../utils/logger.dart';
import 'fake_storage.dart';
import 'hive_ce/hive_adapters.dart';
import 'hive_ce/hive_storage.dart';

/// The type of app storage service.
enum AppStorageType {
  /// The fake storage service.
  fake,

  /// The hive storage service.
  hiveStorage,
}

/// The app storage service.
abstract class AppStorageService<T> {
  /// Writes data on your container.
  Future<void> write(String key, T value);

  /// Reads data from your container.
  Future<T?> read(String key);

  /// Removes data from your container.
  Future<void> remove(String key);

  /// Gets all data.
  Future<List<T>> getAll();

  /// Clears all data from your container.
  Future<void> clear();

  /// Whether there is data in your container with the given key.
  Future<bool> hasData(String key);

  /// Gets all map data.
  Future<Map<dynamic, T>> getAllMap();

  /// Removes data from your container.
  Future<void> deleteAll(List<String> keys);
}

/// The app storage.
class AppStorage {
  static final _logger = LoggerApp('AppStorage');
  static final Map<Type, AppStorageService> _instances = {};
  static AppStorageType? _storageType;
  static bool _isInitialized = false;

  /// Initializes the app storage.
  static Future<void> initialize(AppStorageType type) async {
    if (_isInitialized) {
      _logger.info('AppStorage already initialized');

      return;
    }

    _storageType = type;

    // Initialize Hive if needed.
    if (type == AppStorageType.hiveStorage) {
      await Hive.initFlutter();
      registerProtobufAdapters();
    }

    _isInitialized = true;
  }

  /// Retrieves or creates an instance for a given type.
  static AppStorageService<T> of<T>({String? boxKey}) {
    if (!_isInitialized) {
      throw StateError('AppStorage must be initialized with initialize()');
    }

    // Verify if an instance already exists for this type.
    if (_instances.containsKey(T)) {
      return _instances[T] as AppStorageService<T>;
    }

    // Creates a new instance.
    final key = boxKey ?? T.toString().toLowerCase();
    final AppStorageService<T> instance;
    final storageType = _storageType;

    if (storageType == null) {
      throw StateError('AppStorage must be initialized with initialize()');
    }

    switch (storageType) {
      case AppStorageType.fake:
        instance = FakeStorageService<T>();
        break;
      case AppStorageType.hiveStorage:
        instance = HiveStorageService<T>(boxKey: key);
        break;
    }

    _instances[T] = instance;

    return instance;
  }

  /// Resets all instances (useful for tests)
  static Future<void> reset() async {
    for (var instance in _instances.values) {
      await instance.clear();
    }
    _instances.clear();
    _isInitialized = false;
    _storageType = null;
  }
}
