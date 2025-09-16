import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The point of sales header
class PointOfSalesHeader extends StatelessWidget {
  /// Constructs of new [PointOfSalesHeader].
  const PointOfSalesHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Intls.to.pointOfSalesManagement, style: theme.textTheme.h4),
            const SizedBox(height: 4),
            Text(
              Intls.to.pointOfSalesManagementDescription,
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ],
    );
  }
}
