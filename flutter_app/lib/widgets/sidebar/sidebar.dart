import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';
import '../../../utils/responsive_utils.dart';
import '../../services/internationalization/internationalization.dart';
import 'sidebar_menu_item.dart';

/// The sidebar widget.
class SidebarWidget extends StatelessWidget {
  /// The active tab.
  final DashboardItem activeTab;

  /// The on tab change callback.
  final Function(DashboardItem) onTabChange;

  /// The is open.
  final bool isOpen;

  /// Constructs the new [SidebarWidget].
  const SidebarWidget({
    super.key,
    required this.activeTab,
    required this.onTabChange,
    required this.isOpen,
  });

  @override
  Widget build(BuildContext context) {
    const userRole = ResourceType.RESOURCE_TYPE_BUSINESS;
    final isTablet = ResponsiveUtils.isTablet(context);
    final theme = ShadTheme.of(context);

    bool hasAccess(List<ResourceType> requiredRoles, ResourceType userRole) {
      return requiredRoles.contains(userRole);
    }

    final List<SideBarItem> menuItems = [
      SideBarItem(
        id: DashboardItem.dashboard,
        label: Intls.to.dashboard,
        icon: LucideIcons.house400,
        roles: ResourceType.values,
      ),
      SideBarItem(
        id: DashboardItem.inventory,
        label: Intls.to.inventory,
        icon: LucideIcons.package400,
        roles: ResourceType.values,
      ),
      SideBarItem(
        id: DashboardItem.sales,
        label: Intls.to.sales,
        icon: LucideIcons.shoppingCart400,
        roles: ResourceType.values,
        children: [
          SideBarItem(
            id: DashboardItem.salesReports,
            label: Intls.to.reports,
            icon: LucideIcons.chartColumn400,
            roles: ResourceType.values,
          ),
          SideBarItem(
            id: DashboardItem.salesOrders,
            label: Intls.to.newOrders,
            icon: LucideIcons.plus400,
            roles: ResourceType.values,
          ),
        ],
      ),
      SideBarItem(
        id: DashboardItem.reports,
        label: Intls.to.reports,
        icon: LucideIcons.chartColumn400,
        roles: ResourceType.values,
      ),
      SideBarItem(
        id: DashboardItem.suppliers,
        label: Intls.to.suppliers,
        icon: LucideIcons.truck400,
        roles: ResourceType.values,
      ),
      SideBarItem(
        id: DashboardItem.users,
        label: Intls.to.users,
        icon: LucideIcons.users400,
        roles: ResourceType.values,
      ),
      SideBarItem(
        id: DashboardItem.settings,
        label: Intls.to.settings,
        icon: LucideIcons.settings500,
        roles: ResourceType.values,
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      transform: Matrix4.translationValues(
        isTablet && !isOpen ? -AppConstants.sidebarWidth : 0,
        0,
        0,
      ),
      child: Container(
        width: AppConstants.sidebarWidth,
        decoration: BoxDecoration(
          color: ShadTheme.of(context).colorScheme.secondary,
          boxShadow: [
            BoxShadow(
              color: theme.colorScheme.primaryForeground.withValues(alpha: 0.1),
              blurRadius: 4,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: ShadTheme.of(context).colorScheme.card,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    LucideIcons.store400,
                    size: 24,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(width: 12),
                  Text(
                    Intls.to.sabitu,
                    style: ShadTheme.of(context).textTheme.h4,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: menuItems
                      .where((item) => hasAccess(item.roles, userRole))
                      .map(
                        (item) => SidebarMenuItem(
                          item: item,
                          activeTab: activeTab,
                          onTabChange: onTabChange,
                          userRole: userRole,
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: ShadTheme.of(context).colorScheme.secondary,
                border: Border(
                  top: BorderSide(
                    color: ShadTheme.of(context).colorScheme.card,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.user400, size: 16),
                  const SizedBox(width: 8),
                  Text(
                    'Logged in as: ',
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                  Flexible(
                    child: AutoSizeText(
                      userRole.name,
                      style: ShadTheme.of(context).textTheme.table,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
