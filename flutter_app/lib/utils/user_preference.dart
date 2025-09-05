import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/storage/app_storate.dart';
import 'app_constants.dart';

/// The user preferences.
class UserPreferences extends ChangeNotifier {
  /// The current user.
  User? _user;

  /// Currents user business.
  Business? business;

  /// Currents user store.
  Store? store;

  /// The singleton instance.
  static UserPreferences get instance => GetIt.I.get<UserPreferences>();

  /// The current user.
  User? get user => _user;

  /// Currents user business.
  UserPreferences() {
    loadUserPreferences();
  }

  /// Load user preferences.
  Future<void> loadUserPreferences() async {
    final storage = AppStorageService.to;
    _user = storage.read<User>(CollectionName.users);
    business = storage.read<Business>(CollectionName.businesses);
    store = storage.read<Store>(CollectionName.stores);
  }

  /// Save user preferences.
  Future<void> saveUserPreferences({required User user}) async {
    final storage = AppStorageService.to;
    await storage.write(CollectionName.users, user);

    _user = user;
  }

  /// Clear user preferences.
  Future<void> clearUserPreferences() async {
    final storage = AppStorageService.to;
    await storage.remove(CollectionName.users);
    await storage.remove(CollectionName.businesses);
    await storage.remove(CollectionName.stores);

    _user = null;
    business = null;
    store = null;
  }
}
