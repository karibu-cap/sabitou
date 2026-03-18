import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_scaffold.dart';
import 'inventory_adjustment_controller.dart';
import 'inventory_adjustment_form.dart';
import 'inventory_adjustment_view_model.dart';

/// Screen for adjusting inventory quantities.
class InventoryAjustmentScreen extends StatelessWidget {
  /// The product ID.
  final String productId;

  /// Constructs a new [InventoryAjustmentScreen].
  const InventoryAjustmentScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;
    if (currentStore == null || business == null) {
      return const SizedBox.shrink();
    }

    return ChangeNotifierProvider(
      create: (context) => InventoryAdjustmentController(
        viewModel: InventoryAdjustmentViewModel(
          productId: productId,
          store: currentStore,
        ),
      ),
      child: Consumer<InventoryAdjustmentController>(
        builder: (context, controller, child) {
          return ShadScaffold(
            title: Text(Intls.to.adjustInventory),
            body: FutureBuilder<bool>(
              future: controller.completer.future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Loading();
                }

                final item = controller.inventoryItemStream;
                if (item == null) {
                  return Center(child: Text(Intls.to.productNotFound));
                }

                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.globalProduct.label,
                              style: ShadTheme.of(context).textTheme.large
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 16),
                            const InventoryAdjustmentForm(),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: ShadTheme.of(context).colorScheme.border,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ShadButton.outline(
                              enabled: !controller.isLoading,
                              onPressed: () => Navigator.of(context).pop(),
                              child: Text(Intls.to.cancel),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ShadButton(
                              enabled:
                                  !controller.isLoading && controller.isValid,
                              onPressed: controller.isLoading
                                  ? null
                                  : () async {
                                      final bool success = await controller
                                          .submit();
                                      if (success && context.mounted) {
                                        Navigator.of(context).pop();
                                        ShadToaster.of(context).show(
                                          ShadToast(
                                            title: Text(Intls.to.success),
                                            description: Text(
                                              Intls
                                                  .to
                                                  .inventoryAdjustedSuccessfully,
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
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : Text(Intls.to.save),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
