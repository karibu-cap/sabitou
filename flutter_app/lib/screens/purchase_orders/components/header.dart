import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../purchase_orders_controller.dart';
import 'purchase_order_form.dart';

/// Header for purchase orders screen.
class PurchaseOrderHeader extends StatelessWidget {
  /// Constructs a new [PurchaseOrderHeader].
  const PurchaseOrderHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PurchaseOrdersController>(
      builder: (context, controller, child) {
        return Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Intls.to.purchaseOrders,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Intls.to.purchaseOrdersDescription,
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                ],
              ),
            ),
            ShadButton(
              onPressed: () => _showCreateForm(context, controller),
              leading: const Icon(LucideIcons.plus400),
              child: Text(Intls.to.createOrder),
            ),
          ],
        );
      },
    );
  }

  void _showCreateForm(
    BuildContext context,
    PurchaseOrdersController controller,
  ) {
    showDialog(
      context: context,
      builder: (context) =>
          PurchaseOrderForm(purchaseOrdersController: controller),
    );
  }
}
