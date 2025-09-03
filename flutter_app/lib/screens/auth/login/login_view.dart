import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart' as app_router;
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_scaffold.dart';
import '../../../utils/responsive_utils.dart';
import 'components/auth_links.dart';
import 'components/login_button.dart';
import 'components/login_form.dart';
import 'components/login_logo.dart';
import 'login_controller.dart';
import 'login_view_model.dart';

/// Login view.
class LoginView extends StatelessWidget {
  /// Constructs login view.
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<LoginController>(
      LoginController(viewModel: LoginViewModel()),
      permanent: true,
    );

    return const CommonScaffold(displayAppBar: false, child: LoginContent());
  }
}

/// Login content.
class LoginContent extends StatelessWidget {
  /// Constructs content view.
  const LoginContent({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<LoginController>();
    final appIntl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    Future<void> onLoginPressed() async {
      final validateResult = controller.validateAll();
      if (!validateResult) return;

      final loginResult = await controller.loginUser();
      if (!context.mounted) return;

      final toast = ShadToast(
        title: Text(loginResult ? appIntl.success : appIntl.failed),
        description: Text(
          loginResult ? appIntl.loginSuccess : appIntl.loginFailed,
        ),
        border: Border.all(
          color: loginResult
              ? theme.colorScheme.primary
              : theme.colorScheme.destructive,
          width: 2,
        ),
        backgroundColor: theme.colorScheme.background,
      );

      ShadToaster.of(context).show(toast);
      if (loginResult) {
        app_router.pushReplacement(context, app_router.businessListRoutePath);
      }
    }

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF10B981), Color(0xFF059669), Color(0xFF047857)],
        ),
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Flex(
              direction: ResponsiveUtils.isDesktop(context)
                  ? Axis.horizontal
                  : Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (ResponsiveUtils.isDesktop(context))
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 32),
                      child: Image.asset(
                        'assets/images/login.png',
                        fit: BoxFit.contain,
                        height: 400,
                      ),
                    ),
                  ),
                Flexible(
                  child: ShadCard(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Logo/Icon
                          const LoginLogo(),

                          const SizedBox(height: 24),
                          Text(
                            appIntl.welcomeBack,
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            appIntl.signInToYourAccount,
                            style: theme.textTheme.p,
                          ),
                          const SizedBox(height: 32),

                          // Login Form
                          const LoginForm(),

                          const SizedBox(height: 24),

                          // Login Button
                          LoginButton(onPressed: onLoginPressed),

                          // Auth Links
                          const AuthLinks(),
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
