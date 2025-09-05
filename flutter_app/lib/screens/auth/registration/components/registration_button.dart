import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/button_state.dart';
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
      if (!context.mounted) {
        return;
      }
      controller.buttonState.value = ButtonState.loading;
      final registrationResult = await controller.registerUser();
      if (!registrationResult) {
        controller.buttonState.value = ButtonState.initial;

        return;
      }
      final theme = ShadTheme.of(context);
      final toast = ShadToast(
        title: Text(registrationResult ? appIntl.success : appIntl.failed),
        description: Text(
          registrationResult
              ? appIntl.registrationSuccess
              : appIntl.registrationFailed,
        ),
        border: Border.all(
          color: registrationResult
              ? theme.colorScheme.primary
              : theme.colorScheme.destructive,
          width: 2,
        ),
        backgroundColor: theme.colorScheme.background,
      );
      ShadToaster.of(context).show(toast);
      if (registrationResult) {
        controller.buttonState.value = ButtonState.initial;
        app_router.pushReplacement(context, app_router.businessListRoutePath);
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
