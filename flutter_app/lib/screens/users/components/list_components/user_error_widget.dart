import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Widget displayed when there's an error loading users.
///
/// Provides error information and retry functionality for user data loading.
class UserErrorWidget extends StatelessWidget {
  /// The error that occurred.
  final Object error;

  /// Callback for retry action.
  final VoidCallback? onRetry;

  /// Creates a new [UserErrorWidget].
  const UserErrorWidget({super.key, required this.error, this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Error icon
          Icon(LucideIcons.triangleAlert, size: 64, color: Colors.red[400]),

          const SizedBox(height: 16),

          // Error title
          Text(
            AppInternationalizationService.to.somethingWentWrong,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.red,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Error message
          Text(
            _getErrorMessage(),
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Retry button
          ShadButton(
            onPressed: onRetry,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(LucideIcons.refreshCw, size: 16),
                SizedBox(width: 8),
                Text(AppInternationalizationService.to.tryAgain),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getErrorMessage() {
    final errorString = error.toString().toLowerCase();

    if (errorString.contains('network') || errorString.contains('connection')) {
      return AppInternationalizationService.to.unableToLoadTeamMembers;
    } else if (errorString.contains('timeout')) {
      return AppInternationalizationService.to.unableToLoadTeamMembers;
    } else if (errorString.contains('unauthorized') ||
        errorString.contains('403')) {
      return AppInternationalizationService.to.unableToLoadTeamMembers;
    } else if (errorString.contains('not found') ||
        errorString.contains('404')) {
      return AppInternationalizationService.to.unableToLoadTeamMembers;
    } else {
      return AppInternationalizationService.to.unableToLoadTeamMembers;
    }
  }
}
