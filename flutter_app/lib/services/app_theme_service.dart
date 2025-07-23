import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_theme.dart';
import '../utils/app_constants.dart';
import 'storage/app_storate.dart';

/// The theme service.
class AppThemeService extends GetxService {
  final AppStorageService _box;
  final _key = PreferencesKey.isDartMode;
  final _isDarkMode = false.obs;

  /// The current theme.
  ShadThemeData? currentTheme;

  /// The light theme.
  static final ShadThemeData _lightTheme = AppTheme.lightTheme;

  /// The dark theme.
  static final ShadThemeData _darkTheme = AppTheme.darkTheme;

  /// Whether the app is in dark mode.
  bool get isDarkMode => _isDarkMode.value;

  /// Direct access to the theme service.
  static AppThemeService get to => Get.find();

  /// The light theme.
  static ShadThemeData get lightTheme => _lightTheme;

  /// The dark theme.
  static ShadThemeData get darkTheme => _darkTheme;

  /// Gets the current theme mode.
  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  /// Constructor of new theme service.
  AppThemeService(this._box);

  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Initializes the theme service.
  Future<AppThemeService> init() async {
    _isDarkMode.value = _box.read(_key) ?? false;
    currentTheme = _isDarkMode.value ? darkTheme : lightTheme;

    return this;
  }

  /// Switches the theme mode between light and dark, and saves it to the storage.
  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    _saveThemeToBox(_isDarkMode.value);
  }
}
