import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';

/// User info + logout at the bottom of the sidebar.
class CurrentUserView extends StatelessWidget {
  /// The user.
  final User user;

  /// The on logout callback.
  final VoidCallback onLogout;

  /// Constructs the new [CurrentUserView].
  const CurrentUserView({
    super.key,
    required this.user,
    required this.onLogout,
  });

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }

    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: cs.accent,
                borderRadius: const BorderRadius.all(Radius.circular(9)),
                border: Border.fromBorderSide(BorderSide(color: cs.border)),
              ),
              child: Center(
                child: Text(
                  _initials(user.userName),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Color(
                      0xFF7A4F00,
                    ), // dark amber — readable on accentSoft
                    letterSpacing: 0.4,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AutoSizeText(
                    user.userName,
                    style: theme.textTheme.small.copyWith(
                      fontWeight: FontWeight.w600,
                      color: cs.foreground,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
                  const SizedBox(height: 1),
                  AutoSizeText(
                    user.email,
                    style: theme.textTheme.muted.copyWith(fontSize: 11),
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
        ShadButton.ghost(
          width: double.infinity,
          onPressed: onLogout,
          mainAxisAlignment: MainAxisAlignment.start,
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 9),
          leading: Icon(
            LucideIcons.logOut,
            size: 14,
            color: cs.mutedForeground,
          ),
          child: Text(
            Intls.to.logout,
            style: theme.textTheme.small.copyWith(color: cs.mutedForeground),
          ),
        ),
      ],
    );
  }
}
