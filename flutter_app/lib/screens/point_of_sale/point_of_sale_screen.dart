import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/no_business_view.dart';
import '../../widgets/no_user_found.dart';
import 'components/cart_footer.dart';
import 'components/header.dart';
import 'components/hold_orders.dart';
import 'components/order_selected.dart';
import 'components/payment_section.dart';
import 'components/search_and_scan.dart';
import 'point_of_sale_controller.dart';
import 'point_of_sale_view_model.dart';
import 'utils/cart_provider.dart';
import 'utils/inventory_cache.dart';

/// Fixed width of the right-side payment panel on desktop.
const double _kPaymentPanelWidth = 370.0;

/// The [PointOfSaleScreen].
class PointOfSaleScreen extends StatelessWidget {
  /// Creates a [PointOfSaleScreen].
  const PointOfSaleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;
    final business = prefs.business;
    final user = prefs.user;

    if (user == null) {
      return const Scaffold(body: Center(child: NoUserFound()));
    }
    if (store == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    final cache = GetIt.I.registerSingletonIfAbsent(
      () => InventoryCache(store.refId),
    );
    final cart = GetIt.I.registerSingletonIfAbsent(
      () => CartProvider(store: store, user: user),
    );
    final viewModel = PointOfSaleViewModel(store: store);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PointOfSaleController(viewModel)),
        ChangeNotifierProvider<CartProvider>(create: (_) => cart),
        ChangeNotifierProvider<InventoryCache>(create: (_) => cache),
      ],
      child: _WarmUpWrapper(
        storeId: store.refId,
        child: _PosContent(store: store),
      ),
    );
  }
}

/// Calls [InventoryCache.warmUp] once when mounted.
///
/// Using a [StatefulWidget] here is intentional — `initState` fires exactly
/// once per screen visit, which is the right time to pre-load the cache.
class _WarmUpWrapper extends StatefulWidget {
  const _WarmUpWrapper({required this.storeId, required this.child});

  final String storeId;
  final Widget child;

  @override
  State<_WarmUpWrapper> createState() => _WarmUpWrapperState();
}

class _WarmUpWrapperState extends State<_WarmUpWrapper> {
  @override
  void initState() {
    super.initState();
    InventoryCache.instance.warmUp(widget.storeId);
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class _PosContent extends StatelessWidget {
  const _PosContent({required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);

    return isDesktop
        ? _DesktopLayout(store: store)
        : _MobileLayout(store: store);
  }
}

class _DesktopLayout extends StatelessWidget {
  const _DesktopLayout({required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    final cartH = MediaQuery.sizeOf(context).height * 0.54;

    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        POSHeader(store: store),
        const SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  const SearchAndScanView(),
                  const SizedBox(height: 12),
                  OrderSelected(maxHeight: cartH),
                  const SizedBox(height: 12),
                  const CartFooter(),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const SizedBox(width: _kPaymentPanelWidth, child: PaymentSection()),
          ],
        ),
        const SizedBox(height: 20),
        const HoldOrders(),
      ],
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({required this.store});

  final Store store;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.only(bottom: 32),
      children: [
        POSHeader(store: store),
        const SizedBox(height: 12),
        const SearchAndScanView(),
        const SizedBox(height: 12),
        const OrderSelected(),
        const SizedBox(height: 12),
        const CartFooter(showPayment: true),
        const SizedBox(height: 20),
        const HoldOrders(),
      ],
    );
  }
}
