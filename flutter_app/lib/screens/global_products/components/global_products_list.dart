import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../widgets/error/loading_failed.dart';
import '../global_products_controller.dart';
import 'list/global_products_data_table.dart';
import 'list/global_products_empty_state.dart';
import 'list/global_products_list_header.dart';
import 'list/global_products_shimmer_widgets.dart';

/// Widget for displaying the list of global products.
class GlobalProductsList extends StatelessWidget {
  /// Creates a new [GlobalProductsList].
  const GlobalProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: GlobalProductsListHeader(),
          ),
          const SizedBox(height: 16),

          StreamBuilder<List<GlobalProduct>>(
            stream: controller.filteredGlobalProductsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return GlobalProductsShimmerWidgets.buildTableShimmer();
              }
              final error = snapshot.error;
              if (snapshot.hasError && error != null) {
                return LoadingFailedWidget(error: error);
              }
              final globalProducts = snapshot.data ?? [];
              if (globalProducts.isEmpty) {
                return const GlobalProductsEmptyState();
              }

              return GlobalProductDataTable(globalProducts: globalProducts);
            },
          ),
        ],
      ),
    );
  }
}
