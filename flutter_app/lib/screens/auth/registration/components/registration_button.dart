import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../router/app_router.dart';
import '../../../../router/page_routes.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/button_state.dart';
import '../../../../utils/common_functions.dart';
import '../registration_controller.dart';

/// Custom registration button widget with loading state
class RegistrationButton extends StatelessWidget {
  /// Constructs a [RegistrationButton] widget
  const RegistrationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;

    final controller = context.read<RegistrationController>();

    /// Helper method extracted for registration button callback.
    Future<void> onRegisterPressed(RegistrationController controller) async {
      controller.buttonState.value = ButtonState.loading;
      final validation = controller.validateForm();
      if (!validation) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }
      final registrationResult = await controller.registerUser();
      if (!registrationResult) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }
      if (!context.mounted) {
        return;
      }
      if (registrationResult) {
        showSuccessToast(
          context: context,
          title: appIntl.success,
          message: appIntl.registrationSuccess,
        );
        controller.buttonState.value = ButtonState.initial;
        AppRouter.pushReplacement(context, PagesRoutes.dashboard.create());
      } else {
        showErrorToast(
          context: context,
          title: appIntl.registrationFailed,
          message: appIntl.loginFailed,
        );
      }
      controller.buttonState.value = ButtonState.initial;
    }

    return ListenableBuilder(
      listenable: controller.buttonState,
      builder: (context, child) => ShadButton(
        onPressed: () => onRegisterPressed(controller),
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
        child: Text(appIntl.registrationSubmit),
      ),
    );
  }
}
