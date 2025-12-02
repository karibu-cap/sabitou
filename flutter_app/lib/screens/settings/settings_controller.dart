import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/business_repository.dart';
import '../../repositories/stores_repository.dart';
import '../../services/storage/app_storage.dart';
import '../../utils/app_constants.dart';
import '../../utils/extends_models.dart';
import '../../utils/user_preference.dart';
import '../../widgets/pdf/printers/printer_configuration.dart';
import '../../widgets/sidebar/sidebar_menu_item.dart';
import 'settings_view_model.dart';

/// The settings tab.
enum SettingsTab {
  /// The business info tab.
  businessInfo,

  /// The store info tab.
  storeInfo,

  /// The security tab.
  security,

  /// The system tab.
  system,
}

/// The currency enum.
enum Currency {
  /// The XAF currency.
  XAF,

  /// The USD currency.
  USD,

  /// The EUR currency.
  EUR,
}

/// The settings controller.
class SettingsController extends ChangeNotifier {
  final SettingsViewModel _viewModel;

  /// The selected tab.
  SettingsTab _selectedTab = SettingsTab.businessInfo;

  /// The business temp logo.
  XFile? _businessTempLogo;

  /// The store temp logo.
  XFile? _storeTempLogo;

  /// The printer configuration
  PrinterConfiguration _printerConfiguration = const PrinterConfiguration();

  /// The business temp logo.
  XFile? get businessTempLogo => _businessTempLogo;

  /// The store temp logo.
  XFile? get storeTempLogo => _storeTempLogo;

  /// The selected tab.
  SettingsTab get selectedTab => _selectedTab;

  /// The selected business.
  Business? get selectedBusiness => _viewModel.selectedBusiness;

  /// The selected store.
  Store? get selectedStore => _viewModel.selectedStore;

  /// The businesses.
  List<BusinessStore> get userBusinessesStore => _viewModel.userBusinessesStore;

  /// The init completer.
  Completer<void> get initCompleter => _viewModel.initCompleter;

  /// The printer configuration
  PrinterConfiguration get printerConfiguration => _printerConfiguration;

  /// Constructs a new [SettingsController].
  SettingsController({required SettingsViewModel viewModel})
    : _viewModel = viewModel {
    _loadPrinterConfiguration();
  }

  /// Load printer configuration from storage
  Future<void> _loadPrinterConfiguration() async {
    try {
      final String? configJson = await AppStorage.of<String>(
        boxKey: PreferencesKey.printerConfiguration,
      ).read(PreferencesKey.printerConfiguration);

      if (configJson != null) {
        final Map<String, dynamic> json =
            jsonDecode(configJson) as Map<String, dynamic>;
        _printerConfiguration = PrinterConfiguration.fromJson(json);
        notifyListeners();
      }
    } catch (e) {
      // If error, keep default configuration
      _printerConfiguration = const PrinterConfiguration();
    }
  }

  /// Sets the business temp logo.
  void setBusinessTempLogo(XFile? logo) {
    _businessTempLogo = logo;
    notifyListeners();
  }

  /// Sets the store temp logo.
  void setStoreTempLogo(XFile? logo) {
    _storeTempLogo = logo;
    notifyListeners();
  }

  /// Sets the selected tab.
  void setSelectedTab(SideBarItem<SettingsTab> tab) {
    _selectedTab = tab.id;
    notifyListeners();
  }

  /// Sets the selected business.
  void setSelectedBusiness(Business? business) {
    _viewModel.selectedBusiness = business;
    setSelectedStore(null);
    notifyListeners();
  }

  /// Sets the selected store.
  void setSelectedStore(Store? store) {
    _viewModel.selectedStore = store;
    notifyListeners();
  }

  /// Sets the default printer
  void setDefaultPrinter(AppPrinter? printer) {
    _printerConfiguration = _printerConfiguration.copyWith(
      defaultPrinter: printer,
    );
    notifyListeners();
  }

  /// Sets auto-print enabled
  void setAutoPrintEnabled(bool enabled) {
    _printerConfiguration = _printerConfiguration.copyWith(
      autoPrintEnabled: enabled,
    );
    notifyListeners();
  }

  /// Saves the printer configuration
  Future<void> savePrinterConfiguration() async {
    try {
      final String configJson = jsonEncode(_printerConfiguration.toJson());
      await AppStorage.of<String>(
        boxKey: PreferencesKey.printerConfiguration,
      ).write(PreferencesKey.printerConfiguration, configJson);
    } catch (e) {
      // Handle error silently or show a message
    }
  }

  /// Saves the business info.
  Future<bool> saveBusinessInfo({required Business business}) async {
    final result = await BusinessRepository.instance.updateBusiness(business);
    notifyListeners();

    return result;
  }

  /// Saves the store info.
  Future<bool> saveStoreInfo({required Store store}) async {
    final result = await StoresRepository.instance.updateStore(store);
    notifyListeners();

    return result;
  }

  /// Switches the business.
  Future<void> switchBusiness() async {
    final selectedBusiness = this.selectedBusiness;
    if (selectedBusiness == null) {
      return;
    }

    await UserPreferences.instance.saveBusinessPreferences(
      newBusiness: selectedBusiness,
    );
  }

  /// Switches the store.
  Future<void> switchStore() async {
    final selectedStore = this.selectedStore;

    if (selectedStore == null) {
      return;
    }

    await UserPreferences.instance.saveStorePreferences(
      newStore: selectedStore,
    );
  }

  /// Rebuild the controller.
  void rebuild() {
    notifyListeners();
  }
}

/// The currency extension.
extension CurrencyExtension on Currency {
  /// The name of the currency.
  String get title {
    switch (this) {
      case Currency.XAF:
        return 'XAF - Central African Franc';
      case Currency.USD:
        return 'USD - US Dollar';
      case Currency.EUR:
        return 'EUR - Euro';
    }
  }

  /// The code of the currency.
  String get code {
    switch (this) {
      case Currency.XAF:
        return 'XAF';
      case Currency.USD:
        return 'USD';
      case Currency.EUR:
        return 'EUR';
    }
  }
}
