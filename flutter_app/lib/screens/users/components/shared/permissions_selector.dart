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

  /// Maximum height for the scroll view.
  final double? maxHeight;

  const PermissionsSelector({
    super.key,
    required this.isPermissionSelected,
    required this.onTogglePermission,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    final groups = [
      PermissionGroup(
        title: Intls.to.products,
        icon: Icons.inventory,
        color: const Color(0xFFF59E0B),
        items: [
          PermissionItem(
            title: Intls.to.viewProducts,
            isSelected: () =>
                isPermissionSelected((p) => p.product.readProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.readProductInInventory,
              (p, val) => p.product.readProductInInventory = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.createNewProductsWithPrices,
            isSelected: () =>
                isPermissionSelected((p) => p.product.createProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.createProductInInventory,
              (p, val) => p.product.createProductInInventory = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.editProductInformationPriceStock,
            isSelected: () =>
                isPermissionSelected((p) => p.product.updateProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.updateProductInInventory,
              (p, val) => p.product.updateProductInInventory = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.deleteProducts,
            isSelected: () =>
                isPermissionSelected((p) => p.product.deleteProductInInventory),
            toggle: () => onTogglePermission(
              (p) => p.product.deleteProductInInventory,
              (p, val) => p.product.deleteProductInInventory = val,
            ),
          ),
        ],
      ),
      PermissionGroup(
        title: Intls.to.members,
        icon: Icons.group,
        color: const Color(0xFF3B82F6),
        items: [
          PermissionItem(
            title: Intls.to.consultSupplierListContactInfo,
            isSelected: () =>
                isPermissionSelected((p) => p.member.readInformation),
            toggle: () => onTogglePermission(
              (p) => p.member.readInformation,
              (p, val) => p.member.readInformation = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.inviteNewMembers,
            isSelected: () =>
                isPermissionSelected((p) => p.member.inviteMember),
            toggle: () => onTogglePermission(
              (p) => p.member.inviteMember,
              (p, val) => p.member.inviteMember = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.updateMembersPermissionsAndStatus,
            isSelected: () =>
                isPermissionSelected((p) => p.member.updateMember),
            toggle: () => onTogglePermission(
              (p) => p.member.updateMember,
              (p, val) => p.member.updateMember = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.deleteMembers,
            isSelected: () =>
                isPermissionSelected((p) => p.member.deleteMember),
            toggle: () => onTogglePermission(
              (p) => p.member.deleteMember,
              (p, val) => p.member.deleteMember = val,
            ),
          ),
        ],
      ),

      PermissionGroup(
        title: Intls.to.reports,
        icon: Icons.bar_chart,
        color: const Color(0xFF10B981),
        items: [
          PermissionItem(
            title: Intls.to.consultMetricsHistoryAnalytics,
            isSelected: () => isPermissionSelected((p) => p.report.readReport),
            toggle: () => onTogglePermission(
              (p) => p.report.readReport,
              (p, val) => p.report.readReport = val,
            ),
          ),
        ],
      ),
      PermissionGroup(
        title: Intls.to.orders,
        icon: Icons.shopping_cart,
        color: const Color(0xFF8B5CF6),
        items: [
          PermissionItem(
            title: Intls.to.viewOrders,
            isSelected: () => isPermissionSelected((p) => p.order.readOrder),
            toggle: () => onTogglePermission(
              (p) => p.order.readOrder,
              (p, val) => p.order.readOrder = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.createNewOrdersRecordSales,
            isSelected: () => isPermissionSelected((p) => p.order.createOrder),
            toggle: () => onTogglePermission(
              (p) => p.order.createOrder,
              (p, val) => p.order.createOrder = val,
            ),
          ),
        ],
      ),

      PermissionGroup(
        title: Intls.to.invoices,
        icon: Icons.receipt_long,
        color: const Color(0xFFF59E0B),
        items: [
          PermissionItem(
            title: Intls.to.viewInvoices,
            isSelected: () =>
                isPermissionSelected((p) => p.invoice.readInvoice),
            toggle: () => onTogglePermission(
              (p) => p.invoice.readInvoice,
              (p, val) => p.invoice.readInvoice = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.createInvoices,
            isSelected: () =>
                isPermissionSelected((p) => p.invoice.createInvoice),
            toggle: () => onTogglePermission(
              (p) => p.invoice.createInvoice,
              (p, val) => p.invoice.createInvoice = val,
            ),
          ),
        ],
      ),
      PermissionGroup(
        title: Intls.to.suppliers,
        icon: Icons.local_shipping,
        color: const Color(0xFF0EA5E9),
        items: [
          PermissionItem(
            title: Intls.to.consultSupplierListContactInfo,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.readSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.readSupplier,
              (p, val) => p.supplier.readSupplier = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.viewSuppliers,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.createSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.createSupplier,
              (p, val) => p.supplier.createSupplier = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.editSupplierInformation,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.updateSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.updateSupplier,
              (p, val) => p.supplier.updateSupplier = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.deleteSuppliers,
            isSelected: () =>
                isPermissionSelected((p) => p.supplier.deleteSupplier),
            toggle: () => onTogglePermission(
              (p) => p.supplier.deleteSupplier,
              (p, val) => p.supplier.deleteSupplier = val,
            ),
          ),
        ],
      ),
      PermissionGroup(
        title: Intls.to.transactions,
        icon: Icons.attach_money,
        color: const Color(0xFF9333EA),
        items: [
          PermissionItem(
            title: Intls.to.viewTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.readTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.readTransaction,
              (p, val) => p.transaction.readTransaction = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.createTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.createTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.createTransaction,
              (p, val) => p.transaction.createTransaction = val,
            ),
          ),
          PermissionItem(
            title: Intls.to.editTransactions,
            isSelected: () =>
                isPermissionSelected((p) => p.transaction.updateTransaction),
            toggle: () => onTogglePermission(
              (p) => p.transaction.updateTransaction,
              (p, val) => p.transaction.updateTransaction = val,
            ),
          ),
        ],
      ),
    ];

    final content = ListView.separated(
      itemCount: groups.length,
      separatorBuilder: (_, __) => const SizedBox(height: 16),
      itemBuilder: (_, i) => groups[i],
    );

    return SizedBox(height: maxHeight, child: content);
  }
}

/// Permission group widget
class PermissionGroup extends StatelessWidget {
  /// The title.
  final String title;

  /// The icon.
  final IconData icon;

  /// The color.
  final Color color;

  /// The Permissions items.
  final List<PermissionItem> items;

  /// Creates a new PermissionGroup.
  const PermissionGroup({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(width: 8),
            Text(
              title,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w600,
                color: color,
                fontSize: 18,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        ...items.map((item) => PermissionTile(item: item, color: color)),
      ],
    );
  }
}

/// Permission item (data + toggle logic)
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
  final PermissionItem item;

  /// The color.
  final Color color;

  /// Creates a new PermissionTile.
  const PermissionTile({super.key, required this.item, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final value = item.isSelected();

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: value
            ? color.withValues(alpha: 0.1)
            : theme.colorScheme.secondary.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(
          color: value
              ? color
              : theme.colorScheme.primary.withValues(alpha: 0.3),
          width: 1.2,
        ),
      ),
      child: InkWell(
        onTap: item.toggle,
        child: Row(
          children: [
            Icon(
              value ? Icons.check_circle : Icons.circle_outlined,
              color: value ? color : theme.colorScheme.primary,
              size: 20,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                item.title,
                style: theme.textTheme.p.copyWith(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: value ? color : theme.colorScheme.primary,
                ),
              ),
            ),
            Switch(
              value: value,
              onChanged: (_) => item.toggle(),
              activeColor: color,
            ),
          ],
        ),
      ),
    );
  }
}
