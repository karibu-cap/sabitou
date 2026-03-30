import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../services/internationalization/internationalization.dart';
import '../themes/app_theme.dart';

/// Widget displayed when the user is not connected or when the user is null.
///
/// Shows an appropriate message for session expiration or authentication
/// issues, with a button to navigate back to the sign-in screen.
class NoUserFound extends StatelessWidget {
  /// Creates a new [NoUserFound].
  const NoUserFound({super.key});

  void _navigateToSignIn(BuildContext context) {
    AppRouter.go(context, PagesRoutes.login.pattern);
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            LucideIcons.userX,
            size: 64,
            color: SabitouColors.neutralForeground,
          ),
          const SizedBox(height: 24),
          Text(
            intl.noUserFound,
            style: theme.textTheme.h3.copyWith(fontWeight: FontWeight.w600),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Text(
            intl.pleaseSignInAgain,
            style: theme.textTheme.muted.copyWith(fontSize: 16),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 32),

          ShadButton(
            size: ShadButtonSize.lg,
            onPressed: () => _navigateToSignIn(context),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(LucideIcons.logIn, size: 18),
                const SizedBox(width: 8),
                Text(intl.backToSignIn),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
