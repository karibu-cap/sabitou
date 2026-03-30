import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';
import '../../providers/auth/auth_provider.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/user_preference.dart';
import '../../utils/utils.dart';
import '../app_header/current_user_view.dart';
import 'sidebar_menu_item.dart';

/// The sidebar widget.
class SidebarWidget extends StatelessWidget {
  /// The navigation shell.
  final StatefulNavigationShell navigationShell;

  /// The selected tab.
  final ValueNotifier<DashboardItem> _selected = ValueNotifier<DashboardItem>(
    DashboardItem.dashboard,
  );

  /// Constructs the new [SidebarWidget].
  SidebarWidget({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final auth = context.watch<AuthProvider>();
    final theme = ShadTheme.of(context);
    final user = auth.currentUser;
    final router = GoRouter.of(context);
    final path = router.routerDelegate.currentConfiguration.uri.toString();

    final List<SideBarItem<DashboardItem>> menuItems = [
      SideBarItem(
        id: DashboardItem.dashboard,
        label: Intls.to.dashboard,
        icon: LucideIcons.house400,
        path: PagesRoutes.dashboard.pattern,
      ),
      SideBarItem(
        id: DashboardItem.inventory,
        label: Intls.to.inventory,
        icon: LucideIcons.package400,
        children: [
          SideBarItem(
            id: DashboardItem.inventoryChildren,
            label: Intls.to.inventory,
            icon: LucideIcons.package400,
            path: PagesRoutes.inventory.pattern,
          ),
          SideBarItem(
            id: DashboardItem.productsList,
            label: Intls.to.productsList,
            icon: LucideIcons.package400,
            path: PagesRoutes.productsList.pattern,
          ),
        ],
      ),
      SideBarItem(
        id: DashboardItem.sales,
        label: Intls.to.sales,
        icon: LucideIcons.shoppingCart400,
        children: [
          SideBarItem(
            id: DashboardItem.cashReceipts,
            label: Intls.to.cashReceipts,
            icon: LucideIcons.printer400,
            path: PagesRoutes.cashReceipts.pattern,
          ),
          SideBarItem(
            id: DashboardItem.pos,
            label: Intls.to.pos,
            icon: LucideIcons.plus400,
            path: PagesRoutes.pos.pattern,
          ),
        ],
      ),
      SideBarItem(
        id: DashboardItem.purchaseOrdersParent,
        label: Intls.to.purchases,
        icon: LucideIcons.baggageClaim400,
        children: [
          SideBarItem(
            id: DashboardItem.suppliers,
            label: Intls.to.suppliers,
            icon: LucideIcons.truck400,
            path: PagesRoutes.suppliers.pattern,
          ),
          SideBarItem(
            id: DashboardItem.purchaseOrders,
            label: Intls.to.purchaseOrders,
            icon: LucideIcons.clipboardList400,
            path: PagesRoutes.purchaseOrders.pattern,
          ),
          SideBarItem(
            id: DashboardItem.purchaseReceives,
            label: Intls.to.purchaseReceives,
            icon: LucideIcons.packageCheck400,
            path: PagesRoutes.purchaseReceives.pattern,
          ),
          SideBarItem(
            id: DashboardItem.bills,
            label: Intls.to.bills,
            icon: LucideIcons.receipt400,
            path: PagesRoutes.bills.pattern,
          ),
          SideBarItem(
            id: DashboardItem.paymentsMade,
            label: Intls.to.paymentMade,
            icon: LucideIcons.banknote,
            path: PagesRoutes.payments.pattern,
          ),
        ],
      ),
      SideBarItem(
        id: DashboardItem.reports,
        label: Intls.to.reports,
        icon: LucideIcons.chartColumn400,
        path: PagesRoutes.reports.pattern,
      ),
      SideBarItem(
        id: DashboardItem.audits,
        label: Intls.to.audits,
        icon: LucideIcons.fileClock400,
        path: PagesRoutes.audits.pattern,
      ),
      SideBarItem(
        id: DashboardItem.members,
        label: Intls.to.members,
        icon: LucideIcons.users400,
        path: PagesRoutes.users.pattern,
      ),
      SideBarItem(
        id: DashboardItem.categories,
        label: Intls.to.categories,
        icon: Icons.category,
        path: PagesRoutes.categories.pattern,
      ),
      SideBarItem(
        id: DashboardItem.globalProducts,
        label: Intls.to.globalProducts,
        icon: LucideIcons.package,
        path: PagesRoutes.globalProducts.pattern,
      ),
      SideBarItem(
        id: DashboardItem.settings,
        label: Intls.to.settings,
        icon: LucideIcons.settings500,
        path: PagesRoutes.settings.pattern,
      ),
    ];

    _selected.value =
        menuItems.firstWhereOrNull((element) => path == element.path)?.id ??
        menuItems
            .map((e) => e.children)
            .expand((e) => e ?? <SideBarItem<DashboardItem>>[])
            .firstWhereOrNull((element) => path == element.path)
            ?.id ??
        DashboardItem.dashboard;

    return Drawer(
      shape: const RoundedRectangleBorder(),
      child: Container(
        width: AppConstants.sidebarWidth,
        decoration: BoxDecoration(
          color: theme.colorScheme.card,
          border: Border(right: BorderSide(color: theme.colorScheme.border)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.foreground.withValues(alpha: 0.04),
              blurRadius: 16,
              offset: const Offset(4, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            _BusinessInfo(),
            const ShadSeparator.horizontal(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: ValueListenableBuilder(
                  valueListenable: _selected,
                  builder: (context, value, _) {
                    return ListView(
                      children: menuItems
                          .map(
                            (item) => SidebarMenuItem<DashboardItem>(
                              item: item,
                              activeTab: value,
                              onTabChange: (tab) {
                                _selected.value = tab.id;

                                if (tab.path != null &&
                                    tab.path?.isNotEmpty == true) {
                                  AppRouter.go(context, tab.path ?? '');
                                }
                                if (Scaffold.of(context).isDrawerOpen) {
                                  Scaffold.of(context).closeDrawer();
                                }
                              },
                            ),
                          )
                          .toList(),
                    );
                  },
                ),
              ),
            ),
            const ShadSeparator.horizontal(),
            if (user != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: CurrentUserView(
                  user: user,
                  onLogout: AuthProvider.instance.logout,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final class _BusinessInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userPreference = context.watch<UserPreferences>();
    final store = userPreference.store;
    final business = userPreference.business;
    final theme = ShadTheme.of(context);

    if (business == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            height: 44,
            width: 44,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: theme.colorScheme.border),
              color: theme.colorScheme.accent,
            ),
            child:
                business.hasLogoLinkId() && AppUtils.isURL(business.logoLinkId)
                ? FutureBuilder(
                    future: precacheImage(
                      NetworkImage(business.logoLinkId),
                      context,
                      onError: (e, _) => throw e,
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.error == null) {
                        return FadeInImage.assetNetwork(
                          placeholder: StaticImages.placeholder,
                          placeholderFit: BoxFit.none,
                          image: business.logoLinkId,
                          fit: BoxFit.contain,
                          imageErrorBuilder: (_, __, ___) =>
                              const Icon(LucideIcons.store400, size: 18),
                          placeholderErrorBuilder: (_, __, ___) =>
                              const Icon(LucideIcons.store400, size: 18),
                        );
                      }

                      return const Icon(LucideIcons.store400, size: 20);
                    },
                  )
                : const Icon(LucideIcons.store400, size: 20),
          ),

          const SizedBox(width: 12),

          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  business.hasName() ? business.name : Intls.to.sabitu,
                  style: theme.textTheme.h4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                if (store != null) ...[
                  const SizedBox(height: 2),
                  AutoSizeText(
                    store.name,
                    style: theme.textTheme.muted,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
