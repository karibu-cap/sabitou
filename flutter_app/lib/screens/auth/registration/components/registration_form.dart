import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../registration_controller.dart';

/// Registration form component that handles user registration inputs.
///
/// This widget contains all form fields needed for user registration
/// including name, email, phone, and password fields.
/// It uses reactive error handling with GetX and follows the app's theme.
class RegistrationForm extends StatelessWidget {
  /// Creates a [RegistrationForm] widget.
  ///
  /// The [key] parameter is passed to the parent [StatelessWidget].
  const RegistrationForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<RegistrationController>();
    final appIntl = AppInternationalizationService.to;

    return Column(
      children: [
        Obx(
          () => _InputField(
            controller: controller.userNameController,
            placeholder: appIntl.userName,
            icon: LucideIcons.user400,
            error: controller.userNameError.value,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => _InputField(
            controller: controller.firstNameController,
            placeholder: appIntl.firstName,
            icon: LucideIcons.user400,
            error: controller.firstNameError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => _InputField(
            controller: controller.lastNameController,
            placeholder: appIntl.lastName,
            icon: LucideIcons.user400,
            error: controller.lastNameError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => _InputField(
            controller: controller.emailController,
            placeholder: appIntl.email,
            icon: LucideIcons.mail400,
            error: controller.emailError.value,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => _InputField(
            controller: controller.phoneNumberController,
            placeholder: appIntl.phoneNumber,
            icon: LucideIcons.phone400,
            error: controller.phoneNumberError.value,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => _PasswordField(
            controller: controller.passwordController,
            placeholder: appIntl.password,
            isVisible: controller.isPasswordVisible.value,
            onToggle: controller.togglePasswordVisibility,
            error: controller.passwordError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => _PasswordField(
            controller: controller.confirmPasswordController,
            placeholder: appIntl.confirmPassword,
            isVisible: controller.isConfirmPasswordVisible.value,
            onToggle: controller.toggleConfirmPasswordVisibility,
            error: controller.confirmPasswordError.value,
          ),
        ),
      ],
    );
  }
}

class _InputField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final IconData icon;
  final String? error;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const _InputField({
    required this.controller,
    required this.placeholder,
    required this.icon,
    this.error,
    this.keyboardType,
    this.inputFormatters,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadInputFormField(
          controller: controller,
          placeholder: Text(placeholder),
          trailing: Icon(icon),
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
        ),
        if (error?.isNotEmpty ?? false) _ErrorText(error: error),
      ],
    );
  }
}

class _PasswordField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool isVisible;
  final VoidCallback onToggle;
  final String? error;

  const _PasswordField({
    required this.controller,
    required this.placeholder,
    required this.isVisible,
    required this.onToggle,
    required this.error,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShadInputFormField(
          controller: controller,
          placeholder: Text(placeholder),
          obscureText: !isVisible,
          trailing: GestureDetector(
            onTap: onToggle,
            child: Icon(isVisible ? LucideIcons.eye400 : LucideIcons.eyeOff400),
          ),
        ),
        if (error?.isNotEmpty ?? false) _ErrorText(error: error),
      ],
    );
  }
}

class _ErrorText extends StatelessWidget {
  /// Constructs a [_ErrorText] widget
  const _ErrorText({required this.error});

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Builder(
          builder: (context) {
            final theme = ShadTheme.of(context);

            return Text(
              error ?? '',
              style: theme.textTheme.p.copyWith(
                color: theme.colorScheme.destructive,
                fontSize: 12,
              ),
            );
          },
        ),
      ),
    );
  }
}
