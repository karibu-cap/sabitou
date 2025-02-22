import 'package:flutter/material.dart';

/// The app layout.
final class AppLayout {
  /// The context.
  final BuildContext context;

  /// Whether the device is a tablet.
  bool get isTablet {
    return MediaQuery.sizeOf(context).width < 1100 &&
        MediaQuery.sizeOf(context).width >= 600;
  }

  /// Whether the device is a mobile.
  bool get isMobile {
    return MediaQuery.sizeOf(context).width < 600;
  }

  /// Whether the device is a desktop.
  bool get isDesktop {
    return MediaQuery.sizeOf(context).width > 1100;
  }

  AppLayout(this.context);
}
