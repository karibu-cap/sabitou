import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/button_state.dart';
import '../../../../utils/common_functions.dart';
import '../login_controller.dart';

/// Custom login button widget with loading state
class LoginButton extends StatelessWidget {
  /// Constructs a [LoginButton] widget
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    final appIntl = AppInternationalizationService.to;

    Future<void> onLoginPressed(LoginController controller) async {
      controller.buttonState.value = ButtonState.loading;
      final validation = controller.validateForm();
      if (!validation) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }

      final loginResult = await controller.loginUser();
      if (!loginResult) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }
      if (!context.mounted) {
        return;
      }
      if (loginResult) {
        showSuccessToast(
          context: context,
          title: appIntl.success,
          message: appIntl.loginSuccess,
        );
        controller.buttonState.value = ButtonState.initial;
        app_router.pushReplacement(context, app_router.businessListRoutePath);
      } else {
        showErrorToast(
          context: context,
          title: appIntl.failed,
          message: appIntl.loginFailed,
        );
      }
      controller.buttonState.value = ButtonState.initial;
    }

    return ListenableBuilder(
      listenable: controller.buttonState,
      builder: (context, child) => ShadButton(
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
