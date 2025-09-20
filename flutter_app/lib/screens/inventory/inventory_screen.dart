import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/inentory_stats.dart';
import 'components/product_table.dart';
import 'components/search_and_filter.dart';
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

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: isMobile
                          ? AppConstants.spacingM
                          : AppConstants.spacingL,
                      children: const [
                        InventoryHeader(),
                        InventoryStats(),
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
