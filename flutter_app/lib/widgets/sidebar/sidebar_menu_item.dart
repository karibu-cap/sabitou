import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../utils/app_constants.dart';

/// The sidebar item.
class SideBarItem {
  /// The sidebar item id.
  final DashboardItem id;

  /// The sidebar item label.
  final String label;

  /// The sidebar item icon.
  final IconData icon;

  /// The sidebar item roles.
  final List<ResourceType> roles;

  /// The sidebar item children.
  final List<SideBarItem>? children;

  /// Constructs the new sidebar item.
  SideBarItem({
    required this.id,
    required this.label,
    required this.icon,
    required this.roles,
    this.children,
  });
}

/// The sidebar menu item.
class SidebarMenuItem extends StatelessWidget {
  /// The sidebar menu item.
  final SideBarItem item;

  /// The active tab.
  final DashboardItem activeTab;

  /// The on tab change callback.
  final Function(DashboardItem) onTabChange;

  /// The user role.
  final ResourceType userRole;

  /// The is child.
  final bool isChild;

  /// Constructs the new [SidebarMenuItem].
  const SidebarMenuItem({
    super.key,
    required this.item,
    required this.activeTab,
    required this.onTabChange,
    required this.userRole,
    this.isChild = false,
  });

  @override
  Widget build(BuildContext context) {
    bool hasAccess(List<ResourceType> requiredRoles, ResourceType userRole) {
      return requiredRoles.contains(userRole);
    }

    if (!hasAccess(item.roles, userRole)) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        _ItemWidget(
          onTabChange: onTabChange,
          item: item,
          isChild: isChild,
          isActive: activeTab == item.id,
          theme: ShadTheme.of(context),
        ),
        if (item.children != null) ...[
          const SizedBox(height: 4),
          ...(item.children ?? []).map(
            (child) => SidebarMenuItem(
              item: child,
              activeTab: activeTab,
              onTabChange: onTabChange,
              userRole: userRole,
              isChild: true,
            ),
          ),
        ],
      ],
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.onTabChange,
    required this.item,
    required this.isChild,
    required this.isActive,
    required this.theme,
  });

  final Function(DashboardItem) onTabChange;
  final SideBarItem item;
  final bool isChild;
  final bool isActive;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () => onTabChange(item.id),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: isChild ? 32 : 16,
            vertical: isChild ? 8 : 12,
          ),
          decoration: BoxDecoration(
            color: isActive
                ? theme.colorScheme.primary
                : theme.colorScheme.secondary,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            children: [
              Icon(
                item.icon,
                size: isChild ? 18 : 20,
                color: isActive
                    ? theme.colorScheme.primaryForeground
                    : theme.colorScheme.primary,
              ),
              const SizedBox(width: 12),
              Text(
                item.label,
                style: ShadTheme.of(context).textTheme.p.copyWith(
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  color: isActive
                      ? theme.colorScheme.primaryForeground
                      : theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
