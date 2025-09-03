import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/input/form_fields.dart';
import '../login_controller.dart';

/// Login form.
class LoginForm extends StatelessWidget {
  /// Constructs login form.
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final appIntl = AppInternationalizationService.to;

    return Column(
      children: [
        Obx(
          () => InputField(
            controller: controller.emailController,
            placeholder: appIntl.email,
            icon: LucideIcons.mail400,
            error: controller.emailError.value,
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
      ],
    );
  }
}
