import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/extensions/store_member_extenxion.dart';
import '../../../../utils/formatters.dart';
import '../../../../widgets/shad_data_grid.dart';
import '../../users_controller.dart';
import '../dialogs/user_deletion/user_deletion_view.dart';
import '../dialogs/user_permissions/user_permissions_view.dart';

/// Users list view using ShadDataGrid with professional styling
class UsersDataGridView extends StatelessWidget {
  /// Creates a new [UsersDataGridView].
  const UsersDataGridView({super.key, required this.storeMembers});

  /// List of store members to display
  final List<({StoreMember storeMember, User user})> storeMembers;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<UsersController>(context, listen: false);

    return ShadDataGrid<({StoreMember storeMember, User user})>(
      data: storeMembers,
      footerFrozenColumnsCount: 1,
      columns: [
        ShadDataGridColumn(label: Intls.to.members, width: 280),
        ShadDataGridColumn(label: Intls.to.contactInfoText, width: 280),
        ShadDataGridColumn(label: Intls.to.status, width: 280),
        ShadDataGridColumn(label: Intls.to.permissions, width: 280),
        ShadDataGridColumn(label: Intls.to.joined, width: 150),
        ShadDataGridColumn(
          label: Intls.to.actions,
          width: 120,
          alignment: Alignment.center,
        ),
      ],
      rowBuilder: (storeMember) {
        return [
          _UserCell(user: storeMember.user, controller: controller),
          _ContactCell(user: storeMember.user),
          _StatusCell(storeMember: storeMember.storeMember),
          _PermissionsCell(storeMember: storeMember.storeMember),
          _JoinedCell(storeMember: storeMember.storeMember),
          _ActionsCell(storeMember: storeMember, controller: controller),
        ];
      },
    );
  }
}

