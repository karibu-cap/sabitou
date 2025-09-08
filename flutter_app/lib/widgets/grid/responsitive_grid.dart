import 'package:flutter/material.dart';

/// A responsive grid widget that automatically adjusts the number of columns
/// based on the available width and minimum item width.
///
/// This widget is particularly useful for creating layouts that need to adapt
/// to different screen sizes while maintaining a consistent item width.
///
/// Example usage:
/// ```dart
/// ResponsiveGrid(
///   minItemWidth: 250,
///   crossAxisSpacing: 16,
///   mainAxisSpacing: 16,
///   children: [
///     Container(height: 100, color: Colors.red),
///     Container(height: 100, color: Colors.blue),
///     Container(height: 100, color: Colors.green),
///   ],
/// )
/// ```
class ResponsiveGrid extends StatelessWidget {
  /// The list of widgets to display in the grid.
  final List<Widget> children;

  /// The minimum width for each grid item.
  /// Used to calculate the number of columns when [crossAxisCount] is not provided.
  /// Defaults to 300 logical pixels.
  final double minItemWidth;

  /// The number of columns in the grid.
  /// If not provided, it will be calculated based on [minItemWidth].
  final int? crossAxisCount;

  /// The spacing between grid items horizontally.
  /// Defaults to 12 logical pixels.
  final double crossAxisSpacing;

  /// The spacing between grid items vertically.
  /// Defaults to 12 logical pixels.
  final double mainAxisSpacing;

  /// The height of each grid item.
  /// If not provided, items will have their natural height.
  final double? mainAxisExtent;

  /// Creates a responsive grid layout.
  const ResponsiveGrid({
    super.key,
    required this.children,
    this.minItemWidth = 300,
    this.crossAxisCount,
    this.crossAxisSpacing = 12,
    this.mainAxisSpacing = 12,
    this.mainAxisExtent,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int calculatedCrossAxisCount = crossAxisCount ??
            (constraints.maxWidth / minItemWidth).floor().clamp(
              1,
              children.length,
            );

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: calculatedCrossAxisCount,
            crossAxisSpacing: crossAxisSpacing,
            mainAxisSpacing: mainAxisSpacing,
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
