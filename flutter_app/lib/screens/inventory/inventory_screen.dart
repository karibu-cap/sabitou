import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/product_table.dart';
import 'components/search_and_filter.dart';
import 'inventory_controller.dart';
import 'inventory_view_model.dart';

/// Inventory view.
class InventoryView extends StatelessWidget {
  /// Constructs of new [InventoryView].
  const InventoryView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<InventoryViewModel>(
      InventoryViewModel.new,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = ResponsiveUtils.isDesktop(context);

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
                    padding: EdgeInsets.all(isDesktop ? 24 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InventoryHeader(),
                        SizedBox(height: isDesktop ? 32 : 24),
                        const SearchAndFilterCard(),
                        SizedBox(height: isDesktop ? 24 : 16),
                        const ProductsTable(),
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
