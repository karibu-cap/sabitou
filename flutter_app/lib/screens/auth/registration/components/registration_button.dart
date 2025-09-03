import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../providers/auth/auth_provider.dart';
import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';
import '../registration_controller.dart';

/// Custom registration button widget with loading state
class RegistrationButton extends StatelessWidget {
  /// Constructs a [RegistrationButton] widget
  const RegistrationButton({super.key});

  /// Helper method extracted for registration button callback.
  Future<void> onRegisterPressed(
    BuildContext context,
    RegistrationController controller,
  ) async {
    final validateResult = controller.validateAll();
    if (!validateResult) {
      return;
    }

    final registrationResult = await controller.registerUser();
    final appIntl = AppInternationalizationService.to;

    if (context.mounted) {
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
        app_router.pushReplacement(context, app_router.businessListRoutePath);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.instance;
    final appIntl = AppInternationalizationService.to;

    return ShadButton(
      onPressed: auth.status == AuthStatus.authenticating
          ? null
          : () => onRegisterPressed(context, RegistrationController.instance),
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
          : Text(appIntl.registrationSubmit),
    );
  }
}
