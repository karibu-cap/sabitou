import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../widgets/loading.dart';
import 'components/global_products_header.dart';
import 'components/global_products_list.dart';
import 'components/global_products_stats_grid.dart';
import 'components/list/global_products_search_filters.dart';
import 'global_products_controller.dart';

/// Global products view.ewsD
class GlobalProductsView extends StatelessWidget {
  /// Constructs the GlobalProductsView.
  const GlobalProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProductsController>(
      create: (_) => GlobalProductsController(),
      child: const GlobalProductsContent(),
    );
  }
}

/// Global products content.
class GlobalProductsContent extends StatelessWidget {
  /// Constructs the global products content.
  const GlobalProductsContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );

    return StreamBuilder<List<GlobalProduct>>(
      stream: controller.globalProductsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loading());
        }

        final globalProducts = snapshot.data ?? [];

        return SingleChildScrollView(
          child: Column(
            spacing: 32,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const GlobalProductsHeader(),
              GlobalProductsStatsGrid(globalProducts: globalProducts),
              const GlobalProductsSearchFilters(),
              const GlobalProductsList(),
            ],
          ),
        );
      },
    );
  }
}
