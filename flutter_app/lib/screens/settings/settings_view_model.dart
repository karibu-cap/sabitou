import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/business_repository.dart';
import '../../repositories/stores_repository.dart';

/// The settings view model.
class SettingsViewModel {
  /// The user businesses store.
  List<BusinessStore> userBusinessesStore = [];

  /// The selected business.
  Business? selectedBusiness;

  /// The selected store.
  Store? selectedStore;

  /// The current user.
  User user;

  /// Completer for the initialization.
  final Completer<void> initCompleter = Completer<void>();

  /// Initializes the view model.
  SettingsViewModel({
    this.selectedBusiness,
    this.selectedStore,
    required this.user,
  }) {
    _init();
  }

  /// Initializes the view model.
  Future<void> _init() async {
    final _businessStore = <BusinessStore>[];

    final userBusinesses = await BusinessRepository.instance.getMyBusinesses(
      user.refId,
    );

    for (final business in userBusinesses) {
      final stores = await StoresRepository.instance.getStoresByBusinessId(
        business.refId,
      );
      _businessStore.add(BusinessStore(business: business, stores: stores));
    }

    userBusinessesStore = _businessStore;
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
