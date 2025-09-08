import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/form/validation.dart';
import '../../../../widgets/input/form_fields.dart';
import '../login_controller.dart';

/// Login form.
class LoginForm extends StatelessWidget {
  /// Constructs login form.
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    final appIntl = AppInternationalizationService.to;

    return ShadForm(
      key: controller.formKey,
      child: Column(
        spacing: 16,
        children: [
          InputField(
            id: appIntl.email,
            label: appIntl.email,
            controller: controller.emailController,
            placeholder: appIntl.enterValidEmail,
            keyboardType: TextInputType.emailAddress,
            icon: LucideIcons.mail400,
            validator: ValidationFormUtils.validateEmail,
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
        ],
      ),
    );
  }
}
