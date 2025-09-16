import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';

/// The user menu dropdown widget.
class CurrentUserView extends StatelessWidget {
  /// The user.
  final User user;

  /// The callback function to be called when the logout button is clicked.
  final VoidCallback onLogout;

  /// Creates a new instance of [CurrentUserView].
  CurrentUserView({super.key, required this.user, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.fromBorderSide(
                  BorderSide(color: theme.colorScheme.card),
                ),
                color: theme.colorScheme.muted,
              ),
              child: Icon(
                LucideIcons.user400,
                size: 20,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AutoSizeText(
                    user.firstName,
                    style: theme.textTheme.large,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
                  AutoSizeText(
                    user.email,
                    style: theme.textTheme.muted,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SizedBox(
          width: double.infinity,
          child: ShadButton.ghost(
            onPressed: onLogout,
            leading: const Icon(LucideIcons.logOut400),
            child: Text(Intls.to.logout),
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
          ),
        ),
      ],
    );
  }
}
