import 'package:flutter/material.dart';

/// The [AppTable].
class AppTable extends StatelessWidget {
  /// The child widget.
  final Widget child;

  /// Constructs of new [AppTable].
  const AppTable({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Container(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: child,
            ),
          ),
        );
      },
    );
  }
}
