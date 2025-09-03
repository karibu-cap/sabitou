import 'package:flutter/material.dart';
import '../../../../router/app_router.dart' as app_router;

import '../../../../services/internationalization/internationalization.dart';

/// Widget for registration links (already have account, etc.)
class RegistrationLinks extends StatelessWidget {
  /// Constructs a [RegistrationLinks] widget
  const RegistrationLinks({super.key});

  /// Navigate to register screen.
  void navigateToLoginScreen(BuildContext context) {
    app_router.pushReplacement(context, app_router.loginRoutePath);
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
