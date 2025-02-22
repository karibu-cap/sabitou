import 'package:flutter/material.dart';

/// The middle page.
final class MiddlewarePage extends StatelessWidget {
  /// The widget to display under the page.
  final Widget child;

  /// Constructor of new [MiddlewarePage].
  const MiddlewarePage({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
