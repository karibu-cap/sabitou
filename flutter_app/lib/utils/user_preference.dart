import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../repositories/business_repository.dart';
import '../repositories/stores_repository.dart';
import '../repositories/users_repository.dart';

/// The user preferences.
class UserPreferences extends ChangeNotifier {
  /// The  buisiness repository instance.
  final BusinessRepository businessRepository = BusinessRepository.instance;

  /// The store repository instance.
  final StoresRepository storesRepository = StoresRepository.instance;

  /// the user repository.
  final UserRepository usersRepository = UserRepository.instance;

  /// The current user.
  User? _user;

  /// The user id.
  final String? userId;

  /// Currents user business.
  Business? business;

  /// Currents user business member.
  BusinessMember? businessMember;

  /// Currents user store.
  Store? store;

  /// Currents user store member.
  StoreMember? storeMember;

  /// Whether we load a data.
  Completer<bool> initializationComplete = Completer<bool>();

  /// The singleton instance.
  static UserPreferences get instance => GetIt.I.get<UserPreferences>();

  /// The current user.
  User? get user => _user;

  /// Currents user business.
  UserPreferences(this.userId) {
    loadUserPreferences(userId);
  }

  /// Load user preferences.
  Future<void> loadUserPreferences(String? userId) async {
    initializationComplete = Completer<bool>();
    if (userId != null) {
      _user = await usersRepository.getUser(userId);
      if (_user != null) {
        final businesses = await businessRepository.getMyBusinesses(userId);

        business = businesses.firstWhereOrNull(
          (e) => e.refId == _user?.activeBusinessId,
        );
        if (business != null) {
          final stores = await storesRepository.getStoresByBusinessId(
            business?.refId ?? '',
          );
          if (stores.isNotEmpty) {
            store = stores.firstWhereOrNull(
              (e) => e.refId == _user?.activeStoreId,
            );
          }
        }
      }
    }
    initializationComplete.complete(true);
    notifyListeners();
  }

  /// Clear user preferences.
  Future<void> clearUserPreferences() async {
    _user = null;
    business = null;
    store = null;
  }
}
