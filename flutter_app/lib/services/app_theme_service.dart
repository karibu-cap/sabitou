import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_theme.dart';
import '../utils/app_constants.dart';

/// The theme service.
class AppThemeService extends ChangeNotifier {
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
  AppThemeService() {
    init();
  }

  Future<void> _saveThemeToBox(bool isDarkMode) => const FlutterSecureStorage()
      .write(key: _key, value: jsonEncode(isDarkMode));

  /// Initializes the theme service.
  Future<AppThemeService> init() async {
    final t = await const FlutterSecureStorage().read(key: _key);

    if (t == null) {
      _isDarkMode = false;

      return this;
    }

    _isDarkMode = jsonDecode(t) as bool;
    notifyListeners();

    return this;
  }

  /// Switches the theme mode between light and dark, and saves it to the storage.
  Future<void> switchTheme() async {
    _isDarkMode = !_isDarkMode;
    await _saveThemeToBox(_isDarkMode);
    notifyListeners();
  }
}
