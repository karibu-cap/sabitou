import 'package:flutter/material.dart';

import '../../utils/app_constants.dart';

/// The home controller.
class HomeController extends ChangeNotifier {
  DashboardItem _activeTab = DashboardItem.dashboard;
  bool _isSidebarOpen = false;

  /// Returns the active tab.
  DashboardItem get activeTab => _activeTab;

  /// Returns whether the sidebar is open.
  bool get isSidebarOpen => _isSidebarOpen;

  /// Changes the active tab.
  void changeTab(DashboardItem tab) {
    _activeTab = tab;
    _isSidebarOpen = false;
    notifyListeners();
  }

  /// Toggles the sidebar.
  void toggleSidebar({bool? value}) {
    _isSidebarOpen = value ?? !_isSidebarOpen;
    notifyListeners();
  }
}
