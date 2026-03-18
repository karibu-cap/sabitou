import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/responsive_utils.dart';
import '../../providers/auth/auth_provider.dart';
import '../../utils/formatters.dart';
import 'notification_dropdown.dart';

/// The app header widget.
class HeaderWidget extends StatelessWidget {
  /// The on menu click callback.
  final VoidCallback onMenuClick;

  /// The is sidebar open.
  final bool isSidebarOpen;

  /// Constructs the new [HeaderWidget].
  const HeaderWidget({
    super.key,
    required this.onMenuClick,
    required this.isSidebarOpen,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final user = context.watch<AuthProvider>().currentUser;
    final firstName = user?.userName.split(' ').first ?? '';

    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: cs.card,
        border: Border(bottom: BorderSide(color: cs.border)),
      ),
      child: Row(
        children: [
          if (isMobile) ...[
            ShadButton.ghost(
              size: ShadButtonSize.sm,
              onPressed: onMenuClick,
              padding: const EdgeInsets.all(8),
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Icon(
                  isSidebarOpen ? LucideIcons.x : LucideIcons.menu,
                  key: ValueKey(isSidebarOpen),
                  size: 18,
                  color: cs.foreground,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],

          Expanded(
            child: isMobile
                ? _MobileLogoTitle(theme: theme, cs: cs)
                : _DesktopGreeting(
                    greeting: Formatters.greeting(),
                    firstName: firstName,
                    date: Formatters.hummainFormattedDate(),
                    theme: theme,
                    cs: cs,
                  ),
          ),

          _HeaderActions(user: user, isMobile: isMobile),
        ],
      ),
    );
  }
}

class _MobileLogoTitle extends StatelessWidget {
  final ShadThemeData theme;
  final ShadColorScheme cs;
  const _MobileLogoTitle({required this.theme, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 28,
          height: 28,
          decoration: BoxDecoration(
            color: cs.accent,
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            border: Border.fromBorderSide(BorderSide(color: cs.border)),
          ),
          child: const Icon(
            LucideIcons.package,
            size: 14,
            color: Color(0xFF7A4F00),
          ),
        ),
        const SizedBox(width: 8),
        Text(
          'Sabitou',
          style: theme.textTheme.h4.copyWith(fontSize: 14, letterSpacing: -0.2),
        ),
      ],
    );
  }
}

class _DesktopGreeting extends StatelessWidget {
  final String greeting;
  final String firstName;
  final String date;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  const _DesktopGreeting({
    required this.greeting,
    required this.firstName,
    required this.date,
    required this.theme,
    required this.cs,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '$greeting${firstName.isNotEmpty ? ', $firstName' : ''} 👋',
          style: theme.textTheme.h3.copyWith(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            height: 1.1,
            color: cs.foreground,
          ),
        ),
        const SizedBox(height: 2),
        Text(date, style: theme.textTheme.muted.copyWith(fontSize: 11)),
      ],
    );
  }
}

class _HeaderActions extends StatelessWidget {
  final User? user;
  final bool isMobile;
  const _HeaderActions({this.user, required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        NotificationDropdown(
          alerts: const [],
          unreadCount: 0,
          onMarkAllRead: () {},
          onMarkAsRead: (_) {},
        ),
        if (!isMobile) ...[const SizedBox(width: 6), _UserChip(user: user)],
      ],
    );
  }
}

class _UserChip extends StatelessWidget {
  final User? user;
  const _UserChip({this.user});

  String _initials(String name) {
    final parts = name.trim().split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts.first[0]}${parts.last[0]}'.toUpperCase();
    }

    return name.substring(0, name.length.clamp(0, 2)).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final theme = ShadTheme.of(context);
    final name = user?.userName ?? '';

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Amber initials avatar
          Container(
            width: 22,
            height: 22,
            decoration: BoxDecoration(color: cs.accent, shape: BoxShape.circle),
            child: Center(
              child: Text(
                name.isNotEmpty ? _initials(name) : '?',
                style: const TextStyle(
                  fontSize: 8,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF7A4F00),
                  letterSpacing: 0.3,
                ),
              ),
            ),
          ),
          const SizedBox(width: 7),
          Text(
            name.isNotEmpty ? name.split(' ').first : 'User',
            style: theme.textTheme.small.copyWith(
              fontWeight: FontWeight.w600,
              color: cs.foreground,
            ),
          ),
          const SizedBox(width: 5),
          Icon(LucideIcons.chevronsUpDown, size: 11, color: cs.mutedForeground),
        ],
      ),
    );
  }
}
