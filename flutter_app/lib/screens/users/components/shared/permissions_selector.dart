import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart'; // contient StorePermissions
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Reusable permissions selector component for user invitation and permissions modals
class PermissionsSelector extends StatelessWidget {
  /// Check if a permission is selected.
  final bool Function(bool Function(StorePermissions) path)
  isPermissionSelected;

  /// Toggle a permission on/off.
  final void Function(
    bool Function(StorePermissions) path,
    void Function(StorePermissions, bool) set,
  )
  onTogglePermission;

  /// Check if all permissions in a group are selected.
  final bool Function(List<bool Function(StorePermissions)>) isGroupSelected;

  /// Toggle all permissions in a group on/off.
  final void Function(
    List<
      (
        bool Function(StorePermissions) path,
        void Function(StorePermissions, bool) set,
      )
    >,
    bool value,
  )
  onToggleGroup;

  /// Creates a new PermissionsSelector.
  const PermissionsSelector({
    super.key,
    required this.isPermissionSelected,
    required this.onTogglePermission,
    required this.isGroupSelected,
    required this.onToggleGroup,
  });

  @override
  Widget build(BuildContext context) {
    final groups = [
      _PermissionGroupData(
        title: Intls.to.products,
        icon: LucideIcons.package400,
        items: [
          _PermissionItemData(
            title: Intls.to.viewProducts,
            isSelected: () =>
                isPermissionSelected((p) => p.product.readProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.readProductInInventory,
              (p, val) => p.product.readProductInInventory = val,
            ),
            path: (p) => p.product.readProductInInventory,
            set: (p, val) => p.product.readProductInInventory = val,
          ),
          _PermissionItemData(
            title: Intls.to.createNewProductsWithPrices,
            isSelected: () =>
                isPermissionSelected((p) => p.product.createProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.createProductInInventory,
              (p, val) => p.product.createProductInInventory = val,
            ),
            path: (p) => p.product.createProductInInventory,
            set: (p, val) => p.product.createProductInInventory = val,
          ),
          _PermissionItemData(
            title: Intls.to.editProductInformationPriceStock,
            isSelected: () =>
                isPermissionSelected((p) => p.product.updateProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.updateProductInInventory,
              (p, val) => p.product.updateProductInInventory = val,
            ),
            path: (p) => p.product.updateProductInInventory,
            set: (p, val) => p.product.updateProductInInventory = val,
          ),
          _PermissionItemData(
            title: Intls.to.deleteProducts,
            isSelected: () =>
                isPermissionSelected((p) => p.product.deleteProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.deleteProductInInventory,
              (p, val) => p.product.deleteProductInInventory = val,
            ),
            path: (p) => p.product.deleteProductInInventory,
            set: (p, val) => p.product.deleteProductInInventory = val,
          ),
        ],
      ),
      _PermissionGroupData(
        title: Intls.to.members,
        icon: LucideIcons.users400,
        items: [
          _PermissionItemData(
            title: Intls.to.consultSupplierListContactInfo,
            isSelected: () =>
                isPermissionSelected((p) => p.member.readInformation),
            toggle: () => onTogglePermission(
              (p) => p.member.readInformation,
              (p, val) => p.member.readInformation = val,
            ),
            path: (p) => p.member.readInformation,
            set: (p, val) => p.member.readInformation = val,
          ),
          _PermissionItemData(
            title: Intls.to.inviteNewMembers,
            isSelected: () =>
                isPermissionSelected((p) => p.member.inviteMember),
            toggle: () => onTogglePermission(
              (p) => p.member.inviteMember,
              (p, val) => p.member.inviteMember = val,
            ),
            path: (p) => p.member.inviteMember,
            set: (p, val) => p.member.inviteMember = val,
          ),
          _PermissionItemData(
            title: Intls.to.updateMembersPermissionsAndStatus,
            isSelected: () =>
                isPermissionSelected((p) => p.member.updateMember),
            toggle: () => onTogglePermission(
              (p) => p.member.updateMember,
              (p, val) => p.member.updateMember = val,
            ),
            path: (p) => p.member.updateMember,
            set: (p, val) => p.member.updateMember = val,
          ),
          _PermissionItemData(
            title: Intls.to.deleteMembers,
            isSelected: () =>
                isPermissionSelected((p) => p.member.deleteMember),
            toggle: () => onTogglePermission(
              (p) => p.member.deleteMember,
              (p, val) => p.member.deleteMember = val,
            ),
            path: (p) => p.member.deleteMember,
            set: (p, val) => p.member.deleteMember = val,
          ),
        ],
      ),

      _PermissionGroupData(
        title: Intls.to.reports,
        icon: LucideIcons.chartColumn400,
        items: [
          _PermissionItemData(
            title: Intls.to.consultMetricsHistoryAnalytics,
            isSelected: () => isPermissionSelected((p) => p.report.readReport),
            toggle: () => onTogglePermission(
              (p) => p.report.readReport,
              (p, val) => p.report.readReport = val,
            ),
            path: (p) => p.report.readReport,
            set: (p, val) => p.report.readReport = val,
          ),
        ],
      ),
      _PermissionGroupData(
        title: Intls.to.orders,
        icon: LucideIcons.shoppingBag400,
        items: [
          _PermissionItemData(
            title: Intls.to.viewOrders,
            isSelected: () => isPermissionSelected((p) => p.order.readOrder),
            toggle: () => onTogglePermission(
              (p) => p.order.readOrder,
              (p, val) => p.order.readOrder = val,
            ),
            path: (p) => p.order.readOrder,
            set: (p, val) => p.order.readOrder = val,
          ),
          _PermissionItemData(
            title: Intls.to.createNewOrdersRecordSales,
            isSelected: () => isPermissionSelected((p) => p.order.createOrder),
            toggle: () => onTogglePermission(
              (p) => p.order.createOrder,
              (p, val) => p.order.createOrder = val,
            ),
            path: (p) => p.order.createOrder,
            set: (p, val) => p.order.createOrder = val,
          ),
        ],
      ),

      _PermissionGroupData(
        title: Intls.to.invoices,
        icon: LucideIcons.receipt400,
        items: [
          _PermissionItemData(
            title: Intls.to.viewInvoices,
            isSelected: () =>
                isPermissionSelected((p) => p.invoice.readInvoice),
            toggle: () => onTogglePermission(
              (p) => p.invoice.readInvoice,
              (p, val) => p.invoice.readInvoice = val,
            ),
            path: (p) => p.invoice.readInvoice,
            set: (p, val) => p.invoice.readInvoice = val,
          ),
          _PermissionItemData(
            title: Intls.to.createInvoices,
            isSelected: () =>
                isPermissionSelected((p) => p.invoice.createInvoice),
            toggle: () => onTogglePermission(
              (p) => p.invoice.createInvoice,
              (p, val) => p.invoice.createInvoice = val,
            ),
            path: (p) => p.invoice.createInvoice,
            set: (p, val) => p.invoice.createInvoice = val,
          ),
        ],
      ),
      _PermissionGroupData(
        title: Intls.to.suppliers,
        icon: Icons.local_shipping,
        items: [
          _PermissionItemData(
            title: Intls.to.consultSupplierListContactInfo,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.readSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.readSupplier,
              (p, val) => p.supplier.readSupplier = val,
            ),
            path: (p) => p.supplier.readSupplier,
            set: (p, val) => p.supplier.readSupplier = val,
          ),
          _PermissionItemData(
            title: Intls.to.viewSuppliers,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.createSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.createSupplier,
              (p, val) => p.supplier.createSupplier = val,
            ),
            path: (p) => p.supplier.createSupplier,
            set: (p, val) => p.supplier.createSupplier = val,
          ),
          _PermissionItemData(
            title: Intls.to.editSupplierInformation,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.updateSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.updateSupplier,
              (p, val) => p.supplier.updateSupplier = val,
            ),
            path: (p) => p.supplier.updateSupplier,
            set: (p, val) => p.supplier.updateSupplier = val,
          ),
          _PermissionItemData(
            title: Intls.to.deleteSuppliers,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.deleteSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.deleteSupplier,
              (p, val) => p.supplier.deleteSupplier = val,
            ),
            path: (p) => p.supplier.deleteSupplier,
            set: (p, val) => p.supplier.deleteSupplier = val,
          ),
        ],
      ),
      _PermissionGroupData(
        title: Intls.to.transactions,
        icon: LucideIcons.dollarSign400,
        items: [
          _PermissionItemData(
            title: Intls.to.viewTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.readTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.readTransaction,
              (p, val) => p.transaction.readTransaction = val,
            ),
            path: (p) => p.transaction.readTransaction,
            set: (p, val) => p.transaction.readTransaction = val,
          ),
          _PermissionItemData(
            title: Intls.to.createTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.createTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.createTransaction,
              (p, val) => p.transaction.createTransaction = val,
            ),
            path: (p) => p.transaction.createTransaction,
            set: (p, val) => p.transaction.createTransaction = val,
          ),
          _PermissionItemData(
            title: Intls.to.editTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.updateTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.updateTransaction,
              (p, val) => p.transaction.updateTransaction = val,
            ),
            path: (p) => p.transaction.updateTransaction,
            set: (p, val) => p.transaction.updateTransaction = val,
          ),
        ],
      ),
    ];

    final content = ListView.separated(
      itemCount: groups.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => PermissionGroupWidget(
        data: groups[i],
        isGroupSelected: isGroupSelected,
        onToggleGroup: onToggleGroup,
      ),
    );

    return content;
  }
}

