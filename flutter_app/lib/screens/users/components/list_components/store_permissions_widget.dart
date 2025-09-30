import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// A widget that displays store permissions in a modern, user-friendly design.
class StorePermissionsWidget extends StatelessWidget {
  /// The store permissions to display.
  final StorePermissions permissions;

  /// Creates a new [StorePermissionsWidget].
  const StorePermissionsWidget({super.key, required this.permissions});

  /// Builds a permission group.
  Widget _buildPermissionGroup(ShadThemeData theme, _PermissionGroup group) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: group.color.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: group.color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title with icon
          Row(
            children: [
              Icon(group.icon, size: 20, color: group.color),
              const SizedBox(width: 8),
              Text(
                group.title,
                style: theme.textTheme.p.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: group.color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Action chips
          Wrap(
            spacing: 6,
            runSpacing: 6,
            children: group.actions.entries.map((entry) {
              return _buildActionChip(
                theme,
                entry.key,
                entry.value,
                group.color,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildActionChip(
    ShadThemeData theme,
    String actionName,
    bool enabled,
    Color color,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: enabled
            ? color.withValues(alpha: 0.15)
            : Colors.grey.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: enabled
              ? color.withValues(alpha: 0.4)
              : Colors.grey.withValues(alpha: 0.2),
          width: 0.8,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            enabled ? Icons.check_circle : Icons.cancel,
            size: 14,
            color: enabled ? color : Colors.grey,
          ),
          const SizedBox(width: 6),
          Text(
            actionName,
            style: theme.textTheme.p.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: enabled ? color : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final permissionGroups = [
      _PermissionGroup(
        title: Intls.to.products,
        icon: Icons.inventory_2,
        color: const Color(0xFFF59E0B), //const Color(0xFFEF4444),
        actions: {
          Intls.to.read: permissions.product.readProductInInventory,
          Intls.to.create: permissions.product.createProductInInventory,
          Intls.to.update: permissions.product.updateProductInInventory,
          Intls.to.delete: permissions.product.deleteProductInInventory,
        },
      ),
      _PermissionGroup(
        title: Intls.to.members,
        icon: Icons.group,
        color: const Color(0xFF3B82F6),
        actions: {
          Intls.to.read: permissions.member.readInformation,
          Intls.to.invite: permissions.member.inviteMember,
          Intls.to.update: permissions.member.updateMember,
          Intls.to.delete: permissions.member.deleteMember,
        },
      ),
      _PermissionGroup(
        title: Intls.to.reports,
        icon: Icons.bar_chart,
        color: const Color(0xFF10B981),
        actions: {Intls.to.read: permissions.report.readReport},
      ),
      _PermissionGroup(
        title: Intls.to.orders,
        icon: Icons.shopping_cart,
        color: const Color(0xFF8B5CF6),
        actions: {
          Intls.to.read: permissions.order.readOrder,
          Intls.to.create: permissions.order.createOrder,
        },
      ),
      _PermissionGroup(
        title: Intls.to.invoices,
        icon: Icons.description,
        color: const Color(0xFFF59E0B),
        actions: {
          Intls.to.read: permissions.invoice.readInvoice,
          Intls.to.create: permissions.invoice.createInvoice,
        },
      ),
      _PermissionGroup(
        title: Intls.to.suppliers,
        icon: Icons.local_shipping,
        color: const Color(0xFF0EA5E9),
        actions: {
          Intls.to.read: permissions.supplier.readSupplier,
          Intls.to.create: permissions.supplier.createSupplier,
          Intls.to.update: permissions.supplier.updateSupplier,
          Intls.to.delete: permissions.supplier.deleteSupplier,
        },
      ),
      _PermissionGroup(
        title: Intls.to.transactions,
        icon: Icons.attach_money,
        color: const Color(0xFF9333EA),
        actions: {
          Intls.to.read: permissions.transaction.readTransaction,
          Intls.to.create: permissions.transaction.createTransaction,
          Intls.to.update: permissions.transaction.updateTransaction,
        },
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ...permissionGroups.map((group) => _buildPermissionGroup(theme, group)),
      ],
    );
  }
}

class _PermissionGroup {
  final String title;
  final IconData icon;
  final Color color;
  final Map<String, bool> actions;

  _PermissionGroup({
    required this.title,
    required this.icon,
    required this.color,
    required this.actions,
  });
}
