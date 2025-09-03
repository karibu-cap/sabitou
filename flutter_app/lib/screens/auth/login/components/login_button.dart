import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../providers/auth/auth_provider.dart';
import '../../../../services/internationalization/internationalization.dart';

/// Custom login button widget with loading state
class LoginButton extends StatelessWidget {
  /// Callback when button is pressed
  final VoidCallback onPressed;

  /// Constructs a [LoginButton] widget
  const LoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final auth = AuthProvider.instance;
    final appIntl = AppInternationalizationService.to;

    return ShadButton(
      onPressed: auth.status == AuthStatus.authenticating ? null : onPressed,
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
