import 'package:flutter/material.dart';

import '../utils/app_layout.dart';

/// The responsive layout.
final class ResponsiveLayout extends StatelessWidget {
  /// The mobile layout.
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) mobile;

  /// The tablet layout.
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) tablet;

  /// The desktop layout.
  final Widget Function(
    BuildContext context,
    BoxConstraints constraints,
  ) desktop;

  /// Constructs a [ResponsiveLayout].
  const ResponsiveLayout({
    super.key,
    required this.mobile,
    required this.tablet,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final AppLayout appLayout = AppLayout(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        if (appLayout.isMobile) {
          return mobile(context, constraints);
        }
        if (appLayout.isTablet) {
          return tablet(context, constraints);
        }

        return desktop(context, constraints);
      },
    );
  }
}
