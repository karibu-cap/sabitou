import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/user_preference.dart';
import '../../widgets/no_business_view.dart';
import 'categories_controller.dart';
import 'categories_view_model.dart';
import 'components/categories_header.dart';
import 'components/categories_list.dart';
import 'components/categories_stats_grid.dart';

/// Categories view.
class CategoriesView extends StatelessWidget {
  /// Constructs the CategoriesView.
  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final business = userPreferences.business;

    if (business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider<CategoriesController>(
      create: (_) =>
          CategoriesController(CategoriesViewModel(business: business)),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CategoriesHeader(),
          SizedBox(height: 32),
          CategoriesStatsGrid(),
          SizedBox(height: 32),
          CategoriesList(),
        ],
      ),
    );
  }
}
