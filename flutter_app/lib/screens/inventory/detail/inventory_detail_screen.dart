import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/no_business_view.dart';
import '../../../widgets/shad_scaffold.dart';
import '../ajustment/inventory_adjustment_dialog.dart';
import 'inventory_detail_controller.dart';
import 'inventory_detail_view.dart';
import 'inventory_detail_view_model.dart';

/// Inventory detail screen for mobile view.
class InventoryDetailScreen extends StatelessWidget {
  /// The product ID to display.
  final String productId;

  /// Constructs a new [InventoryDetailScreen].
  const InventoryDetailScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    if (currentStore == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider(
      create: (context) => InventoryDetailController(
        InventoryDetailViewModel(productId: productId, store: currentStore),
      ),
      child: Consumer<InventoryDetailController>(
        builder: (context, controller, child) {
          return ShadScaffold(
            title: Text(Intls.to.inventoryDetails),
            body: FutureBuilder<bool>(
              future: controller.completer.future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Loading();
                }

                return StreamBuilder<InventoryLevelWithProduct?>(
                  stream: controller.inventoryItemStream,
                  builder: (context, itemSnapshot) {
                    if (itemSnapshot.hasError) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              LucideIcons.circleAlert400,
                              size: 48,
                              color: ShadTheme.of(
                                context,
                              ).colorScheme.destructive,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              Intls.to.productNotFound,
                              style: ShadTheme.of(context).textTheme.large,
                            ),
                          ],
                        ),
                      );
                    }

                    final item = itemSnapshot.data;

                    if (item == null) {
                      return const Loading();
                    }

                    return StreamBuilder<List<InventoryTransaction>>(
                      stream: controller.transactionsStream,
                      builder: (context, transactionsSnapshot) {
                        final transactions = transactionsSnapshot.data ?? [];

                        return InventoryDetailView(
                          item: item,
                          transactions: transactions,
                          tabsController: controller.tabsController,
                          onAdjustStock: () {
                            if (ResponsiveUtils.isMobile(context)) {
                              AppRouter.push(
                                context,
                                PagesRoutes.inventoryAjustment.create(
                                  InventoryDetailParameters(
                                    productId: productId,
                                  ),
                                ),
                              );
                            } else {
                              showShadDialog(
                                context: context,
                                builder: (context) => InventoryAdjustmentDialog(
                                  productId: item.product.refId,
                                  store: currentStore,
                                ),
                              );
                            }
                          },
                          transactionFilterStream:
                              controller.transactionFilterStream,
                          updateTransactionFilter:
                              controller.updateTransactionFilter,
                        );
                      },
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
