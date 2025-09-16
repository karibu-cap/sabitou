import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_shad_button.dart';

/// The cart footer.
final class CartFooter extends StatelessWidget {
  /// Constructor of new [CartFooter].
  const CartFooter({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void> onOrderCompleted() async {
      final result = await CartManager.to.completeOrder();
      if (!context.mounted) {
        return;
      }
      if (result) {
        showSuccessToast(
          context: context,
          message: Intls.to.orderCompletedSuccessfully,
        );
      }
      showErrorToast(context: context, message: Intls.to.failedToCompleteOrder);
    }

    final isMobile = ResponsiveUtils.isMobile(context);

    return ListenableBuilder(
      listenable: GetIt.I.get<CartManager>(),
      builder: (context, value) {
        return Column(
          spacing: 12,
          children: [
            Divider(
              thickness: 1,
              color: ShadTheme.of(context).colorScheme.border,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${Intls.to.total}: ',
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                ),
                Text(
                  '${Formatters.formatCurrency((CartManager.to.currentOrder?.totalPrice ?? 0).toDouble())}',
                  style: ShadTheme.of(context).textTheme.h4.copyWith(
                    color: ShadTheme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: CustomShadButton(
                onPressed: onOrderCompleted,
                enabled:
                    CartManager.to.currentOrder?.orderItems.isNotEmpty ?? false,
                text: Intls.to.completeOrder,
              ),
            ),
            Flex(
              direction: isMobile ? Axis.vertical : Axis.horizontal,
              spacing: 12,
              children: [
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomShadButton(
                      buttonType: ShadButtonVariant.outline,
                      leading: const Icon(LucideIcons.pause400),
                      onPressed: CartManager.to.onHoldCurrentOrder,
                      enabled:
                          CartManager.to.currentOrder?.orderItems.isNotEmpty ??
                          false,
                      text: Intls.to.holdOrder,
                    ),
                  ),
                ),
                Expanded(
                  flex: isMobile ? 0 : 1,
                  child: SizedBox(
                    width: double.infinity,
                    child: CustomShadButton(
                      buttonType: ShadButtonVariant.destructive,
                      leading: const Icon(LucideIcons.trash2400),
                      onPressed: () async {
                        await Future.value();
                        CartManager.to.clearCart();
                      },
                      enabled:
                          CartManager.to.currentOrder?.orderItems.isNotEmpty ??
                          false,
                      text: Intls.to.clearOrder,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
