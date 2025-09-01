import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';

/// The user menu dropdown widget.
class UserMenuDropdown extends StatelessWidget {
  /// The user.
  final User? user;

  /// The callback function to be called when the logout button is clicked.
  final VoidCallback onLogout;

  /// The popover controller.
  final popoverController = ShadPopoverController();

  /// Creates a new instance of [UserMenuDropdown].
  UserMenuDropdown({super.key, required this.user, required this.onLogout});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadPopover(
      controller: popoverController,
      child: InkWell(
        onTap: popoverController.toggle,
        child: Row(
          children: [
            Icon(
              LucideIcons.user400,
              size: 20,
              color: theme.colorScheme.primary,
            ),
            const SizedBox(width: 8),
            Text(user?.firstName ?? 'Guest', style: theme.textTheme.large),
            const SizedBox(width: 4),
            const Icon(LucideIcons.chevronDown400, size: 20),
          ],
        ),
      ),
      popover: (context) => SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(user?.firstName ?? 'Guest', style: theme.textTheme.large),
            const SizedBox(height: 4),
            Text('GUEST', style: theme.textTheme.muted),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            InkWell(
              onTap: () {
                Navigator.pop(context);
                onLogout();
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.logOut400,
                      color: ShadTheme.of(context).colorScheme.destructive,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      Intls.to.logout,
                      style: theme.textTheme.lead.copyWith(
                        color: ShadTheme.of(context).colorScheme.destructive,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
