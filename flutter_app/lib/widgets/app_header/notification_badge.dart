import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A count badge overlaid on any child widget.
class NotificationBadge extends StatelessWidget {
  /// The number of notifications.
  final int count;

  /// The child widget.
  final Widget child;

  /// The background color.
  final Color? backgroundColor;

  /// The text color.
  final Color? textColor;

  /// Constructs a new [NotificationBadge].
  const NotificationBadge({
    super.key,
    required this.count,
    required this.child,
    this.backgroundColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return child;

    final cs = ShadTheme.of(context).colorScheme;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        Positioned(
          top: 4,
          right: 4,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
            decoration: BoxDecoration(
              color: backgroundColor ?? cs.destructive,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              border: Border.fromBorderSide(BorderSide(color: cs.card)),
            ),
            constraints: const BoxConstraints(minWidth: 15, minHeight: 15),
            child: Text(
              count > 99 ? '99+' : '$count',
              style: TextStyle(
                color: textColor ?? cs.destructiveForeground,
                fontSize: 8,
                fontWeight: FontWeight.w800,
                height: 1.3,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
