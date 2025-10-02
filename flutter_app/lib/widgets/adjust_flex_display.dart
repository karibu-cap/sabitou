import 'package:flutter/material.dart';

import '../../../utils/responsive_utils.dart';

/// Adjust flex display based on screen size
class AdjustFlexDisplay extends StatelessWidget {
  /// The children to display.
  final List<Widget> children;

  /// Adjust flex display based on screen size
  const AdjustFlexDisplay({super.key, required this.children});

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);

    return Flex(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      direction: isTablet ? Axis.vertical : Axis.horizontal,
      children: children
          .map((e) => Expanded(flex: isTablet ? 0 : 1, child: e))
          .toList(),
    );
  }
}
