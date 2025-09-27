import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/global_products_header.dart';
import 'components/global_products_list.dart';
import 'components/global_products_stats_grid.dart';
import 'components/list/global_products_search_filters.dart';
import 'global_products_controller.dart';
import 'global_products_view_model.dart';

/// Global products view.
class GlobalProductsView extends StatelessWidget {
  /// Constructs the GlobalProductsView.
  const GlobalProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<GlobalProductsController>(
      create: (_) => GlobalProductsController(GlobalProductsViewModel()),
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
    return const SingleChildScrollView(
      child: Column(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GlobalProductsHeader(),
          GlobalProductsStatsGrid(),
          GlobalProductsSearchFilters(),
          GlobalProductsList(),
        ],
      ),
    );
  }
}
