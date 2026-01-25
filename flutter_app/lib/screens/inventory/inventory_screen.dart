import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../router/page_routes.dart';
import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
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
    final viewModel = GetIt.I.registerSingletonIfAbsent<InventoryViewModel>(
      InventoryViewModel.new,
    );
    final productId = GoRouterState.of(
      context,
    ).uri.queryParameters[InventoryDetailParameters.keyProductId];

    return LayoutBuilder(
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

                  // Auto-select product on desktop if query parameter is present
                  if (productId != null && productId.isNotEmpty && !isMobile) {
                    // Use a post-frame callback to avoid calling setState during build
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      controller.selectItemById(productId).catchError((error) {
                        // Silently handle error if product not found
                      });
                    });
                  }

                  return StreamBuilder<InventoryLevelWithProduct?>(
                    stream: controller.selectedItemStream,
                    builder: (context, selectedSnapshot) {
                      final selectedItem = selectedSnapshot.data;

                      return isMobile
                          ? const SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                            horizontal: AppConstants.spacingM,
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
                                      child:
                                          StreamBuilder<
                                            List<InventoryTransaction>
                                          >(
                                            stream:
                                                controller.transactionsStream,
                                            builder: (context, transactionsSnapshot) {
                                              final transactions =
                                                  transactionsSnapshot.data ??
                                                  [];

                                              return InventoryDetailView(
                                                item: selectedItem,
                                                transactions: transactions,
                                                onAdjustStock: () {},
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
    );
  }
}
