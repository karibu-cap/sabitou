import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/storage/app_storate.dart';

/// The user preferences.
class UserPreferences extends GetxService {
  /// The current user.
  User? _user;

  /// Currents user business.
  Business? business;

  /// Currents user store.
  Store? store;

  /// The singleton instance.
  static UserPreferences get instance => Get.find();

  /// The current user.
  User? get user => _user;

  @override
  void onInit() {
    super.onInit();
    loadUserPreferences();
  }

  /// Load user preferences.
  Future<void> loadUserPreferences() async {
    final storage = AppStorageService.to;
    _user = storage.read<User>('user');
  }

  /// Save user preferences.
  Future<void> saveUserPreferences({
    required User user,
  }) async {
    final storage = AppStorageService.to;
    await storage.write('user', user);

    _user = user;
  }

  /// Clear user preferences.
  Future<void> clearUserPreferences() async {
    final storage = AppStorageService.to;
    await storage.remove('user');

    _user = null;
  }
}
