import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../themes/app_colors.dart';

/// The notification badge widget.
class NotificationBadge extends StatelessWidget {
  /// The count of notifications.
  final int count;

  /// The child widget.
  final Widget child;

  /// The background color of the badge.
  final Color? backgroundColor;

  /// The text color of the badge.
  final Color? textColor;

  /// Creates a new instance of [NotificationBadge].
  const NotificationBadge({
    super.key,
    required this.count,
    required this.child,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (count > 0)
          Positioned(
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color:
                    backgroundColor ??
                    ShadTheme.of(context).colorScheme.destructive,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
              ),
              constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
              child: Text(
                count.toString(),
                style: TextStyle(
                  color: textColor ?? AppColors.grey0,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
      ],
    );
  }
}
