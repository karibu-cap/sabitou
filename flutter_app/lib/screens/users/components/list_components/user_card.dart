import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_theme.dart';
import '../../../../utils/extensions/store_member_extenxion.dart';
import '../../../../utils/formatters.dart';
import '../../../../utils/user_preference.dart';
import '../../../../utils/utils.dart';
import '../../../../widgets/custom_grid.dart';
import '../../users_controller.dart';
import '../dialogs/user_deletion/user_deletion_view.dart';
import '../dialogs/user_permissions/user_permissions_view.dart';

/// Users grid view using CustomGrid with card-based layout
class UsersGridView extends StatelessWidget {
  /// Creates a new [UsersGridView].
  const UsersGridView({super.key, required this.storeMembers});

  /// List of store members to display
  final List<({StoreMember storeMember, User user})> storeMembers;

  @override
  Widget build(BuildContext context) {
    return CustomGrid(
      minItemWidth: 320,
      mainAxisExtent: 280,
      crossSpacing: 16,
      mainAxisSpacing: 16,
      children: storeMembers.map((storeMember) {
        return UserCard(storeMember: storeMember);
      }).toList(),
    );
  }
}

/// Individual user card widget
class UserCard extends StatelessWidget {
  /// Creates a new [UserCard].
  const UserCard({super.key, required this.storeMember});

  /// The store member and user data
  final ({StoreMember storeMember, User user}) storeMember;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.read<UsersController>();
    final userPreferences = context.watch<UserPreferences>();
    final currentUserId = userPreferences.user?.refId;
    final isCurrentUser = currentUserId == storeMember.user.refId;

    final popoverController = ShadPopoverController();

    void handleManagePermissions() {
      popoverController.hide();
      showDialog(
        context: context,
        builder: (context) => ShadDialog(
          scrollable: false,
          child: UserPermissionsModal(
            storeMember: storeMember,
            usersController: controller,
          ),
        ),
      );
    }

    void handleDelete() {
      popoverController.hide();
      showDialog(
        context: context,
        builder: (context) => ShadDialog(
          child: UserDeletionModal(
            storeMember: storeMember,
            usersController: controller,
          ),
        ),
      );
    }

    return InkWell(
      onTap: handleManagePermissions,
      borderRadius: const BorderRadius.all(Radius.circular(AppTheme.radiusSm)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.border),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppTheme.radiusSm),
          ),
          color: theme.colorScheme.card,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with avatar, name, and actions
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(child: _UserHeader(storeMember: storeMember)),
                  ShadPopover(
                    controller: popoverController,
                    child: ShadButton.ghost(
                      child: const Icon(LucideIcons.ellipsisVertical),
                      onPressed: popoverController.toggle,
                      hoverBackgroundColor: theme.colorScheme.primary
                          .withValues(alpha: 0.3),
                    ),
                    popover: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadButton.ghost(
                          child: Text(Intls.to.manageAccess),
                          leading: const Icon(LucideIcons.eye, size: 16),
                          onPressed: handleManagePermissions,
                        ),
                        if (!isCurrentUser)
                          ShadButton.ghost(
                            child: Text(
                              Intls.to.delete,
                              style: const TextStyle(
                                color: SabitouColors.danger,
                              ),
                            ),
                            leading: const Icon(
                              LucideIcons.trash2,
                              size: 16,
                              color: SabitouColors.danger,
                            ),
                            onPressed: handleDelete,
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Status
                    _InfoRow(
                      label: Intls.to.status,
                      expandedChild: false,
                      child: _StatusBadge(
                        status: storeMember.storeMember.status,
                      ),
                    ),

                    // Email
                    _InfoRow(
                      label: Intls.to.email,
                      child: Text(
                        storeMember.user.email,
                        style: theme.textTheme.small,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),

                    // Phone
                    _InfoRow(
                      label: Intls.to.phone,
                      child: Text(
                        storeMember.user.phoneNumber.isNotEmpty
                            ? storeMember.user.phoneNumber
                            : 'N/A',
                        style: theme.textTheme.small,
                      ),
                    ),

                    // Permissions count
                    _InfoRow(
                      label: Intls.to.permissions,
                      expandedChild: false,
                      child: _PermissionsBadge(
                        storeMember: storeMember.storeMember,
                      ),
                    ),

                    // Joined date
                    _InfoRow(
                      label: Intls.to.joined,
                      child: Text(
                        Formatters.formatDate(
                          storeMember.storeMember.memberSince.toDateTime(),
                        ),
                        style: theme.textTheme.small,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// User header with avatar and name
class _UserHeader extends StatelessWidget {
  const _UserHeader({required this.storeMember});

  final ({StoreMember storeMember, User user}) storeMember;

  String _getInitials(User user) {
    final userName = user.hasUserName() ? user.userName : '';

    return userName.isNotEmpty ? userName.substring(0, 2).toUpperCase() : '';
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final user = storeMember.user;

    return Row(
      spacing: 12,
      children: [
        Container(
          width: 48,
          height: 48,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppUtils.stringToColor(_getInitials(user)),
          ),
          child: Center(
            child: Text(
              _getInitials(user),
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: SabitouColors.infoSoft,
              ),
            ),
          ),
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (user.hasUserName())
                Text(
                  user.userName,
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              const SizedBox(height: 2),
              Text(
                user.email,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

/// Info row widget for displaying label-value pairs
class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.child,
    this.expandedChild = true,
  });

  final String label;
  final Widget child;
  final bool expandedChild;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 90,
          child: Text(
            label,
            style: theme.textTheme.small.copyWith(
              color: theme.colorScheme.mutedForeground,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        expandedChild ? Expanded(child: child) : child,
      ],
    );
  }
}

/// Status badge widget
class _StatusBadge extends StatelessWidget {
  const _StatusBadge({required this.status});

  final StoreMemberStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        status.label.toUpperCase(),
        style: theme.textTheme.small.copyWith(
          color: status.color,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}

/// Permissions badge showing count
class _PermissionsBadge extends StatelessWidget {
  const _PermissionsBadge({required this.storeMember});

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
    final theme = ShadTheme.of(context);
    final count = _getActivePermissionsCount(storeMember.permissions);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        '$count ${Intls.to.permissions}',
        style: theme.textTheme.small.copyWith(
          color: theme.colorScheme.primary,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}
