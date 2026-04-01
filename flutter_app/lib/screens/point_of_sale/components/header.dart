import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/user_preference.dart';
import '../utils/cart_provider.dart';
import 'preview_invoice.dart';

/// POS top header bar.
class POSHeader extends StatelessWidget {
  /// Creates a [POSHeader].
  const POSHeader({super.key, required this.store});

  /// The active store for which the sale is being processed.
  final Store store;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);
    final cart = context.watch<CartProvider>();
    final user = context.watch<UserPreferences>().user;

    final itemCount = cart.getCartItems().length;
    final total = cart.currentCashReceipt?.totalAmount ?? 0.0;
    final receiptId = cart.currentCashReceipt?.refId ?? '';
    final shortRef = receiptId.length >= 6
        ? receiptId.substring(receiptId.length - 6).toUpperCase()
        : receiptId.toUpperCase();

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(Intls.to.newOrderSales, style: theme.textTheme.h3),
                const SizedBox(width: 10),
                if (shortRef.isNotEmpty)
                  ShadBadge.secondary(
                    child: Text('#$shortRef', style: theme.textTheme.small),
                  ),
                const SizedBox(width: 6),
                if (itemCount > 0)
                  ShadBadge(
                    backgroundColor: theme.colorScheme.primary,
                    child: Text(
                      '$itemCount ${Intls.to.items}',
                      style: theme.textTheme.small.copyWith(
                        color: theme.colorScheme.primaryForeground,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(
                  LucideIcons.store,
                  size: 13,
                  color: theme.colorScheme.mutedForeground,
                ),
                const SizedBox(width: 4),
                Text(store.name, style: theme.textTheme.muted),
                const SizedBox(width: 12),
                Icon(
                  LucideIcons.circleUser400,
                  size: 13,
                  color: theme.colorScheme.mutedForeground,
                ),
                const SizedBox(width: 4),
                Text(user?.userName ?? '—', style: theme.textTheme.muted),
                if (total > 0) ...[
                  const SizedBox(width: 12),
                  const Icon(
                    LucideIcons.wallet,
                    size: 13,
                    color: SabitouColors.accent,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    Formatters.formatCurrency(total),
                    style: theme.textTheme.muted.copyWith(
                      color: SabitouColors.accent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),

        SizedBox(height: isDesktop ? 0 : 12),
        if (itemCount > 0)
          Row(
            children: [
              ShadButton.outline(
                leading: const Icon(LucideIcons.fileText, size: 15),
                child: Text(Intls.to.preview),
                onPressed: () => showShadDialog(
                  context: context,
                  builder: (ctx) =>
                      ShadDialog.alert(child: PreviewInvoice(store: store)),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
