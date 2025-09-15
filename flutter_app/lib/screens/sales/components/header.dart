import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The inventory header
class InventoryHeader extends StatelessWidget {
  /// Constructs of new [InventoryHeader].
  const InventoryHeader({super.key});

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
            Text(Intls.to.salesManagement, style: theme.textTheme.h4),
            const SizedBox(height: 4),
            Text(
              Intls.to.salesManagementDescription,
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ],
    );
  }
}
