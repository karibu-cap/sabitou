import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_business_view.dart';
import 'ajustment/inventory_adjustment_dialog.dart';
import 'components/header.dart';
import 'components/product_table.dart';
import 'components/search_and_filter.dart';
import 'detail/inventory_detail_view.dart';
import 'inventory_controller.dart';
import 'inventory_view_model.dart';

/// Inventory screen.
class InventoryScreen extends StatelessWidget {
  /// Constructs of new [InventoryScreen].
  const InventoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;
    final cs = ShadTheme.of(context).colorScheme;
    if (currentStore == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    final viewModel = InventoryViewModel(
      store: currentStore,
      business: business,
    );
    final productId = GoRouterState.of(
      context,
    ).uri.queryParameters[InventoryDetailParameters.keyProductId];

    return Scaffold(
      backgroundColor: cs.background,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = ResponsiveUtils.isMobile(context);

            return ChangeNotifierProvider(
              create: (context) => InventoryController(viewModel),
              child: Consumer<InventoryController>(
                builder: (context, controller, child) {
                  return FutureBuilder<bool>(
                    future: controller.completer.future,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done) {
                        return const Loading();
                      }

                      if (productId != null &&
                          productId.isNotEmpty &&
                          !isMobile) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          controller
                              .selectItemById(productId)
                              .catchError((error) {});
                        });
                      }

                      return StreamBuilder<InventoryLevelWithProduct?>(
                        stream: controller.selectedItemStream,
                        builder: (context, selectedSnapshot) {
                          final selectedItem = selectedSnapshot.data;

                          return isMobile
                              ? const SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    spacing: AppConstants.spacingM,
                                    children: [
                                      InventoryHeader(),
                                      SearchAndFilterCard(),
                                      ProductsTable(),
                                    ],
                                  ),
                                )
                              : ShadResizablePanelGroup(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const ShadResizablePanel(
                                      id: 0,
                                      defaultSize: 0.4,
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: SingleChildScrollView(
                                              padding: EdgeInsets.symmetric(
                                                horizontal:
                                                    AppConstants.spacingM,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                spacing: AppConstants.spacingL,
                                                children: [
                                                  InventoryHeader(),
                                                  SearchAndFilterCard(),
                                                  ProductsTable(),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    if (selectedItem != null)
                                      ShadResizablePanel(
                                        id: 1,
                                        defaultSize: 0.6,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: AppConstants.spacingM,
                                          ),
                                          child: StreamBuilder<List<InventoryTransaction>>(
                                            stream:
                                                controller.transactionsStream,
                                            builder: (context, transactionsSnapshot) {
                                              final transactions =
                                                  transactionsSnapshot.data ??
                                                  [];

                                              return InventoryDetailView(
                                                item: selectedItem,
                                                transactions: transactions,
                                                tabsController:
                                                    controller.tabsController,
                                                onAdjustStock: () {
                                                  if (isMobile) {
                                                    AppRouter.push(
                                                      context,
                                                      PagesRoutes
                                                          .inventoryAjustment
                                                          .create(
                                                            InventoryDetailParameters(
                                                              productId:
                                                                  selectedItem
                                                                      .product
                                                                      .refId,
                                                            ),
                                                          ),
                                                    );

                                                    return;
                                                  }
                                                  showShadDialog(
                                                    context: context,
                                                    builder: (context) =>
                                                        InventoryAdjustmentDialog(
                                                          productId:
                                                              selectedItem
                                                                  .product
                                                                  .refId,
                                                          store:
                                                              controller.store,
                                                        ),
                                                  );
                                                },
                                                transactionFilterStream:
                                                    controller
                                                        .transactionFilterStream,
                                                updateTransactionFilter:
                                                    controller
                                                        .updateTransactionFilter,
                                                onClose: () {
                                                  controller.clearSelection();
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                      ),
                                  ],
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
      ),
    );
  }
}
