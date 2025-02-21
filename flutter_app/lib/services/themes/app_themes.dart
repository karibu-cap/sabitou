// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../themes/themes.dart';
import '../../utils/constants.dart';
import '../storage/app_storate.dart';

/// The theme service.
class AppThemeService extends GetxService {
  final AppStorageService _box;
  final _key = PreferencesKey.isDartMode;
  final _isDarkMode = false.obs;

  static final FlexColorScheme _lightTheme = Themes.lightTheme;
  static final FlexColorScheme _darkTheme = Themes.darkTheme;

  /// Whether the app is in dark mode.
  bool get isDarkMode => _isDarkMode.value;

  /// Direct access to the theme service.
  static AppThemeService get to => Get.find();

  /// The light theme.
  static ThemeData get lightTheme => _lightTheme.toTheme;

  /// The dark theme.
  static ThemeData get darkTheme => _darkTheme.toTheme;

  /// Gets the current theme mode.
  ThemeMode get themeMode =>
      _isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  /// Constructor of new theme service.
  AppThemeService(
    this._box,
  );

  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Initializes the theme service.
  Future<AppThemeService> init() async {
    _isDarkMode.value = _box.read(_key) ?? false;

    return this;
  }

  /// Switches the theme mode between light and dark, and saves it to the storage.
  void switchTheme() {
    _isDarkMode.value = !_isDarkMode.value;
    Get
      ..changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light)
      ..changeTheme(_isDarkMode.value ? darkTheme : lightTheme);
    _saveThemeToBox(_isDarkMode.value);
  }
}
