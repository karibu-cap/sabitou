import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/storage/app_storage.dart';
import 'app_constants.dart';

/// The user preferences.
class UserPreferences extends ChangeNotifier {
  /// The current user.
  User? _user;

  /// Currents user business.
  Business? business;

  /// Currents user business member.
  BusinessMember? businessMember;

  /// Currents user store.
  Store? store;

  /// Currents user store member.
  StoreMember? storeMember;

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
    businessMember = storage.read<BusinessMember>(
      CollectionName.businessMembers,
    );
    store = storage.read<Store>(CollectionName.stores);
    storeMember = storage.read<StoreMember>(CollectionName.storeMembers);
  }

  /// Save user preferences.
  Future<void> saveUserPreferences({required User user}) async {
    final storage = AppStorageService.to;
    await storage.write<User>(CollectionName.users, user);

    _user = user;
  }

  /// Save business preferences.
  Future<void> saveBusinessPreferences({required Business newBusiness}) async {
    final storage = AppStorageService.to;
    await storage.write<Business>(CollectionName.businesses, newBusiness);

    business = newBusiness;
    notifyListeners();
  }

  /// Save business member preferences.
  Future<void> saveBusinessMemberPreferences({
    required BusinessMember newBusinessMember,
  }) async {
    final storage = AppStorageService.to;
    await storage.write<BusinessMember>(
      CollectionName.businessMembers,
      newBusinessMember,
    );

    businessMember = newBusinessMember;
    notifyListeners();
  }

  /// Save store preferences.
  Future<void> saveStorePreferences({required Store newStore}) async {
    final storage = AppStorageService.to;
    await storage.write<Store>(CollectionName.stores, newStore);

    store = newStore;
    notifyListeners();
  }

  /// Save store member preferences.
  Future<void> saveStoreMemberPreferences({
    required StoreMember newStoreMember,
  }) async {
    final storage = AppStorageService.to;
    await storage.write<StoreMember>(
      CollectionName.storeMembers,
      newStoreMember,
    );

    storeMember = newStoreMember;
    notifyListeners();
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
