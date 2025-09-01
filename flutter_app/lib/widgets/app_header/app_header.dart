import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/responsive_utils.dart';
import 'notification_dropdown.dart';
import 'user_menu_dropdown.dart';

/// The app header widget.
class HeaderWidget extends StatelessWidget {
  /// The callback function to be called when the menu button is clicked.
  final VoidCallback onMenuClick;

  /// Whether the sidebar is open.
  final bool isSidebarOpen;

  /// Creates a new instance of [HeaderWidget].
  const HeaderWidget({
    super.key,
    required this.onMenuClick,
    required this.isSidebarOpen,
  });

  @override
  Widget build(BuildContext context) {
    final isTablet = ResponsiveUtils.isTablet(context);
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.secondary.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (isTablet) ...[
            IconButton(
              onPressed: onMenuClick,
              icon: Icon(
                isSidebarOpen ? LucideIcons.x400 : LucideIcons.menu400,
                size: 24,
              ),
              padding: const EdgeInsets.all(8),
            ),
            const SizedBox(width: 16),
          ],
          const Spacer(),
          NotificationDropdown(
            alerts: const [],
            unreadCount: 0,
            onMarkAllRead: () {},
            onMarkAsRead: (id) {},
          ),
          const SizedBox(width: 16),
          UserMenuDropdown(user: null, onLogout: () {}),
        ],
      ),
    );
  }
}
