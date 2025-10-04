import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/product_table.dart';
import 'components/search_and_filter.dart';
import 'products_list_controller.dart';
import 'products_list_view_model.dart';

/// Products list screen.
class ProductsListScreen extends StatelessWidget {
  /// Constructs of new [ProductsListScreen].
  const ProductsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<ProductsListViewModel>(
      ProductsListViewModel.new,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveUtils.isMobile(context);

        return ChangeNotifierProvider(
          create: (context) => ProductsListController(viewModel),
          child: Consumer<ProductsListController>(
            builder: (context, controller, child) {
              return FutureBuilder<bool>(
                future: controller.completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: isMobile
                          ? AppConstants.spacingM
                          : AppConstants.spacingL,
                      children: const [
                        ProductsListHeader(),
                        SearchAndFilterCard(),
                        ProductsTable(),
                      ],
                    ),
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