/// Internal data class for permission group.
class _PermissionGroupData {
  /// The title.
  final String title;

  /// The icon.
  final IconData icon;

  /// The Permissions items.
  final List<_PermissionItemData> items;

  /// Creates a new _PermissionGroupData.
  const _PermissionGroupData({
    required this.title,
    required this.icon,
    required this.items,
  });
}

/// Internal data class for permission item.
class _PermissionItemData {
  /// The title.
  final String title;

  /// The isSelected callback.
  final bool Function() isSelected;

  /// The toggle callback.
  final VoidCallback toggle;

  /// The path getter.
  final bool Function(StorePermissions) path;

  /// The setter.
  final void Function(StorePermissions, bool) set;

  /// Creates a new _PermissionItemData.
  const _PermissionItemData({
    required this.title,
    required this.isSelected,
    required this.toggle,
    required this.path,
    required this.set,
  });
}

/// Permission group widget with group-level switch.
class PermissionGroupWidget extends StatelessWidget {
  /// The group data.
  final _PermissionGroupData data;

  /// Check if all permissions in a group are selected.
  final bool Function(List<bool Function(StorePermissions)>) isGroupSelected;

  /// Toggle all permissions in a group on/off.
  final void Function(
    List<
      (
        bool Function(StorePermissions) path,
        void Function(StorePermissions, bool) set,
      )
    >,
    bool value,
  )
  onToggleGroup;

