import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Generic empty state shown when a section has no data.
class EmptyState extends StatelessWidget {
  const EmptyState({
    super.key,
    required this.icon,
    required this.message,
    this.subtitle,
  });

  final IconData icon;
  final String message;

  /// Optional second line of text.
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: cs.muted,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 22, color: cs.mutedForeground),
            ),
            const SizedBox(height: 12),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
                color: cs.foreground,
              ),
            ),
            if (subtitle != null) ...[
              const SizedBox(height: 4),
              Text(
                subtitle.toString(),
                textAlign: TextAlign.center,
                style: theme.textTheme.muted.copyWith(fontSize: 12),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
