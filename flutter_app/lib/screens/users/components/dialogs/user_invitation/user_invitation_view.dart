import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/form/validation.dart';
import '../../../../../widgets/input/form_fields.dart';
import '../../../../../widgets/loading.dart';
import '../../../users_controller.dart';
import '../../shared/permissions_selector.dart';
import 'user_invitation_controller.dart';

/// Modal dialog for creating or inviting new users to the store.
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
        final appIntl = AppInternationalizationService.to;

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
                        Icons.person_add,
                        size: 20,
                        color: theme.colorScheme.primaryForeground,
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            appIntl.inviteUser,
                            style: theme.textTheme.h4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            appIntl.inviteNewTeamMember,
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

                if (controller.errorMessage.isNotEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: theme.colorScheme.destructive.withValues(
                        alpha: 0.1,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(AppTheme.radiusSm),
                      ),
                      border: Border.all(
                        color: theme.colorScheme.destructive.withValues(
                          alpha: 0.3,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.circleAlert,
                          color: theme.colorScheme.destructive,
                          size: 16,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            controller.errorMessage,
                            style: theme.textTheme.p.copyWith(
                              color: theme.colorScheme.destructive,
                              fontSize: 14,
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
                  ),

                if (controller.errorMessage.isNotEmpty)
                  const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _OnboardingTypeSelector(controller: controller),

                        const SizedBox(height: 8),

                        _UserInfoForm(controller: controller),

                        const SizedBox(height: 8),
                        _PermissionsSection(controller: controller),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                _ActionButtons(controller: controller),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _OnboardingTypeSelector extends StatelessWidget {
  final UserInvitationModalController controller;

  const _OnboardingTypeSelector({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    return ShadCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.userCog,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                appIntl.onboardingType,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: _OnboardingTypeCard(
                  controller: controller,
                  type: OnboardingType.direct,
                  icon: LucideIcons.userCheck,
                  label: appIntl.onboardingTypeDirect,
                  description: appIntl.onboardingTypeDirectDescription,
                ),
              ),
              // const SizedBox(width: 8),
              // Expanded(
              //   child: _OnboardingTypeCard(
              //     controller: controller,
              //     type: OnboardingType.invite,
              //     icon: LucideIcons.mailPlus,
              //     label: appIntl.onboardingTypeInvite,
              //     description: appIntl.onboardingTypeInviteDescription,
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}

class _OnboardingTypeCard extends StatelessWidget {
  final UserInvitationModalController controller;
  final OnboardingType type;
  final IconData icon;
  final String label;
  final String description;

  const _OnboardingTypeCard({
    required this.controller,
    required this.type,
    required this.icon,
    required this.label,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isSelected = controller.onboardingType == type;

    return GestureDetector(
      onTap: () => controller.selectOnboardingType(type),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withValues(alpha: 0.08)
              : theme.colorScheme.card,
          border: Border.all(
            color: isSelected
                ? theme.colorScheme.primary
                : theme.colorScheme.border,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(AppTheme.radiusSm),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.mutedForeground,
              size: 18,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? theme.colorScheme.primary
                          : theme.colorScheme.foreground,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    description,
                    style: theme.textTheme.muted.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UserInfoForm extends StatelessWidget {
  final UserInvitationModalController controller;

  const _UserInfoForm({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    return ShadCard(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                LucideIcons.user,
                color: theme.colorScheme.primary,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                appIntl.userInformation,
                style: theme.textTheme.p.copyWith(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          ShadForm(
            key: controller.formKey,
            child: Column(
              spacing: 12,
              children: [
                // Email — always shown
                InputField(
                  id: appIntl.email,
                  label: appIntl.email,
                  controller: controller.emailController,
                  placeholder: appIntl.email,
                  icon: LucideIcons.mail400,
                  validator: ValidationFormUtils.validateEmail,
                  keyboardType: TextInputType.emailAddress,
                ),

                // Direct-only fields
                if (controller.isDirect) ...[
                  InputField(
                    id: appIntl.userName,
                    label: appIntl.userName,
                    controller: controller.userNameController,
                    placeholder: appIntl.userName,
                    icon: LucideIcons.atSign,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? appIntl.userNameRequired
                        : null,
                  ),
                  InputField(
                    id: appIntl.temporaryPassword,
                    label: appIntl.temporaryPassword,
                    controller: controller.temporaryPasswordController,
                    placeholder: appIntl.temporaryPassword,
                    icon: LucideIcons.keyRound,
                    validator: (v) {
                      if (v == null || v.isEmpty) {
                        return appIntl.passwordRequired;
                      }
                      if (v.length < 8) return appIntl.passwordLength;

                      return null;
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ForcePasswordChangeToggle extends StatelessWidget {
  final UserInvitationModalController controller;

  const _ForcePasswordChangeToggle({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: GestureDetector(
        onTap: controller.toggleForcePasswordChange,
        child: Row(
          children: [
            ShadCheckbox(
              value: controller.forcePasswordChange,
              onChanged: (_) => controller.toggleForcePasswordChange(),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                appIntl.forcePasswordChangeOnFirstLogin,
                style: theme.textTheme.p.copyWith(fontSize: 13),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionsSection extends StatelessWidget {
  final UserInvitationModalController controller;

  const _PermissionsSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.shield,
                color: SabitouColors.infoText,
                size: 16,
              ),
              const SizedBox(width: 8),
              Text(
                '${AppInternationalizationService.to.permissions} (${controller.selectedPermissionsCount} ${AppInternationalizationService.to.selected})',
                style: theme.textTheme.p.copyWith(
                  color: SabitouColors.infoText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            AppInternationalizationService.to.choosePermissionsForUser,
            style: theme.textTheme.p.copyWith(
              color: theme.colorScheme.mutedForeground,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          PermissionsSelector(
            isPermissionSelected: controller.isPermissionSelected,
            onTogglePermission: controller.togglePermission,
            isGroupSelected: controller.isGroupSelected,
            onToggleGroup: controller.toggleGroup,
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Action buttons
// ─────────────────────────────────────────────────────────────────────────────

class _ActionButtons extends StatelessWidget {
  final UserInvitationModalController controller;

  const _ActionButtons({required this.controller});

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;

    final submitLabel = controller.isDirect
        ? appIntl.createUser
        : appIntl.sendInvitation;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: controller.isLoading
              ? null
              : () => Navigator.of(context).pop(),
          child: Text(appIntl.cancel),
        ),
        const SizedBox(width: 12),
        ShadButton(
          trailing: controller.isLoading ? const Loading.button() : null,
          enabled: controller.canSubmit && !controller.isLoading,
          onPressed: controller.canSubmit
              ? () async {
                  final success = await controller.submit();
                  if (success && context.mounted) {
                    showSuccessToast(
                      context: context,
                      message: controller.isDirect
                          ? appIntl.userCreatedSuccessfully
                          : appIntl.invitationSentSuccessfully,
                    );
                    Navigator.of(context).pop(true);
                  }
                }
              : null,
          child: Text(submitLabel),
        ),
      ],
    );
  }
}
