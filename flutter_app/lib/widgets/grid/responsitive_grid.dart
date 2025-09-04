import 'package:flutter/material.dart';

/// A responsive grid widget that automatically adjusts the number of columns
/// based on the available width and specified minimum item width.
///
/// This widget is particularly useful for creating layouts that need to adapt
/// to different screen sizes while maintaining a consistent item width.
///
/// Example usage:
/// ```dart
/// ResponsiveGrid(
///   minItemWidth: 250,
///   spacing: 16,
///   children: [
///     Card(child: ...),
///     Card(child: ...),
///     Card(child: ...),
///   ],
/// )
/// ```
class ResponsiveGrid extends StatelessWidget {
  /// The list of widgets to display in the grid.
  final List<Widget> children;

  /// The minimum width each grid item should have.
  /// Defaults to 300 logical pixels.
  final double minItemWidth;

  /// The spacing between grid items, both horizontally and vertically.
  /// Defaults to 12 logical pixels.
  final double spacing;

  /// The height of each grid item.
  /// Defaults to 140 logical pixels.
  final double? mainAxisExtent;

  /// Creates a responsive grid layout.
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.minItemWidth = 300,
    this.spacing = 12,
    this.mainAxisExtent,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int columns = (constraints.maxWidth / minItemWidth).floor().clamp(
          1,
          children.length,
        );

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: spacing,
            mainAxisSpacing: spacing,
            mainAxisExtent: mainAxisExtent,
            childAspectRatio: 2,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) => children[index],
        );
      },
    );
  }
}
