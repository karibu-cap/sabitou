import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../router/app_router.dart';
import '../../../../router/page_routes.dart';
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
      AppRouter.pushReplacement(context, PagesRoutes.registration.create());
    }

    /// Navigate to forgot password.
    void navigateToForgotPassword(BuildContext context) {
      AppRouter.pushReplacement(context, PagesRoutes.forgotPassword.create());
    }

    return Column(
      children: [
        ShadButton.link(
          onPressed: () => navigateToForgotPassword(context),
          child: Text(appIntl.forgotPassword),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(appIntl.dontHaveAnAccount),
            ShadButton.link(
              onPressed: () => navigateToRegisterScreen(context),
              child: Text(appIntl.signUp),
            ),
          ],
        ),
      ],
    );
  }
}
