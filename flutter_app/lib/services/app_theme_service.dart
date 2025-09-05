import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_theme.dart';
import '../utils/app_constants.dart';
import 'storage/app_storate.dart';

/// The theme service.
class AppThemeService extends ChangeNotifier {
  final AppStorageService _box;
  final _key = PreferencesKey.isDartMode;
  bool _isDarkMode = false;

  /// The light theme.
  static final ShadThemeData _lightTheme = AppTheme.lightTheme;

  /// The dark theme.
  static final ShadThemeData _darkTheme = AppTheme.darkTheme;

  /// Whether the app is in dark mode.
  bool get isDarkMode => _isDarkMode;

  /// The light theme.
  static ShadThemeData get lightTheme => _lightTheme;

  /// The dark theme.
  static ShadThemeData get darkTheme => _darkTheme;

  /// Constructor of new theme service.
  AppThemeService(this._box);

  Future<void> _saveThemeToBox(bool isDarkMode) => _box.write(_key, isDarkMode);

  /// Initializes the theme service.
  Future<AppThemeService> init() async {
    _isDarkMode = _box.read(_key) ?? false;

    return this;
  }

  /// Switches the theme mode between light and dark, and saves it to the storage.
  void switchTheme() {
    _isDarkMode = !_isDarkMode;
    _saveThemeToBox(_isDarkMode);
    notifyListeners();
  }
}
