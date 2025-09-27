import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'categories_controller.dart';
import 'categories_view_model.dart';
import 'components/categories_header.dart';
import 'components/categories_list.dart';
import 'components/categories_stats_grid.dart';
import 'components/list/categories_search_filters.dart';

/// Categories view.
class CategoriesView extends StatelessWidget {
  /// Constructs the CategoriesView.
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoriesController>(
      create: (_) => CategoriesController(CategoriesViewModel()),
      child: const CategoriesContent(),
    );
  }
}

/// Categories content.
class CategoriesContent extends StatelessWidget {
  /// Constructs the categories content.
  const CategoriesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesHeader(),
          CategoriesStatsGrid(),
          CategoriesSearchFilters(),
          CategoriesList(),
        ],
      ),
    );
  }
}
