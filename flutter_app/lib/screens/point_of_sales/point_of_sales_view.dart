import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'components/cart_footer.dart';
import 'components/header.dart';
import 'components/hold_orders.dart';
import 'components/order_selected.dart';
import 'components/search_and_scan.dart';
import 'point_of_sales_controller.dart';
import 'point_of_sales_view_models.dart';

/// Point of sales screen
class PointOfSalesView extends StatelessWidget {
  /// Constructors of new [PointOfSalesView].
  const PointOfSalesView({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<PointOfSalesViewModel>(
      PointOfSalesViewModel.new,
    );

    return ChangeNotifierProvider(
      create: (_) => PointOfSalesController(viewModel),
      child: const _SalesScreenContent(),
    );
  }
}

class _SalesScreenContent extends StatelessWidget {
  const _SalesScreenContent();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            SizedBox(
              height: constraints.maxHeight,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    PointOfSalesHeader(),
                    OrderSelected(),
                    SearchAndScanView(),
                    CartFooter(),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const HoldOrders(),
          ],
        );
      },
    );
  }
}
