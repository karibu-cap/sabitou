import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/extensions/store_member_extenxion.dart';
import '../../../../../utils/user_preference.dart';
import '../../../../../utils/utils.dart';
import '../../../../../widgets/loading.dart';
import '../../../users_controller.dart';
import '../../shared/permissions_selector.dart';
import 'user_permissions_controller.dart';

/// Modal for viewing and modifying user permissions.
class UserPermissionsModal extends StatelessWidget {
  /// The store member whose permissions are being modified.
  final ({StoreMember storeMember, User user}) storeMember;

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
            constraints: const BoxConstraints(maxHeight: 600),
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
        color: theme.colorScheme.destructive.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppTheme.radiusSm),
        ),
        border: Border.all(
          color: theme.colorScheme.destructive.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        children: [
          Icon(
            LucideIcons.circleAlert,
            color: theme.colorScheme.destructive,
            size: 18,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              controller.errorMessage,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.destructive,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ShadButton.ghost(
            size: ShadButtonSize.sm,
            onPressed: controller.clearError,
            child: const Icon(LucideIcons.x, size: 16),
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

    final userTag = user.userName.substring(0, 2).toUpperCase();

    return ShadCard(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppUtils.stringToColor(userTag),
            ),
            child: Center(
              child: Text(
                userTag,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: SabitouColors.infoSoft,
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
                  user.userName,
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
          _CurrentStatusBadge(
            status: controller.originalStoreMember.storeMember.status,
          ),
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
        borderRadius: const BorderRadius.all(
          Radius.circular(AppTheme.radiusSm),
        ),
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

/// Status change section widget.
class _StatusChangeSection extends StatelessWidget {
  const _StatusChangeSection({required this.controller});

  final UserPermissionsModalController controller;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final currentStatus = controller.originalStoreMember.storeMember.status;
    final userPreferences = context.watch<UserPreferences>();
    final currentUserId = userPreferences.user?.refId;
    final isCurrentUser =
        currentUserId == controller.originalStoreMember.user.refId;

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.userCog,
                color: theme.colorScheme.primary,
                size: 18,
              ),
              const SizedBox(width: 10),
              Text(
                Intls.to.memberStatus,
                style: theme.textTheme.p.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ShadSelect<StoreMemberStatus>(
            initialValue: currentStatus,
            enabled: !isCurrentUser && !controller.isLoading,
            options:
                [
                  StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
                  StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
                  StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
                ].map((status) {
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
                }).toList(),
            selectedOptionBuilder: (context, value) => Text(value.label),
            onChanged: controller.isLoading || isCurrentUser
                ? null
                : (newStatus) {
                    if (newStatus != null && newStatus != currentStatus) {
                      controller.changeUserStatus(newStatus);
                    }
                  },
          ),
          if (isCurrentUser)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(
                Intls.to.cannotChangeOwnStatus,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                  fontSize: 12,
                ),
              ),
            ),
        ],
      ),
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

    return ShadCard(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.shield,
                size: 18,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  Intls.to.permissions,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              ShadBadge(
                backgroundColor: SabitouColors.infoText.withValues(alpha: 0.15),
                hoverBackgroundColor: SabitouColors.infoText.withValues(
                  alpha: 0.15,
                ),
                foregroundColor: SabitouColors.infoText,
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
          const SizedBox(height: 16),
          Divider(height: 1, thickness: 1, color: theme.colorScheme.border),
          const SizedBox(height: 16),
          Flexible(
            child: PermissionsSelector(
              isPermissionSelected: controller.isPermissionSelected,
              onTogglePermission: controller.togglePermission,
              isGroupSelected: controller.isGroupSelected,
              onToggleGroup: controller.toggleGroup,
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.only(top: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
                  const Loading.button()
                else
                  const Icon(LucideIcons.save, size: 16),
                const SizedBox(width: 8),
                Text(Intls.to.save),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
