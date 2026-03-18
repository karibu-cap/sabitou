import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/extends_models.dart';
import '../../utils/formatters.dart';
import 'notification_badge.dart';

/// Notification bell + dropdown popover.
class NotificationDropdown extends StatelessWidget {
  /// The list of alerts messages.
  final List<Alert> alerts;

  /// The number of unread alerts.
  final int unreadCount;

  /// Callback to mark all alerts as read.
  final VoidCallback onMarkAllRead;

  /// Callback to mark a single alert as read.
  final Function(String) onMarkAsRead;

  final _controller = ShadPopoverController();

  /// Constructs a new [NotificationDropdown].
  NotificationDropdown({
    super.key,
    required this.alerts,
    required this.unreadCount,
    required this.onMarkAllRead,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return ShadPopover(
      controller: _controller,
      popover: (context) => _NotificationPanel(
        alerts: alerts,
        unreadCount: unreadCount,
        onMarkAllRead: () {
          onMarkAllRead();
          _controller.hide();
        },
        onMarkAsRead: onMarkAsRead,
      ),
      child: NotificationBadge(
        count: unreadCount,
        child: ShadButton.ghost(
          size: ShadButtonSize.sm,
          onPressed: _controller.toggle,
          padding: const EdgeInsets.all(9),
          child: Icon(LucideIcons.bell, size: 17, color: cs.mutedForeground),
        ),
      ),
    );
  }
}

class _NotificationPanel extends StatelessWidget {
  final List<Alert> alerts;
  final int unreadCount;
  final VoidCallback onMarkAllRead;
  final Function(String) onMarkAsRead;

  const _NotificationPanel({
    required this.alerts,
    required this.unreadCount,
    required this.onMarkAllRead,
    required this.onMarkAsRead,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return SizedBox(
      width: 340,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: cs.muted,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(LucideIcons.bell, size: 14, color: cs.foreground),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intls.to.notifications,
                      style: theme.textTheme.h3.copyWith(fontSize: 14),
                    ),
                    if (unreadCount > 0)
                      Text(
                        '$unreadCount ${Intls.to.nonLue.trParams({'count': unreadCount.toString()})}',
                        style: theme.textTheme.muted.copyWith(fontSize: 11),
                      ),
                  ],
                ),
              ),
              if (unreadCount > 0)
                ShadButton.ghost(
                  size: ShadButtonSize.sm,
                  onPressed: onMarkAllRead,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  child: Text(
                    Intls.to.markAllRead,
                    style: theme.textTheme.muted.copyWith(fontSize: 11),
                  ),
                ),
            ],
          ),

          const SizedBox(height: 14),
          const ShadSeparator.horizontal(),
          const SizedBox(height: 14),

          if (alerts.isEmpty)
            Center(
              child: _EmptyState(theme: theme, cs: cs),
            )
          else
            ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 320),
              child: CustomScrollView(
                slivers: [
                  SliverList.separated(
                    itemCount: alerts.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                    itemBuilder: (_, i) => _NotificationItem(
                      alert: alerts[i],
                      onMarkAsRead: onMarkAsRead,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  final ShadThemeData theme;
  final ShadColorScheme cs;
  const _EmptyState({required this.theme, required this.cs});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(color: cs.muted, shape: BoxShape.circle),
            child: Icon(
              LucideIcons.bellOff,
              size: 22,
              color: cs.mutedForeground,
            ),
          ),
          const SizedBox(height: 12),
          Text(
            Intls.to.noNotifications,
            style: theme.textTheme.small.copyWith(
              fontWeight: FontWeight.w600,
              color: cs.foreground,
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}

class _NotificationItem extends StatelessWidget {
  final Alert alert;
  final Function(String) onMarkAsRead;
  const _NotificationItem({required this.alert, required this.onMarkAsRead});

  Color _severityColor(SeverityType severity, ShadColorScheme cs) {
    switch (severity) {
      case SeverityType.high:
        return cs.destructive;
      case SeverityType.medium:
        return const Color(0xFFF59E0B); // SabitouColors.warning
      default:
        return const Color(0xFF10B981); // SabitouColors.success
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final dotColor = _severityColor(alert.severity, cs);

    return GestureDetector(
      onTap: alert.read ? null : () => onMarkAsRead(alert.id),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: alert.read ? Colors.transparent : cs.muted.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 7,
              height: 7,
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    alert.message,
                    style: theme.textTheme.small.copyWith(
                      color: cs.foreground,
                      fontWeight: alert.read
                          ? FontWeight.w400
                          : FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    Formatters.timeAgo(alert.createdAtInUtc),
                    style: theme.textTheme.muted.copyWith(fontSize: 11),
                  ),
                ],
              ),
            ),
            if (!alert.read)
              Container(
                width: 7,
                height: 7,
                margin: const EdgeInsets.only(top: 4, left: 8),
                decoration: BoxDecoration(
                  color: cs.primary,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