class _ContactCell extends StatelessWidget {
  const _ContactCell({required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Icon(
              LucideIcons.mail,
              size: 14,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                user.email,
                style: theme.textTheme.small.copyWith(
                  fontSize: 12,
                  color: theme.colorScheme.foreground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              LucideIcons.phone,
              size: 14,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Text(
                user.phoneNumber,
                style: theme.textTheme.small.copyWith(
                  fontSize: 12,
                  color: theme.colorScheme.foreground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _UserCell extends StatelessWidget {
  const _UserCell({required this.user, required this.controller});

  final User user;
  final UsersController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                colors: [
                  AppColors.purple,
                  AppColors.purple.withValues(alpha: 0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Center(
              child: Text(
                controller.getInitials(user),
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.foreground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  user.email,
                  style: theme.textTheme.small.copyWith(
                    fontSize: 12,
                    color: theme.colorScheme.mutedForeground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Status cell with badge
class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.storeMember});

  final StoreMember storeMember;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: _StatusBadge(status: storeMember.status),
    );
  }
}

/// Permissions cell with chips
class _PermissionsCell extends StatelessWidget {
  const _PermissionsCell({required this.storeMember});

  final StoreMember storeMember;

  int _getActivePermissionsCount(StorePermissions permissions) {
    int count = 0;
    // Products
    if (permissions.product.readProductInInventory) count++;
    if (permissions.product.createProductInInventory) count++;
    if (permissions.product.updateProductInInventory) count++;
    if (permissions.product.deleteProductInInventory) count++;
    // Orders
    if (permissions.order.readOrder) count++;
    if (permissions.order.createOrder) count++;
    // Members
    if (permissions.member.readInformation) count++;
    if (permissions.member.inviteMember) count++;
    if (permissions.member.updateMember) count++;
    if (permissions.member.deleteMember) count++;
    // Reports
    if (permissions.report.readReport) count++;
    // Invoices
    if (permissions.invoice.readInvoice) count++;
    if (permissions.invoice.createInvoice) count++;
    // Suppliers
    if (permissions.supplier.readSupplier) count++;
    if (permissions.supplier.createSupplier) count++;
    if (permissions.supplier.updateSupplier) count++;
    if (permissions.supplier.deleteSupplier) count++;
    // Transactions
    if (permissions.transaction.readTransaction) count++;
    if (permissions.transaction.createTransaction) count++;
    if (permissions.transaction.updateTransaction) count++;

    return count;
  }

  @override
  Widget build(BuildContext context) {
    final permissionCount = _getActivePermissionsCount(storeMember.permissions);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Wrap(
        spacing: 6,
        runSpacing: 4,
        children: [
          _PermissionChip(
            icon: LucideIcons.shieldCheck,
            label: '$permissionCount ${Intls.to.permissions}',
            color: AppColors.cobalt,
          ),
          if (storeMember.permissions.product.createProductInInventory ||
              storeMember.permissions.product.updateProductInInventory)
            _PermissionChip(
              icon: LucideIcons.package,
              label: Intls.to.products,
              color: AppColors.purple,
            ),
          if (storeMember.permissions.order.createOrder ||
              storeMember.permissions.order.readOrder)
            _PermissionChip(
              icon: LucideIcons.shoppingCart,
              label: Intls.to.orders,
              color: AppColors.dartGreen,
            ),
        ],
      ),
    );
  }
}

/// Joined date cell
class _JoinedCell extends StatelessWidget {
  const _JoinedCell({required this.storeMember});

  final StoreMember storeMember;

  String _getRelativeTime(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      final years = (difference.inDays / 365).floor();

      return '$years ${years == 1 ? 'year' : 'years'} ago';
    } else if (difference.inDays > 30) {
      final months = (difference.inDays / 30).floor();

      return '$months ${months == 1 ? 'month' : 'months'} ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'} ago';
    } else {
      return 'Today';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            Formatters.formatDate(storeMember.memberSince.toDateTime()),
            style: theme.textTheme.small.copyWith(
              fontWeight: FontWeight.w500,
              color: theme.colorScheme.foreground,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            _getRelativeTime(storeMember.memberSince.toDateTime()),
            style: theme.textTheme.small.copyWith(
              fontSize: 11,
              color: theme.colorScheme.mutedForeground,
            ),
          ),
        ],
      ),
    );
  }
}

/// Actions cell with buttons
class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.storeMember, required this.controller});

  final ({StoreMember storeMember, User user}) storeMember;
  final UsersController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Expanded(
            child: ShadTooltip(
              builder: (context) => Text(Intls.to.manageAccess),
              child: ShadIconButton.ghost(
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => ShadDialog(
                    scrollable: false,
                    child: UserPermissionsModal(
                      storeMember: storeMember,
                      usersController: controller,
                    ),
                  ),
                ),
                icon: Icon(
                  LucideIcons.eye,
                  size: 16,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
          ),
          Expanded(
            child: ShadTooltip(
              builder: (context) => Text(Intls.to.deleteUser),
              child: ShadIconButton.ghost(
                icon: Icon(
                  LucideIcons.trash2400,
                  size: 16,
                  color: theme.colorScheme.destructive,
                ),
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => ShadDialog(
                    child: UserDeletionModal(
                      storeMember: storeMember,
                      usersController: controller,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// Professional status badge with icon and color coding
class _StatusBadge extends StatelessWidget {
  final StoreMemberStatus status;

  const _StatusBadge({required this.status});
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadBadge(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      backgroundColor: status.color.withValues(alpha: 0.1),
      foregroundColor: status.color,
      hoverBackgroundColor: status.color.withValues(alpha: 0.1),
      child: Text(
        status.label,
        style: theme.textTheme.small.copyWith(fontSize: 12),
      ),
    );
  }
}

/// Permission chip for displaying permission categories
class _PermissionChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _PermissionChip({
    required this.icon,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        border: Border.all(color: color.withValues(alpha: 0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: theme.textTheme.small.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
              fontSize: 11,
            ),
          ),
        ],
      ),
    );
  }
}
