import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/common_functions.dart';
import '../../../users_controller.dart';
import 'user_deletion_controller.dart';

/// Modal dialog for confirming user deletion from the business
class UserDeletionModal extends StatelessWidget {
  /// The users controller.
  final UsersController usersController;

  /// The store member.
  final StoreMember storeMember;

  /// Construts a new UserDeletionModal.
  const UserDeletionModal({
    super.key,
    required this.usersController,
    required this.storeMember,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserDeletionModalController(
        usersController: usersController,
        storeMember: storeMember,
      ),
      child: const _UserDeletionModalContent(),
    );
  }
}

/// Content widget for the user deletion modal
class _UserDeletionModalContent extends StatelessWidget {
  const _UserDeletionModalContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserDeletionModalController>(
      builder: (context, controller, _) {
        final theme = ShadTheme.of(context);

        return Material(
          color: theme.colorScheme.background,
          child: Container(
            width: 500,
            constraints: const BoxConstraints(maxHeight: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.warning,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppInternationalizationService.to.deleteUser,
                              style: theme.textTheme.h3.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              AppInternationalizationService
                                  .to
                                  .thisActionIsIrreversible,
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

                  const SizedBox(height: 8),

                  // Error message
                  if (controller.errorMessage.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
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
                                color: Colors.red,
                                fontSize: 14,
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

                  if (controller.errorMessage.isNotEmpty)
                    const SizedBox(height: 8),

                  // User info section
                  _UserInfoSection(controller: controller),

                  const SizedBox(height: 8),

                  // Warning section
                  _WarningSection(),

                  const SizedBox(height: 8),

                  // Confirmation section
                  _ConfirmationSection(controller: controller),

                  const SizedBox(height: 8),

                  // Action buttons
                  _ActionButtons(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// User information section
class _UserInfoSection extends StatelessWidget {
  final UserDeletionModalController controller;

  const _UserInfoSection({required this.controller});

  IconData _getStatusIcon(StoreMemberStatus status) {
    switch (status) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return LucideIcons.userCheck;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return LucideIcons.clock;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return LucideIcons.pause400;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return LucideIcons.userX;
      default:
        return LucideIcons.triangleAlert;
    }
  }

  Color _getStatusColor(StoreMemberStatus status) {
    switch (status) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return Colors.green;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return Colors.orange;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return Colors.grey;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusLabel(StoreMemberStatus status) {
    switch (status) {
      case StoreMemberStatus.STORE_MEMBER_STATUS_ACTIVE:
        return AppInternationalizationService.to.active;
      case StoreMemberStatus.STORE_MEMBER_STATUS_PENDING:
        return AppInternationalizationService.to.pending;
      case StoreMemberStatus.STORE_MEMBER_STATUS_INACTIVE:
        return AppInternationalizationService.to.inactive;
      case StoreMemberStatus.STORE_MEMBER_STATUS_BANNED:
        return AppInternationalizationService.to.cancelled;
      default:
        return AppInternationalizationService.to.inactive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final storeMember = controller.storeMember;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.grey, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.deleteUser,
                style: theme.textTheme.p.copyWith(
                  color: Colors.grey.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              // Avatar placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
                child: Icon(
                  Icons.person,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // User details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${storeMember.user.firstName} ${storeMember.user.lastName}',
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      storeMember.user.email,
                      style: theme.textTheme.p.copyWith(
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          _getStatusIcon(storeMember.status),
                          size: 12,
                          color: _getStatusColor(storeMember.status),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getStatusLabel(storeMember.status),
                          style: theme.textTheme.small.copyWith(
                            color: _getStatusColor(storeMember.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Warning section
class _WarningSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber, color: Colors.red, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.confirmationRequired,
                style: theme.textTheme.p.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            AppInternationalizationService.to.userWillBeRemovedPermanently,
            style: theme.textTheme.p.copyWith(
              color: Colors.red.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}

/// Confirmation section
class _ConfirmationSection extends StatelessWidget {
  final UserDeletionModalController controller;

  const _ConfirmationSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
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
              const Icon(Icons.edit_outlined, color: Colors.orange, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.confirmationRequired,
                style: theme.textTheme.p.copyWith(
                  color: Colors.orange.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            AppInternationalizationService.to.typeToConfirmDeletion.replaceAll(
              '{text}',
              controller.expectedConfirmationText,
            ),
            style: theme.textTheme.p.copyWith(
              color: Colors.orange.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),

          TextFormField(
            decoration: InputDecoration(
              hintText: controller.expectedConfirmationText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: controller.isConfirmationValid
                      ? Colors.green
                      : Colors.orange,
                  width: 2,
                ),
              ),
              suffixIcon: controller.isConfirmationValid
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
            ),
            onChanged: controller.updateConfirmationText,
            enabled: !controller.isLoading,
          ),
        ],
      ),
    );
  }
}

/// Action buttons section
class _ActionButtons extends StatelessWidget {
  final UserDeletionModalController controller;

  const _ActionButtons({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: controller.isLoading
              ? null
              : () => Navigator.of(context).pop(),
          child: Text(AppInternationalizationService.to.cancel),
        ),
        const SizedBox(width: 12),
        ShadButton(
          trailing: controller.isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : null,

          enabled: controller.canDelete && !controller.isLoading,
          onPressed: () async {
            final success = await controller.deleteUser();
            if (success && context.mounted) {
              showSuccessToast(
                context: context,
                message:
                    AppInternationalizationService.to.userDeletedSuccessfully,
              );
              Navigator.of(context).pop(true);
            }
          },
          backgroundColor: Colors.red,
          child: Text(
            AppInternationalizationService.to.deletePermanently,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
