import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/common_functions.dart';
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
            width: 600,
            constraints: const BoxConstraints(maxHeight: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: Icon(
                        Icons.security,
                        color: theme.colorScheme.secondary,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppInternationalizationService.to.userPermissions,
                            style: theme.textTheme.h4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            '${controller.originalStoreMember.user.firstName} ${controller.originalStoreMember.user.lastName}',
                            style: theme.textTheme.muted.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 8),
                // Error message
                if (controller.errorMessage.isNotEmpty)
                  Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.red.withValues(alpha: 0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      border: Border.all(
                        color: Colors.red.withValues(alpha: 0.3),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            controller.errorMessage,
                            style: theme.textTheme.p.copyWith(
                              color: Colors.red.withValues(alpha: 0.7),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: controller.clearError,
                          icon: const Icon(LucideIcons.x, size: 16),
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 8),
                // User info section
                _StatusChangeSection(controller: controller),

                const SizedBox(height: 8),

                // Permissions section
                Expanded(child: _PermissionsSection(controller: controller)),

                const SizedBox(height: 8),

                // Action buttons
                _ActionButtons(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}

/// Status change section widget
class _StatusChangeSection extends StatelessWidget {
  final UserPermissionsModalController controller;

  const _StatusChangeSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final currentStatus = controller.originalStoreMember.status;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.orange, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.memberStatus,
                style: theme.textTheme.p.copyWith(
                  color: Colors.orange.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<StoreMemberStatus>(
            value: currentStatus,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(color: Colors.grey.shade300),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 4,
              ),
            ),
            items: [
              DropdownMenuItem(
                value: StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE,
                child: Row(
                  children: [
                    const Icon(
                      LucideIcons.userCheck,
                      size: 16,
                      color: Colors.green,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppInternationalizationService.to.active,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.muted.color,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE,
                child: Row(
                  children: [
                    const Icon(
                      LucideIcons.pause400,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppInternationalizationService.to.inactive,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.muted.color,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              DropdownMenuItem(
                value: StoreMemberStatus.STORE_MEMBER_STATUS_BANNED,
                child: Row(
                  children: [
                    const Icon(LucideIcons.userX, size: 16, color: Colors.red),
                    const SizedBox(width: 8),
                    Text(
                      AppInternationalizationService.to.banned,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.muted.color,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
            onChanged: controller.isLoading
                ? null
                : (newStatus) {
                    if (newStatus != null && newStatus != currentStatus) {
                      controller.changeUserStatus(newStatus);
                    }
                  },
            dropdownColor: theme.colorScheme.background,
          ),
        ],
      ),
    );
  }
}

/// Permissions selection section
class _PermissionsSection extends StatelessWidget {
  final UserPermissionsModalController controller;

  const _PermissionsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Icon(Icons.security, color: Colors.green, size: 16),
              const SizedBox(width: 8),
              Text(
                '${AppInternationalizationService.to.permissions} (${controller.selectedPermissionsCount} ${AppInternationalizationService.to.selected})',
                style: theme.textTheme.p.copyWith(
                  color: Colors.green.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppInternationalizationService.to.selectWhatUserCanAccess,
            style: theme.textTheme.p.copyWith(
              color: Colors.green.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),

          // Permissions list
          Flexible(
            child: PermissionsSelector(
              isPermissionSelected: controller.isPermissionSelected,
              onTogglePermission: controller.togglePermission,
              maxHeight: 400,
            ),
          ),
        ],
      ),
    );
  }
}

/// Action buttons widget
class _ActionButtons extends StatelessWidget {
  final UserPermissionsModalController controller;

  const _ActionButtons({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(AppInternationalizationService.to.cancel),
        ),
        const SizedBox(width: 12),
        ShadButton(
          trailing: controller.isLoading
              ? SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: theme.colorScheme.secondary,
                    strokeWidth: 2,
                  ),
                )
              : null,
          enabled: controller.hasChanges && !controller.isLoading,
          onPressed: () async {
            final success = await controller.savePermissions();
            if (success && context.mounted) {
              Navigator.of(context).pop();
              showSuccessToast(
                context: context,
                message: AppInternationalizationService
                    .to
                    .permissionsUpdatedSuccessfully,
              );
            }
          },
          child: Text(
            AppInternationalizationService.to.save,
            style: TextStyle(color: theme.colorScheme.secondary),
          ),
        ),
      ],
    );
  }
}
