import 'package:flutter/material.dart';

/// The home controller.
class HomeController extends ChangeNotifier {
  bool _isSidebarOpen = false;

  /// Returns whether the sidebar is open.
  bool get isSidebarOpen => _isSidebarOpen;

  /// Toggles the sidebar.
  void toggleSidebar({bool? value}) {
    _isSidebarOpen = value ?? !_isSidebarOpen;
    notifyListeners();
  }
}
