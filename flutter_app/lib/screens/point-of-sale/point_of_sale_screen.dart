import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'components/cart_footer.dart';
import 'components/header.dart';
import 'components/order_selected.dart';
import 'components/search_and_scan.dart';
import 'point_of_sale_controller.dart';
import 'point_of_sale_view_model.dart';

/// New order screen
class PointOfSaleScreen extends StatelessWidget {
  /// Constructors of new [PointOfSaleScreen].
  const PointOfSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<PointOfSaleViewModel>(
      PointOfSaleViewModel.new,
    );

    return ChangeNotifierProvider(
      create: (_) => PointOfSaleController(viewModel),
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
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 16,
                children: [
                  POSHeader(),
                  SearchAndScanView(),
                  OrderSelected(),
                  CartFooter(),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // const HoldOrders(),
          ],
        );
      },
    );
  }
}
