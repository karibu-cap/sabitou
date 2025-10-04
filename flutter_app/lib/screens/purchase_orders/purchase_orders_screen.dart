import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/app_constants.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/header.dart';
import 'components/purchase_order_table.dart';
import 'components/search_and_scan.dart';
import 'purchase_orders_controller.dart';
import 'purchase_orders_view_model.dart';

/// The purchase orders screen.
final class PurchaseOrdersScreen extends StatelessWidget {
  /// The constructor.
  const PurchaseOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I
        .registerSingletonIfAbsent<PurchaseOrdersViewModel>(
          PurchaseOrdersViewModel.new,
        );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveUtils.isMobile(context);

        return ChangeNotifierProvider(
          create: (context) => PurchaseOrdersController(viewModel),
          child: Consumer<PurchaseOrdersController>(
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
                        PurchaseOrderHeader(),
                        SearchAndFilterCard(),
                        PurchaseOrderTable(),
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
