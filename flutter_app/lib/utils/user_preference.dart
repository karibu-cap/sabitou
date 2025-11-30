import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../repositories/business_repository.dart';
import '../repositories/stores_repository.dart';
import '../repositories/users_repository.dart';
import '../services/storage/app_storage.dart';
import 'app_constants.dart';

/// The user preferences.
class UserPreferences extends ChangeNotifier {
  /// The current user.
  User? _user;

  /// The user id.
  final String? userId;

  bool _isLoading = false;

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

  /// Whether we load a data.
  bool get isLoading => _isLoading;

  /// Currents user business.
  UserPreferences(this.userId) {
    loadUserPreferences(userId);
  }

  /// Load user preferences.
  Future<void> loadUserPreferences(String? userId) async {
    _isLoading = true;
    notifyListeners();

    try {
      if (userId == null) {
        await _loadSavePrefreferences();

        return;
      }

      final newUser = await UserRepository.instance.getUser(
        GetUserRequest(userId: userId),
      );

      if (newUser == null) {
        await _loadSavePrefreferences();

        return;
      }

      _user = newUser;
      userId = newUser.refId;
      await AppStorage.of<User>().write(CollectionName.users, newUser);

      final userBusiness = await BusinessRepository.instance.getMyBusinesses(
        newUser.refId,
      );
      final newBusiness = userBusiness.firstOrNull;

      if (newBusiness == null) {
        return;
      }

      await AppStorage.of<Business>().write(
        CollectionName.businesses,
        newBusiness,
      );

      final [
        newBusinessMember as BusinessMember?,
        storeByBusiness as List<Store>,
      ] = await Future.wait([
        BusinessRepository.instance.getBusinessMember(
          newBusiness.refId,
          newUser.refId,
        ),
        StoresRepository.instance.getStoresByBusinessId(newBusiness.refId),
      ]);

      final newStore = storeByBusiness.firstOrNull;

      if (newStore == null || newBusinessMember == null) {
        return;
      }

      businessMember = newBusinessMember;
      business = newBusiness;

      await AppStorage.of<BusinessMember>().write(
        CollectionName.businessMembers,
        newBusinessMember,
      );
      await AppStorage.of<Store>().write(CollectionName.stores, newStore);

      final newStoreMember = await StoresRepository.instance.getStoreMember(
        GetStoreMemberRequest(storeId: newStore.refId, userId: newUser.refId),
      );

      if (newStoreMember == null) {
        return;
      }

      store = newStore;
      storeMember = newStoreMember;

      await AppStorage.of<StoreMember>().write(
        CollectionName.storeMembers,
        newStoreMember,
      );
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> _loadSavePrefreferences() async {
    _user = await AppStorage.of<User?>().read(CollectionName.users);
    business = await AppStorage.of<Business>().read(CollectionName.businesses);
    businessMember = await AppStorage.of<BusinessMember>().read(
      CollectionName.businessMembers,
    );
    store = await AppStorage.of<Store>().read(CollectionName.stores);
    storeMember = await AppStorage.of<StoreMember>().read(
      CollectionName.storeMembers,
    );
  }

  /// Save user preferences.
  Future<void> saveUserPreferences({required User user}) async {
    await AppStorage.of<User>().write(CollectionName.users, user);

    _user = user;
    notifyListeners();
  }

  /// Save business preferences.
  Future<void> saveBusinessPreferences({required Business newBusiness}) async {
    await AppStorage.of<Business>().write(
      CollectionName.businesses,
      newBusiness,
    );

    business = newBusiness;
    notifyListeners();
  }

  /// Save business member preferences.
  Future<void> saveBusinessMemberPreferences({
    required BusinessMember newBusinessMember,
  }) async {
    await AppStorage.of<BusinessMember>().write(
      CollectionName.businessMembers,
      newBusinessMember,
    );

    businessMember = newBusinessMember;
    notifyListeners();
  }

  /// Save store preferences.
  Future<void> saveStorePreferences({required Store newStore}) async {
    await AppStorage.of<Store>().write(CollectionName.stores, newStore);

    store = newStore;
    notifyListeners();
  }

  /// Save store member preferences.
  Future<void> saveStoreMemberPreferences({
    required StoreMember newStoreMember,
  }) async {
    await AppStorage.of<StoreMember>().write(
      CollectionName.storeMembers,
      newStoreMember,
    );

    storeMember = newStoreMember;
    notifyListeners();
  }

  /// Clear user preferences.
  Future<void> clearUserPreferences() async {
    await AppStorage.of<User>().remove(CollectionName.users);
    await AppStorage.of<Business>().remove(CollectionName.businesses);
    await AppStorage.of<Store>().remove(CollectionName.stores);

    _user = null;
    business = null;
    store = null;
  }
}