  /// Creates a new PermissionGroupWidget.
  const PermissionGroupWidget({
    super.key,
    required this.data,
    required this.isGroupSelected,
    required this.onToggleGroup,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final paths = data.items.map((i) => i.path).toList();
    final allSelected = isGroupSelected(paths);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 12,
      children: [
        const SizedBox(height: 12),
        Row(
          children: [
            Icon(data.icon, size: 20),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                data.title,
                style: theme.textTheme.h4.copyWith(fontWeight: FontWeight.w600),
              ),
            ),
            ShadSwitch(
              value: allSelected,
              onChanged: (value) {
                final toggles = data.items.map((i) => (i.path, i.set)).toList();
                onToggleGroup(toggles, value);
              },
            ),
          ],
        ),
        ...data.items
            .map((item) => PermissionTile(item: item))
            .expand(
              (e) => [Divider(color: theme.colorScheme.border, height: 1), e],
            ),
      ],
    );
  }
}

/// Permission item (data + toggle logic).
class PermissionItem {
  /// The title.
  final String title;

  /// The isSelected callback.
  final bool Function() isSelected;

  /// The toggle callback.
  final VoidCallback toggle;

  /// Creates a new PermissionItem.
  const PermissionItem({
    required this.title,
    required this.isSelected,
    required this.toggle,
  });
}

/// Tile for each permission
class PermissionTile extends StatelessWidget {
  /// The item.
  final _PermissionItemData item;

  /// Creates a new PermissionTile.
  const PermissionTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final value = item.isSelected();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
      child: InkWell(
        onTap: item.toggle,
        child: Row(
          children: [
            Expanded(child: Text(item.title, style: theme.textTheme.muted)),
            ShadSwitch(value: value, onChanged: (_) => item.toggle()),
          ],
        ),
      ),
    );
  }
}
