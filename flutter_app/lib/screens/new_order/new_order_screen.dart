import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'components/cart_footer.dart';
import 'components/header.dart';
import 'components/hold_orders.dart';
import 'components/order_selected.dart';
import 'components/search_and_scan.dart';
import 'new_order_controller.dart';
import 'new_order_view_model.dart';

/// New order screen
class NewOrderScreen extends StatelessWidget {
  /// Constructors of new [NewOrderScreen].
  const NewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<NewOrderViewModel>(
      NewOrderViewModel.new,
    );

    return ChangeNotifierProvider(
      create: (_) => NewOrderController(viewModel),
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
                  NewOrderHeader(),
                  SearchAndScanView(),
                  OrderSelected(),
                  CartFooter(),
                ],
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
