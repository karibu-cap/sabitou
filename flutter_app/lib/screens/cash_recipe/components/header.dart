import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/responsive_utils.dart';
import '../cash_recipe_controller.dart';

/// The new order header
class Header extends StatelessWidget {
  /// Constructs of new [Header].
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);
    final controller = context.read<CashRecipeController>();

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      spacing: AppConstants.spacingM,
      children: [
        Text(Intls.to.cashReceipts, style: theme.textTheme.h4),
        ShadButton.outline(
          onPressed: controller.loadCashReceipts,
          child: const Icon(LucideIcons.refreshCw, size: 16),
        ),
      ],
    );
  }
}
