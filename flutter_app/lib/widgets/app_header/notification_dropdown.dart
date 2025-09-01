import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../utils/extends_models.dart';
import 'notification_badge.dart';

/// The notification dropdown widget.
class NotificationDropdown extends StatelessWidget {
  /// The list of alerts.
  final List<Alert> alerts;

  /// The number of unread alerts.
  final int unreadCount;

  /// The callback function to be called when all alerts are marked as read.
  final VoidCallback onMarkAllRead;

  /// The callback function to be called when an alert is marked as read.
  final Function(String) onMarkAsRead;

  /// The popover controller.
  final popoverController = ShadPopoverController();

  /// Creates a new instance of [NotificationDropdown].
  NotificationDropdown({
    super.key,
    required this.alerts,
    required this.unreadCount,
    required this.onMarkAllRead,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadPopover(
      controller: popoverController,
      child: NotificationBadge(
        count: unreadCount,
        child: IconButton(
          onPressed: popoverController.toggle,
          icon: Icon(LucideIcons.bell400, color: theme.colorScheme.primary),
          padding: const EdgeInsets.all(8),
        ),
      ),
      popover: (context) => SizedBox(
        width: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intls.to.notifications, style: theme.textTheme.large),
                if (unreadCount > 0)
                  TextButton(
                    onPressed: () {
                      onMarkAllRead();
                      Navigator.pop(context);
                    },
                    child: Text(
                      Intls.to.markAllRead,
                      style: theme.textTheme.muted,
                    ),
                  ),
              ],
            ),
            const Divider(),
            if (alerts.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32),
                child: Center(
                  child: Text(
                    Intls.to.noNotifications,
                    style: theme.textTheme.muted,
                  ),
                ),
              )
            else
              Container(
                constraints: const BoxConstraints(maxHeight: 300),
                child: ListView(
                  children: alerts
                      .map(
                        (alert) => _NotificationItem(
                          alert: alert,
                          onMarkAsRead: onMarkAsRead,
                        ),
                      )
                      .toList(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

final class _NotificationItem extends StatelessWidget {
  const _NotificationItem({required this.alert, required this.onMarkAsRead});

  final Alert alert;
  final Function(String) onMarkAsRead;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    Color getSeverityColor(SeverityType severity) {
      switch (severity) {
        case SeverityType.high:
          return AppColors.red;
        case SeverityType.medium:
          return AppColors.warningColor;
        default:
          return AppColors.lightGreen;
      }
    }

    String formatDateTime(DateTime dateTime) {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year} ${dateTime.hour}:${dateTime.minute.toString().padLeft(2, '0')}';
    }

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: !alert.read
            ? AppColors.cobalt.withValues(alpha: 0.1)
            : AppColors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 8,
            height: 8,
            margin: const EdgeInsets.only(top: 6),
            decoration: BoxDecoration(
              color: getSeverityColor(alert.severity),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(alert.message, style: theme.textTheme.p),
                const SizedBox(height: 4),
                Text(
                  formatDateTime(alert.createdAtInUtc),
                  style: theme.textTheme.muted,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
