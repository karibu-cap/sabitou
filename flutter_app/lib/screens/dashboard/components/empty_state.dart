import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../utils/app_constants.dart';

/// A reusable empty state widget for displaying when there's no data.
class EmptyState extends StatelessWidget {
  /// Constructor of new [EmptyState].
  const EmptyState({super.key, required this.icon, required this.message});

  /// The icon.
  final IconData icon;

  /// The message.
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppConstants.largePadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: AppConstants.largeIconSize),
            const SizedBox(height: AppConstants.smallPadding),
            Text(message, style: ShadTheme.of(context).textTheme.muted),
          ],
        ),
      ),
    );
  }
}
