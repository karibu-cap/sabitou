import 'package:auto_size_text/auto_size_text.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';
import '../../providers/auth/auth_provider.dart';
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

  int? findBranchIndexForPath(List<StatefulShellBranch> branches, String path) {
    print('=== DEBUG: Finding branch for path: $path ===');

    for (var i = 0; i < branches.length; i++) {
      final branch = branches[i];
      print('Branch $i:');
      print('  - defaultRoute: ${branch.defaultRoute?.path}');

      for (var route in branch.routes) {
        print('  - route: ${route.runtimeType}');
        if (route is GoRoute) {
          print('    path: ${route.path}');
          print('    name: ${route.name}');
        }
      }

      if (_branchContainsPath(branch, path)) {
        print('✓ MATCH FOUND at branch $i');

        return i;
      }
    }

    print('✗ NO MATCH FOUND');

    return null;
  }

  bool _branchContainsPath(StatefulShellBranch branch, String targetPath) {
    for (var route in branch.routes) {
      if (_routeMatchesPath(route, targetPath)) {
        return true;
      }
    }

    return false;
  }

  bool _routeMatchesPath(RouteBase route, String targetPath) {
    if (route is GoRoute) {
      print('    Checking route: ${route.path} against $targetPath');

      // Try exact match
      if (route.path == targetPath) {
        print('      ✓ Exact match!');

        return true;
      }

      // Try with/without leading slash
      if ('/${route.path}' == targetPath || route.path == '/$targetPath') {
        print('      ✓ Slash-adjusted match!');

        return true;
      }

      // Check child routes
      for (var child in route.routes) {
        if (_routeMatchesPath(child, targetPath)) {
          return true;
        }
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final user = UserPreferences.instance.user;
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
        path: PagesRoutes.inventory.pattern,
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
            id: DashboardItem.salesOrders,
            label: Intls.to.salesOrders,
            icon: LucideIcons.shoppingCart400,
            path: PagesRoutes.salesOrders.pattern,
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
        id: DashboardItem.reports,
        label: Intls.to.reports,
        icon: LucideIcons.chartColumn400,
        path: PagesRoutes.reports.pattern,
      ),
      SideBarItem(
        id: DashboardItem.suppliers,
        label: Intls.to.suppliers,
        icon: LucideIcons.truck400,
        path: PagesRoutes.suppliers.pattern,
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
          color: ShadTheme.of(context).colorScheme.background,
          border: Border(right: BorderSide(color: theme.colorScheme.border)),
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.border,
              blurRadius: 4,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            _BusinessInfo(),
            Divider(color: theme.colorScheme.border),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: ValueListenableBuilder(
                  valueListenable: _selected,
                  builder: (context, value, child) {
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
                                  context.go(tab.path ?? '');
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
            Divider(color: theme.colorScheme.border),

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
    final business = UserPreferences.instance.business;
    final store = UserPreferences.instance.store;

    if (business == null) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(24),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.fromBorderSide(
                BorderSide(color: ShadTheme.of(context).colorScheme.accent),
              ),
              color: ShadTheme.of(
                context,
              ).colorScheme.accent.withValues(alpha: 0.05),
            ),
            child:
                business.hasLogoLinkId() && AppUtils.isURL(business.logoLinkId)
                ? FutureBuilder(
                    future: precacheImage(
                      NetworkImage(business.logoLinkId),
                      context,
                      onError: (error, stackTrace) {
                        throw error;
                      },
                    ),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.error == null) {
                        return FadeInImage.assetNetwork(
                          placeholder: StaticImages.placeholder,
                          image: business.logoLinkId,
                          fit: BoxFit.contain,
                          imageErrorBuilder: (context, error, stackTrace) {
                            return Icon(
                              LucideIcons.store400,
                              size: 24,
                              color: ShadTheme.of(context).colorScheme.accent,
                            );
                          },
                          placeholderErrorBuilder:
                              (context, error, stackTrace) {
                                return Icon(
                                  LucideIcons.store400,
                                  color: ShadTheme.of(
                                    context,
                                  ).colorScheme.accent,
                                  size: 24,
                                );
                              },
                        );
                      }

                      return Icon(
                        LucideIcons.store400,
                        size: 24,
                        color: ShadTheme.of(context).colorScheme.accent,
                      );
                    },
                  )
                : Icon(
                    LucideIcons.store400,
                    size: 24,
                    color: ShadTheme.of(context).colorScheme.accent,
                  ),
          ),

          const SizedBox(width: 12),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  business.hasName() ? business.name : Intls.to.sabitu,
                  style: ShadTheme.of(context).textTheme.h4,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                if (store != null)
                  AutoSizeText(
                    '${Intls.to.store}: ${store.name}',
                    style: ShadTheme.of(context).textTheme.muted,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
