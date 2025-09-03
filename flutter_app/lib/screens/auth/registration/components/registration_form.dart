import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/input/form_fields.dart';
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
          () => InputField(
            controller: controller.userNameController,
            placeholder: appIntl.userName,
            icon: LucideIcons.user400,
            error: controller.userNameError.value,
          ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => InputField(
            controller: controller.firstNameController,
            placeholder: appIntl.firstName,
            icon: LucideIcons.user400,
            error: controller.firstNameError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => InputField(
            controller: controller.lastNameController,
            placeholder: appIntl.lastName,
            icon: LucideIcons.user400,
            error: controller.lastNameError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => InputField(
            controller: controller.emailController,
            placeholder: appIntl.email,
            icon: LucideIcons.mail400,
            error: controller.emailError.value,
            keyboardType: TextInputType.emailAddress,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => InputField(
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
          () => PasswordField(
            controller: controller.passwordController,
            placeholder: appIntl.password,
            isVisible: controller.isPasswordVisible.value,
            onToggle: controller.togglePasswordVisibility,
            error: controller.passwordError.value,
          ),
        ),
        const SizedBox(height: 16),

        Obx(
          () => PasswordField(
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
