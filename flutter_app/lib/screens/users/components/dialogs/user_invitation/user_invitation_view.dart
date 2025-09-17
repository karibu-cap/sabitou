import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/form/validation.dart';
import '../../../../../widgets/input/form_fields.dart';
import '../../../users_controller.dart';
import '../../shared/permissions_selector.dart';
import 'user_invitation_controller.dart';

/// Modal dialog for inviting new users to the business
class UserInvitationModal extends StatelessWidget {
  /// UsersController instance.
  final UsersController usersController;

  /// UserInvitationModal constructor.
  const UserInvitationModal({super.key, required this.usersController});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          UserInvitationModalController(usersController: usersController),
      child: const _UserInvitationModalContent(),
    );
  }
}

/// Content widget for the user invitation modal
class _UserInvitationModalContent extends StatelessWidget {
  /// _UserInvitationModalContent constructor.
  const _UserInvitationModalContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInvitationModalController>(
      builder: (context, controller, _) {
        final theme = ShadTheme.of(context);

        return Material(
          color: theme.colorScheme.background,
          child: Container(
            width: 600,
            constraints: const BoxConstraints(maxHeight: 600),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
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
                      child: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppInternationalizationService.to.inviteUser,
                            style: theme.textTheme.h4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            AppInternationalizationService
                                .to
                                .inviteNewTeamMember,
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

                // Form section
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // User info form
                        _UserInfoForm(controller: controller),

                        const SizedBox(height: 8),

                        // Permissions section
                        _PermissionsSection(controller: controller),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

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

/// User information form section
class _UserInfoForm extends StatelessWidget {
  final UserInvitationModalController controller;

  const _UserInfoForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.blue.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person_outline, color: Colors.blue, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.userInformation,
                style: theme.textTheme.p.copyWith(
                  color: Colors.blue.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          // const SizedBox(height: 8),
          ShadForm(
            key: controller.formKey,
            child: InputField(
              id: appIntl.email,
              label: appIntl.email,
              controller: controller.emailController,
              placeholder: appIntl.email,
              icon: LucideIcons.mail400,
              validator: ValidationFormUtils.validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
        ],
      ),
    );
  }
}

/// Permissions selection section
class _PermissionsSection extends StatelessWidget {
  final UserInvitationModalController controller;

  const _PermissionsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.green.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
            AppInternationalizationService.to.choosePermissionsForUser,
            style: theme.textTheme.p.copyWith(
              color: Colors.green.withValues(alpha: 0.6),
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),

          // Permissions list
          _PermissionsList(controller: controller),
        ],
      ),
    );
  }
}

/// Permissions list widget
class _PermissionsList extends StatelessWidget {
  final UserInvitationModalController controller;

  const _PermissionsList({required this.controller});

  @override
  Widget build(BuildContext context) {
    return PermissionsSelector(
      isPermissionSelected: controller.isPermissionSelected,
      onTogglePermission: controller.togglePermission,
      maxHeight: 450,
    );
  }
}

/// Action buttons section
class _ActionButtons extends StatelessWidget {
  final UserInvitationModalController controller;

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
          enabled: controller.canSubmit && !controller.isLoading,
          onPressed: controller.canSubmit
              ? () async {
                  final success = await controller.sendInvitation();
                  if (success && context.mounted) {
                    showSuccessToast(
                      context: context,
                      message: AppInternationalizationService
                          .to
                          .invitationSentSuccessfully,
                    );
                    Navigator.of(context).pop(true);
                  }
                }
              : null,
          child: Text(AppInternationalizationService.to.sendInvitation),
        ),
      ],
    );
  }
}
