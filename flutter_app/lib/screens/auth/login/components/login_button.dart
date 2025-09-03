import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../providers/auth/auth_provider.dart';
import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';
import '../login_controller.dart';

/// Custom login button widget with loading state
class LoginButton extends StatelessWidget {
  /// Constructs a [LoginButton] widget
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.instance;
    final appIntl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    Future<void> onLoginPressed(LoginController controller) async {
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

    return ShadButton(
      onPressed: auth.status == AuthStatus.authenticating
          ? null
          : () => onLoginPressed(LoginController.instance),
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
}
