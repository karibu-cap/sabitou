import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../themes/app_colors.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/extensions/store_member_extenxion.dart';
import '../../../users_controller.dart';
import '../../shared/permissions_selector.dart';
import 'user_permissions_controller.dart';

/// Modal for viewing and modifying user permissions.
class UserPermissionsModal extends StatelessWidget {
  /// The store member whose permissions are being modified.
  final StoreMember storeMember;

  /// The users controller.
  final UsersController usersController;

  /// Constructs a new UserPermissionsModal.
  const UserPermissionsModal({
    super.key,
    required this.storeMember,
    required this.usersController,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserPermissionsModalController(
        usersController: usersController,
        storeMember: storeMember,
      ),
      child: const _UserPermissionsModalContent(),
    );
  }
}

/// Content widget for the user permissions modal.
class _UserPermissionsModalContent extends StatelessWidget {
  const _UserPermissionsModalContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserPermissionsModalController>(
      builder: (context, controller, child) {
        final theme = ShadTheme.of(context);

        return Material(
          color: theme.colorScheme.background,
          child: Container(
            constraints: const BoxConstraints(maxHeight: 700),
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      if (controller.errorMessage.isNotEmpty)
                        _ErrorMessage(controller: controller),
                      _UserInfoCard(controller: controller),
                      const SizedBox(height: 16),
                      _StatusChangeSection(controller: controller),
                      const SizedBox(height: 16),
                      _PermissionsSection(controller: controller),
                    ],
                  ),
                ),

                _ActionButtons(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Error message banner
class _ErrorMessage extends StatelessWidget {
  const _ErrorMessage({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.red.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.red.withValues(alpha: 0.3)),
      ),
      child: Row(
        children: [
          const Icon(LucideIcons.circleAlert, color: AppColors.red, size: 18),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              controller.errorMessage,
              style: theme.textTheme.small.copyWith(
                color: AppColors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          IconButton(
            onPressed: controller.clearError,
            icon: const Icon(LucideIcons.x, size: 16),
            style: IconButton.styleFrom(
              padding: const EdgeInsets.all(4),
              minimumSize: const Size(24, 24),
            ),
          ),
        ],
      ),
    );
  }
}

/// User info card
class _UserInfoCard extends StatelessWidget {
  const _UserInfoCard({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final user = controller.originalStoreMember.user;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.muted.withValues(alpha: 0.3),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
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
                controller.usersController.getInitials(user),
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.primary50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          // User details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.firstName} ${user.lastName}',
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 4),
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
                          color: theme.colorScheme.mutedForeground,
                          fontSize: 13,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // Current status badge
          _CurrentStatusBadge(status: controller.originalStoreMember.status),
        ],
      ),
    );
  }
}

/// Current status badge
class _CurrentStatusBadge extends StatelessWidget {
  const _CurrentStatusBadge({required this.status});

  final StoreMemberStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: status.color.withValues(alpha: 0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(status.icon, size: 14, color: status.color),
          const SizedBox(width: 6),
          Text(
            status.label,
            style: theme.textTheme.small.copyWith(
              color: status.color,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

/// Status change section widget
class _StatusChangeSection extends StatelessWidget {
  const _StatusChangeSection({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final currentStatus = controller.originalStoreMember.status;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(
              LucideIcons.userCog,
              color: AppColors.primary500,
              size: 18,
            ),
            const SizedBox(width: 10),
            Text(
              Intls.to.memberStatus,
              style: theme.textTheme.p.copyWith(
                color: AppColors.primary500,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: ShadSelect<StoreMemberStatus>(
                initialValue: currentStatus,
                options: StoreMemberStatus.values
                    .where(
                      (e) =>
                          e !=
                          StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED,
                    )
                    .map((status) {
                      return ShadOption(
                        value: status,
                        child: Row(
                          children: [
                            Icon(status.icon, size: 16, color: status.color),
                            const SizedBox(width: 10),
                            Text(
                              status.label,
                              style: theme.textTheme.small.copyWith(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),
                      );
                    })
                    .toList(),
                selectedOptionBuilder: (context, value) => Text(value.label),
                onChanged: controller.isLoading
                    ? null
                    : (newStatus) {
                        if (newStatus != null && newStatus != currentStatus) {
                          controller.changeUserStatus(newStatus);
                        }
                      },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Permissions selection section
class _PermissionsSection extends StatelessWidget {
  const _PermissionsSection({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(LucideIcons.shield, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(Intls.to.permissions, style: theme.textTheme.p),
                  ),
                  ShadBadge(
                    backgroundColor: AppColors.purple.withValues(alpha: 0.15),
                    hoverBackgroundColor: AppColors.purple.withValues(
                      alpha: 0.15,
                    ),
                    foregroundColor: AppColors.purple,
                    child: Text(
                      '${controller.selectedPermissionsCount} ${Intls.to.selected}',
                      style: theme.textTheme.small,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                Intls.to.selectWhatUserCanAccess,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),

        Divider(
          height: 1,
          thickness: 1,
          color: AppColors.purple.withValues(alpha: 0.1),
        ),

        Flexible(
          child: PermissionsSelector(
            isPermissionSelected: controller.isPermissionSelected,
            onTogglePermission: controller.togglePermission,
          ),
        ),
      ],
    );
  }
}

/// Action buttons widget
class _ActionButtons extends StatelessWidget {
  const _ActionButtons({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Spacer(),
          ShadButton.outline(
            onPressed: controller.isLoading
                ? null
                : () => Navigator.of(context).pop(),
            child: Text(Intls.to.cancel),
          ),
          const SizedBox(width: 12),
          ShadButton(
            enabled: controller.hasChanges && !controller.isLoading,
            onPressed: () async {
              final success = await controller.savePermissions();
              if (success && context.mounted) {
                Navigator.of(context).pop();
                showSuccessToast(
                  context: context,
                  message: Intls.to.permissionsUpdatedSuccessfully,
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (controller.isLoading)
                  const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(
                      color: AppColors.primary50,
                      strokeWidth: 2,
                    ),
                  )
                else
                  const Icon(
                    LucideIcons.save,
                    size: 16,
                    color: AppColors.primary50,
                  ),
                const SizedBox(width: 8),
                Text(
                  Intls.to.save,
                  style: const TextStyle(color: AppColors.primary50),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
