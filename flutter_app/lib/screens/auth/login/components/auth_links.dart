import 'package:flutter/material.dart';

import '../../../../router/app_router.dart' as app_router;
import '../../../../services/internationalization/internationalization.dart';

/// Auth links.
class AuthLinks extends StatelessWidget {
  /// Constructs auth links.
  const AuthLinks({super.key});

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;

    /// Navigate to register screen.
    void navigateToRegisterScreen(BuildContext context) {
      app_router.pushReplacement(context, app_router.registrationRoutePath);
    }

    /// Navigate to forgot password.
    void navigateToForgotPassword(BuildContext context) {
      app_router.pushReplacement(context, app_router.forgotPasswordRoutePath);
    }

    return Column(
      children: [
        TextButton(
          onPressed: () => navigateToForgotPassword(context),
          child: Text(appIntl.forgotPassword),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appIntl.dontHaveAnAccount),
            TextButton(
              onPressed: () => navigateToRegisterScreen(context),
              child: Text(appIntl.signUp),
            ),
          ],
        ),
      ],
    );
  }
}
