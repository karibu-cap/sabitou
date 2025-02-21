import 'package:get/get.dart';

import 'fake_storage.dart';
import 'get_storage.dart';

/// The type of app storage service.
enum AppStorageType {
  /// The fake storage service.
  fake,

  /// The get storage service.
  getStorage
}

/// The app storage service.
abstract class AppStorageService {
  /// Direct access to the app storage service.
  static AppStorageService get to => Get.find();

  /// Writes data on your container.
  Future<void> write(String key, dynamic value);

  /// Reads data from your container.
  T? read<T>(String key);

  /// Removes data from your container.
  Future<void> remove(String key);

  /// Clears all data from your container.
  Future<void> clear();

  /// Whether there is data in your container with the given key.
  bool hasData(String key);

  /// Retrieves all values from your container.
  T getValues<T>();

  /// Retrieves all keys from your container.
  T getKeys<T>();

  /// Writes data only if data is null.
  Future<void> writeIfNull<T>(String key, T value);

  /// Writes data in memory.
  void writeInMemory<T>(String key, T value);

  /// Creates a new instance of the app storage service.
  factory AppStorageService(
    AppStorageType type, [
    Map<String, dynamic>? storage,
  ]) {
    switch (type) {
      case AppStorageType.fake:
        return FakeStorageService(storage: storage);
      case AppStorageType.getStorage:
        return GetStorageService();
    }
  }
}
