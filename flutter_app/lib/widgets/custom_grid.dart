import 'package:flutter/material.dart';

/// The custom grid widget.
final class CustomGrid<T extends Widget> extends StatelessWidget {
  /// Constructor of new [CustomGrid].
  const CustomGrid({
    super.key,
    required this.children,
    required this.minItemWidth,
    this.mainAxisExtent = 140,
    this.crossSpacing = 12,
    this.mainAxisSpacing = 12,
  });

  /// The children of the grid.
  final List<T> children;

  /// The minimum item width.
  final double minItemWidth;

  /// The main axis extent.
  final double mainAxisExtent;

  /// The cross axis spacing.
  final double crossSpacing;

  /// The main axis spacing.
  final double mainAxisSpacing;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final int columns = (constraints.maxWidth / minItemWidth).floor();

        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: crossSpacing,
            mainAxisSpacing: mainAxisSpacing,
            mainAxisExtent: mainAxisExtent,
          ),
          itemCount: children.length,
          itemBuilder: (context, index) {
            return children[index];
          },
        );
      },
    );
  }
}
