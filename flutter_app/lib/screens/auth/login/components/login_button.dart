import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/button_state.dart';
import '../login_controller.dart';

/// Custom login button widget with loading state
class LoginButton extends StatelessWidget {
  /// Constructs a [LoginButton] widget
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LoginController.instance;
    final appIntl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    Future<void> onLoginPressed(LoginController controller) async {
      controller.buttonState.value = ButtonState.loading;
      final loginResult = await controller.loginUser();
      if (!loginResult) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }
      if (!context.mounted) {
        return;
      }
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
        controller.buttonState.value = ButtonState.initial;
        app_router.pushReplacement(context, app_router.businessListRoutePath);
      }
      controller.buttonState.value = ButtonState.initial;
    }

    return Obx(
      () => ShadButton(
        onPressed: () => onLoginPressed(controller),
        width: double.infinity,
        trailing: controller.buttonState.value == ButtonState.loading
            ? SizedBox.square(
                dimension: 16,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: ShadTheme.of(context).colorScheme.primaryForeground,
                ),
              )
            : null,
        enabled: controller.buttonState.value != ButtonState.loading,
        child: Text(appIntl.signIn),
      ),
    );
  }
}
