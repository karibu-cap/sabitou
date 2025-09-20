import 'package:flutter/material.dart';

import '../../../../router/app_router.dart';
import '../../../../router/page_routes.dart';
import '../../../../services/internationalization/internationalization.dart';

/// Widget for registration links (already have account, etc.)
class RegistrationLinks extends StatelessWidget {
  /// Constructs a [RegistrationLinks] widget
  const RegistrationLinks({super.key});

  /// Navigate to register screen.
  void navigateToLoginScreen(BuildContext context) {
    AppRouter.pushReplacement(context, PagesRoutes.login.create());
  }

  @override
  Widget build(BuildContext context) {
    final appIntl = AppInternationalizationService.to;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(appIntl.alreadyHaveAnAccount),
        TextButton(
          onPressed: () => navigateToLoginScreen(context),
          child: Text(appIntl.signIn),
        ),
      ],
    );
  }
}
