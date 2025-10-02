import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/loading.dart';
import 'components/cart_footer.dart';
import 'components/header.dart';
import 'components/hold_orders.dart';
import 'components/order_selected.dart';
import 'components/preview_invoice.dart';
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
    final store = UserPreferences.instance.store;
    final isDesktop = ResponsiveUtils.isDesktop(context);

    if (store == null) {
      return const Center(child: Loading());
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView(
          children: [
            const POSHeader(),
            const SizedBox(height: 12),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 16,
              children: [
                const Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16,
                    children: <Widget>[
                      SearchAndScanView(),
                      OrderSelected(),
                      CartFooter(),
                    ],
                  ),
                ),
                if (isDesktop) Expanded(child: PreviewInvoice(store: store)),
              ],
            ),
            const SizedBox(height: 16),
            const HoldOrders(),
          ],
        );
      },
    );
  }
}
