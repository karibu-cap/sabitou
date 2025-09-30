import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The new order header
class POSHeader extends StatelessWidget {
  /// Constructs of new [POSHeader].
  const POSHeader({super.key});

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
            Text(Intls.to.newOrderSales, style: theme.textTheme.h4),
            const SizedBox(height: 4),
            Text(
              Intls.to.newOrderSalesDescription,
              style: theme.textTheme.muted,
            ),
          ],
        ),
      ],
    );
  }
}
