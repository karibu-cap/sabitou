import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/business_repository.dart';
import '../../repositories/stores_repository.dart';
import '../../utils/user_preference.dart';

/// The settings view model.
class SettingsViewModel {
  /// The user businesses store.
  List<BusinessStore> userBusinessesStore = [];

  /// The selected business.
  Business? selectedBusiness;

  /// The selected store.
  Store? selectedStore;

  /// Completer for the initialization.
  final Completer<void> initCompleter = Completer<void>();

  /// Initializes the view model.
  SettingsViewModel() {
    _init();
  }

  /// Initializes the view model.
  Future<void> _init() async {
    final userPreference = UserPreferences.instance;
    final userId = userPreference.user?.refId;
    final _businessStore = <BusinessStore>[];
    if (userId == null) {
      return;
    }

    final userBusinesses = await BusinessRepository.instance.getMyBusinesses(
      userId,
    );

    for (final business in userBusinesses) {
      final stores = await StoresRepository.instance.getStoresByBusinessId(
        business.refId,
      );
      _businessStore.add(BusinessStore(business: business, stores: stores));
    }

    userBusinessesStore = _businessStore;
    selectedBusiness = userPreference.business;
    selectedStore = userPreference.store;
    initCompleter.complete();
  }
}

/// The business store.
class BusinessStore {
  /// The business.
  final Business business;

  /// The stores.
  final List<Store> stores;

  /// Constructs a new [BusinessStore].
  BusinessStore({required this.business, required this.stores});
}
