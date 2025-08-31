import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../router/app_router.dart' as app_router;
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';

import 'login_controller.dart';
import 'login_view_model.dart';

/// Login view.
class LoginView extends StatelessWidget {
  /// Constructs login view.
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(LoginController(viewModel: LoginViewModel()), permanent: true);

    return const CommonScaffold(displayAppBar: false, child: LoginContent());
  }
}

/// Login content.
class LoginContent extends StatelessWidget {
  /// Constructs content view.
  const LoginContent({super.key});

  /// Handles login button pressed.
  Future<void> handleLoginPressed(BuildContext context) async {
    final controller = LoginController.instance;
    final validateResult = controller.validateAll();
    if (!validateResult) {
      return;
    }
    final loginResult = await controller.loginUser();
    final appIntl = AppInternationalizationService.to;
    if (context.mounted) {
      await showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(loginResult ? appIntl.success : appIntl.failed),
          content: Text(
            loginResult ? appIntl.loginSuccess : appIntl.loginFailed,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(ctx).pop(),
              child: Text(appIntl.ok),
            ),
          ],
        ),
      );
    }
  }

  /// Login button.
  Widget buildLoginButton(BuildContext context) {
    final auth = AuthProvider.instance;
    final appIntl = AppInternationalizationService.to;

    return ShadButton(
      onPressed: auth.status == AuthStatus.authenticating
          ? null
          : () => handleLoginPressed(context),
      width: double.infinity,
      child: auth.status == AuthStatus.authenticating
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(appIntl.signIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    final auth = AuthProvider.instance;
    final theme = ShadTheme.of(context);
    final appIntl = AppInternationalizationService.to;

    /// Navigate to forgot password.
    void navigateToForgotPassword(BuildContext context) {
      app_router.pushReplacement(context, app_router.forgotPasswordRoutePath);
    }

    /// Navigate to register screen.
    void navigateToRegisterScreen(BuildContext context) {
      app_router.pushReplacement(context, app_router.registrationRoutePath);
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF6366F1), Color(0xFF8B5CF6), Color(0xFFEC4899)],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Flex(
                  direction: Axis.horizontal,
                  children: [
                    if (ResponsiveUtils.isDesktop(context))
                      Expanded(child: Image.asset('assets/images/login.png')),
                    Expanded(
                      child: ShadCard(
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.all(32),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Logo/Icon.
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF6366F1),
                                      Color(0xFF8B5CF6),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                child: const Icon(
                                  LucideIcons.lockKeyhole400,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 24),

                              // Title.
                              Text(
                                appIntl.welcomeBack,
                                style: theme.textTheme.h4,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                appIntl.signInToYourAccount,
                                style: theme.textTheme.p,
                              ),
                              const SizedBox(height: 32),

                              // Email Field.
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ShadInputFormField(
                                    controller: controller.emailController,
                                    placeholder: Text(appIntl.email),
                                    keyboardType: TextInputType.emailAddress,
                                    trailing: const Icon(LucideIcons.mail400),
                                    onChanged: (value) =>
                                        controller.clearEmailForm(),
                                  ),
                                  // Email error message.
                                  Obx(
                                    () => controller.emailError.value.isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              left: 4.0,
                                            ),
                                            child: Text(
                                              controller.emailError.value,
                                              style: TextStyle(
                                                color: theme
                                                    .colorScheme
                                                    .destructive,
                                                fontSize: 12,
                                              ),
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 16),

                              // Password Field.
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Obx(
                                    () => ShadInputFormField(
                                      controller: controller.passwordController,
                                      placeholder: Text(appIntl.password),
                                      obscureText: !controller.isPasswordVisible.value,
                                      trailing: GestureDetector(
                                        onTap: controller.togglePasswordVisibility,
                                        child: Icon(
                                          controller.isPasswordVisible.value
                                              ? Icons.visibility
                                              : Icons.visibility_off,
                                        ),
                                      ),
                                      onChanged: (value) =>
                                          controller.clearPasswordForm(),
                                    ),
                                  ),
                                  // Password error message.
                                  Obx(
                                    () =>
                                        controller
                                            .passwordError
                                            .value
                                            .isNotEmpty
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                              top: 8.0,
                                              left: 4.0,
                                            ),
                                            child: Builder(
                                              builder: (context) {
                                                final theme = ShadTheme.of(
                                                  context,
                                                );

                                                return Text(
                                                  controller
                                                      .passwordError
                                                      .value,
                                                  style: theme.textTheme.p
                                                      .copyWith(
                                                        color: theme
                                                            .colorScheme
                                                            .destructive,
                                                        fontSize: 12,
                                                      ),
                                                );
                                              },
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 24),

                              // Error Message.
                              Obx(() {
                                final error = auth.errorMessage;

                                if (error?.isEmpty == true)
                                  return const SizedBox.shrink();

                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    error ?? '',
                                    style: const TextStyle(
                                      color: Colors.red,
                                      fontSize: 14,
                                    ),
                                  ),
                                );
                              }),

                              // Login Button.
                              Obx(() => buildLoginButton(context)),

                              const SizedBox(height: 16),

                              // Forgot Password.
                              TextButton(
                                onPressed: () =>
                                    navigateToForgotPassword(context),
                                child: Text(appIntl.forgotPassword),
                              ),

                              const SizedBox(height: 24),

                              // Sign Up Link.
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(appIntl.dontHaveAnAccount),
                                  TextButton(
                                    onPressed: () =>
                                        navigateToRegisterScreen(context),
                                    child: Text(appIntl.signUp),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );
  }
}

class _BuildErrorMessage extends StatelessWidget {
  const _BuildErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.instance;
    final theme = ShadTheme.of(context);

    final error = auth.errorMessageRx.value;

    return (error != null && error.isNotEmpty)
        ? ShadAlert.destructive(
            iconData: LucideIcons.circleAlert400,
            description: Text(
              error,
              style: TextStyle(color: theme.colorScheme.destructive),
            ),
          )
        : const SizedBox.shrink();
  }
}
