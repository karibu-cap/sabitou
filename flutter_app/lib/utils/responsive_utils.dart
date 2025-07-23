import 'package:flutter/material.dart';

// Breakpoints.
const double _mobileBreakpoint = 600.0;
const double _tabletBreakpoint = 800.0;
const double _desktopBreakpoint = 1200.0;

/// The responsive utils.
class ResponsiveUtils {
  /// Whether the device is a mobile.
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < _mobileBreakpoint;
  }

  /// Whether the device is a tablet.
  static bool isTablet(BuildContext context) {
    return MediaQuery.of(context).size.width < _tabletBreakpoint;
  }

  /// Whether the device is a desktop.
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= _desktopBreakpoint;
  }

  /// Gets the screen width.
  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  /// Gets the screen height.
  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
