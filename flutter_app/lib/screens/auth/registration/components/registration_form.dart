import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/form/validation.dart';
import '../../../../widgets/custom_grid.dart';
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
    final controller = context.read<RegistrationController>();
    final appIntl = AppInternationalizationService.to;

    return ShadForm(
      key: controller.formKey,
      child: Column(
        spacing: 16,
        children: [
          InputField(
            id: appIntl.userName,
            label: appIntl.userName,
            controller: controller.userNameController,
            placeholder: appIntl.userName,
            icon: LucideIcons.user400,
            validator: ValidationFormUtils.validateUserName,
          ),
          CustomGrid(
            minItemWidth: 200,
            mainAxisSpacing: 16,
            mainAxisExtent: 80,
            children: [
              InputField(
                id: appIntl.firstName,
                label: appIntl.firstName,
                controller: controller.firstNameController,
                placeholder: appIntl.firstName,
                icon: LucideIcons.user400,
                validator: ValidationFormUtils.validateFirstName,
              ),
              InputField(
                id: appIntl.lastName,
                label: appIntl.lastName,
                controller: controller.lastNameController,
                placeholder: appIntl.lastName,
                icon: LucideIcons.user400,
                validator: ValidationFormUtils.validateLastName,
              ),
              InputField(
                id: appIntl.email,
                label: appIntl.email,
                controller: controller.emailController,
                placeholder: appIntl.email,
                icon: LucideIcons.mail400,
                validator: ValidationFormUtils.validateEmail,
                keyboardType: TextInputType.emailAddress,
              ),
              InputField(
                id: appIntl.phoneNumber,
                label: appIntl.phoneNumber,
                controller: controller.phoneNumberController,
                placeholder: appIntl.phoneNumber,
                icon: LucideIcons.phone400,
                validator: ValidationFormUtils.validatePhoneNumber,
                keyboardType: TextInputType.phone,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
              PasswordField(
                id: appIntl.password,
                label: appIntl.password,
                controller: controller.passwordController,
                placeholder: appIntl.password,
                isVisible: controller.isPasswordVisible,
                onToggle: controller.togglePasswordVisibility,
                validator: ValidationFormUtils.validatePassword,
              ),
              PasswordField(
                id: appIntl.confirmPassword,
                label: appIntl.confirmPassword,
                controller: controller.confirmPasswordController,
                placeholder: appIntl.confirmPassword,
                isVisible: controller.isConfirmPasswordVisible,
                onToggle: controller.toggleConfirmPasswordVisibility,
                validator: (value) =>
                    ValidationFormUtils.validateConfirmPassword(
                      value,
                      controller.passwordController.text,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
