import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../widgets/error/loading_failed.dart';
import '../categories_controller.dart';
import 'list/categories_data_table.dart';
import 'list/categories_empty_state.dart';
import 'list/categories_list_header.dart';
import 'list/categories_shimmer_widgets.dart';

/// Widget for displaying the list of categories.
class CategoriesList extends StatelessWidget {
  /// Creates a new [CategoriesList].
  const CategoriesList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoriesController>(
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
            child: CategoriesListHeader(),
          ),
          const SizedBox(height: 16),

          StreamBuilder<List<Category>>(
            stream: controller.filteredCategoriesStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CategorieShimmerWidgets.buildTableShimmer();
              }
              final error = snapshot.error;
              if (snapshot.hasError && error != null) {
                return LoadingFailedWidget(error: error);
              }
              final categories = snapshot.data ?? [];
              if (categories.isEmpty) {
                return const CategoriesEmptyState();
              }

              return CategoriesDataTable(categories: categories);
            },
          ),
        ],
      ),
    );
  }
}
