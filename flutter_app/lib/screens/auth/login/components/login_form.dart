import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
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
        // Email Field
        ShadInputFormField(
          controller: controller.emailController,
          placeholder: Text(appIntl.email),
          keyboardType: TextInputType.emailAddress,
          trailing: const Icon(LucideIcons.mail400),
        ),
        Obx(
          () => controller.emailError.value.isNotEmpty
              ? ErrorText(error: controller.emailError.value)
              : const SizedBox.shrink(),
        ),
        const SizedBox(height: 16),

        // Password Field
        Obx(
          () => ShadInputFormField(
            controller: controller.passwordController,
            placeholder: Text(appIntl.password),
            obscureText: !controller.isPasswordVisible.value,
            trailing: GestureDetector(
              onTap: controller.togglePasswordVisibility,
              child: Icon(
                controller.isPasswordVisible.value
                    ? LucideIcons.eye400
                    : LucideIcons.eyeOff400,
              ),
            ),
          ),
        ),
        Obx(
          () => controller.passwordError.value.isNotEmpty
              ? ErrorText(error: controller.passwordError.value)
              : const SizedBox.shrink(),
        ),
      ],
    );
  }
}

/// Error text.
class ErrorText extends StatelessWidget {
  /// Constructs error text.
  const ErrorText({super.key, required this.error});

  /// Error message.
  final String error;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 4, left: 4),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          error,
          style: theme.textTheme.p.copyWith(
            color: theme.colorScheme.destructive,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
