import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Reusable permissions selector component for user invitation and permissions modals
class PermissionsSelector extends StatelessWidget {
  /// Permission selection callback.
  final bool Function(StoreResourceType, ResourceActionType)
  isPermissionSelected;

  /// Permission toggle callback.
  final void Function(StoreResourceType, ResourceActionType) onTogglePermission;

  /// Whether to show a scroll view.
  final bool showScrollView;

  /// Maximum height for the scroll view.
  final double? maxHeight;

  /// Permissions selector constructor.
  const PermissionsSelector({
    super.key,
    required this.isPermissionSelected,
    required this.onTogglePermission,
    this.showScrollView = true,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final permissionGroups = [
      PermissionGroup(
        title: AppInternationalizationService.to.dashboard,
        icon: Icons.dashboard,
        color: const Color(0xFF3B82F6),
        items: [
          PermissionItem(
            AppInternationalizationService.to.viewDashboard,
            AppInternationalizationService.to.accessOverviewAndMetrics,
            StoreResourceType.STORE_RESOURCE_TYPE_STORE,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
        ],
        isPermissionSelected: isPermissionSelected,
        onTogglePermission: onTogglePermission,
      ),
      PermissionGroup(
        title: AppInternationalizationService.to.analytics,
        icon: Icons.analytics,
        color: const Color(0xFF10B981),
        items: [
          PermissionItem(
            AppInternationalizationService.to.viewAnalytics,
            AppInternationalizationService.to.consultAnalyticalData,
            StoreResourceType.STORE_RESOURCE_TYPE_STORE,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          PermissionItem(
            AppInternationalizationService.to.viewReports,
            AppInternationalizationService.to.accessPerformanceReports,
            StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          PermissionItem(
            AppInternationalizationService.to.exportReports,
            AppInternationalizationService.to.downloadAndExportReportData,
            StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          PermissionItem(
            AppInternationalizationService.to.deleteReports,
            AppInternationalizationService.to.deleteReportData,
            StoreResourceType.STORE_RESOURCE_TYPE_INVOICE,
            ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
        ],
        isPermissionSelected: isPermissionSelected,
        onTogglePermission: onTogglePermission,
      ),
      PermissionGroup(
        title: AppInternationalizationService.to.orders,
        icon: Icons.shopping_cart,
        color: const Color(0xFF8B5CF6),
        items: [
          PermissionItem(
            AppInternationalizationService.to.orderStatistics,
            AppInternationalizationService.to.consultMetricsHistoryAnalytics,
            StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          PermissionItem(
            AppInternationalizationService.to.addOrders,
            AppInternationalizationService.to.createNewOrdersRecordSales,
            StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
          PermissionItem(
            AppInternationalizationService.to.editOrders,
            AppInternationalizationService.to.editOrderDetailsStatus,
            StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          PermissionItem(
            AppInternationalizationService.to.deleteOrders,
            AppInternationalizationService.to.cancelDeleteOrdersPermanently,
            StoreResourceType.STORE_RESOURCE_TYPE_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
        ],
        isPermissionSelected: isPermissionSelected,
        onTogglePermission: onTogglePermission,
      ),
      PermissionGroup(
        title: AppInternationalizationService.to.products,
        icon: Icons.inventory,
        color: const Color(0xFFF59E0B),
        items: [
          PermissionItem(
            AppInternationalizationService.to.viewProducts,
            AppInternationalizationService.to.consultInventoryPricesDetails,
            StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          PermissionItem(
            AppInternationalizationService.to.addProducts,
            AppInternationalizationService.to.createNewProductsWithPrices,
            StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
          PermissionItem(
            AppInternationalizationService.to.editProducts,
            AppInternationalizationService.to.editProductInformationPriceStock,
            StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          PermissionItem(
            AppInternationalizationService.to.deleteProducts,
            AppInternationalizationService.to.removeProductsPermanently,
            StoreResourceType.STORE_RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
        ],
        isPermissionSelected: isPermissionSelected,
        onTogglePermission: onTogglePermission,
      ),
      PermissionGroup(
        title: AppInternationalizationService.to.suppliers,
        icon: Icons.inventory,
        color: const Color(0xFFEF4444),
        items: [
          PermissionItem(
            AppInternationalizationService.to.viewSuppliers,
            AppInternationalizationService.to.consultSupplierListContactInfo,
            StoreResourceType.STORE_RESOURCE_TYPE_SUPPLIER_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ),
          PermissionItem(
            AppInternationalizationService.to.placeSupplierOrders,
            AppInternationalizationService.to.createPlaceNewSupplierOrders,
            StoreResourceType.STORE_RESOURCE_TYPE_SUPPLIER_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
          PermissionItem(
            AppInternationalizationService.to.editSupplierOrders,
            AppInternationalizationService.to.editSupplierOrderDetailsStatus,
            StoreResourceType.STORE_RESOURCE_TYPE_SUPPLIER_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          PermissionItem(
            AppInternationalizationService.to.cancelSupplierOrders,
            AppInternationalizationService.to.cancelDeleteSupplierOrders,
            StoreResourceType.STORE_RESOURCE_TYPE_SUPPLIER_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
        ],
        isPermissionSelected: isPermissionSelected,
        onTogglePermission: onTogglePermission,
      ),
    ];

    return SizedBox(
      height: maxHeight,
      child: ListView.separated(
        itemCount: permissionGroups.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) => permissionGroups[index],
      ),
    );
  }
}

/// Permission group widget
class PermissionGroup extends StatelessWidget {
  /// Permission group title.
  final String title;

  /// Permission group icon.
  final IconData icon;

  /// Permission group color.
  final Color color;

  /// Permission group items.
  final List<PermissionItem> items;

  /// Permission selection callback.
  final bool Function(StoreResourceType, ResourceActionType)
  isPermissionSelected;

  /// Permission toggle callback.
  final void Function(StoreResourceType, ResourceActionType) onTogglePermission;

  /// Permission group constructor.
  const PermissionGroup({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
    required this.isPermissionSelected,
    required this.onTogglePermission,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 18),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map(
          (item) => PermissionTile(
            item: item,
            color: color,
            isSelected: isPermissionSelected(
              item.resourceType,
              item.actionType,
            ),
            onToggle: () =>
                onTogglePermission(item.resourceType, item.actionType),
          ),
        ),
      ],
    );
  }
}

/// Permission item data class
class PermissionItem {
  /// Permission title.
  final String title;

  /// Permission description.
  final String description;

  /// Resource type.
  final StoreResourceType resourceType;

  /// Action type.
  final ResourceActionType actionType;

  /// Permission item constructor.
  const PermissionItem(
    this.title,
    this.description,
    this.resourceType,
    this.actionType,
  );
}

/// Permission tile widget
class PermissionTile extends StatelessWidget {
  /// Permission item.
  final PermissionItem item;

  /// Permission color.
  final Color color;

  /// Permission selection state.
  final bool isSelected;

  /// Permission toggle callback.
  final VoidCallback onToggle;

  /// Permission tile constructor.
  const PermissionTile({
    super.key,
    required this.item,
    required this.color,
    required this.isSelected,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return InkWell(
      onTap: onToggle,
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? color.withValues(alpha: 0.1)
              : Colors.grey.shade200,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            color: isSelected
                ? color
                : theme.textTheme.muted.color ?? Colors.grey.shade200,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.check_circle : Icons.circle_outlined,
              color: isSelected ? color : theme.textTheme.muted.color,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                      color: isSelected ? color : theme.textTheme.muted.color,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.description,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 12,
                      color: theme.textTheme.muted.color,
                    ),
                  ),
                ],
              ),
            ),
            Switch(
              value: isSelected,
              onChanged: (_) => onToggle(),
              activeColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
