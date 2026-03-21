import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/loading.dart';
import 'inventory_adjustment_controller.dart';
import 'inventory_adjustment_form.dart';
import 'inventory_adjustment_view_model.dart';

/// Dialog for adjusting inventory quantities.
class InventoryAdjustmentDialog extends StatelessWidget {
  /// The product ID.
  final String productId;

  /// The curren store.
  final Store store;

  /// Constructs an [InventoryAdjustmentDialog].
  const InventoryAdjustmentDialog({
    super.key,
    required this.productId,
    required this.store,
  });

  @override
  Widget build(BuildContext context) {
    final userPreference = context.watch<UserPreferences>();
    final userId = userPreference.user?.refId;
    if (userId == null) {
      return const SizedBox.shrink();
    }

    return ChangeNotifierProvider<InventoryAdjustmentController>(
      create: (_) => InventoryAdjustmentController(
        viewModel: InventoryAdjustmentViewModel(
          productId: productId,
          store: store,
        ),
      ),
      child: Consumer<InventoryAdjustmentController>(
        builder: (context, controller, _) {
          return ShadDialog(
            title: Text(Intls.to.adjustInventory),
            description: Text(
              controller.inventoryItemStream?.globalProduct.label ?? '',
            ),
            actions: [
              ShadButton.outline(
                enabled: !controller.isLoading,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(Intls.to.cancel),
              ),
              ShadButton(
                enabled: !controller.isLoading && controller.isValid,
                onPressed: controller.isLoading
                    ? null
                    : () async {
                        final bool success = await controller.submit(userId);
                        if (success && context.mounted) {
                          Navigator.of(context).pop();
                          ShadToaster.of(context).show(
                            ShadToast(
                              title: Text(Intls.to.success),
                              description: Text(
                                Intls.to.inventoryAdjustedSuccessfully,
                              ),
                            ),
                          );
                        } else if (!success && context.mounted) {
                          ShadToaster.of(context).show(
                            ShadToast.destructive(
                              title: Text(Intls.to.error),
                              description: Text(
                                Intls.to.failedToAdjustInventory,
                              ),
                            ),
                          );
                        }
                      },
                child: controller.isLoading
                    ? const SizedBox.square(
                        dimension: 16,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(Intls.to.save),
              ),
            ],
            child: Container(
              width: 400,
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: FutureBuilder(
                future: controller.completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  final item = controller.inventoryItemStream;
                  if (item == null) {
                    return Center(child: Text(Intls.to.productNotFound));
                  }

                  return const InventoryAdjustmentForm();
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
