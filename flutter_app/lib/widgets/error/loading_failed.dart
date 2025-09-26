import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Widget that displays a list of helpful suggestions for error resolution.
class _SuggestionsList extends StatelessWidget {
  /// The internationalization service.
  final AppInternationalizationService intl;

  /// Creates a new [_SuggestionsList].
  const _SuggestionsList({required this.intl});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SuggestionItem(text: intl.checkInternetConnection),
        _SuggestionItem(text: intl.refreshPageSuggestion),
        _SuggestionItem(text: intl.contactAdminSuggestion),
      ],
    );
  }
}

/// Widget that displays a single suggestion item with bullet point.
class _SuggestionItem extends StatelessWidget {
  /// The suggestion text to display.
  final String text;

  /// Creates a new [_SuggestionItem].
  const _SuggestionItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '• ',
            style: TextStyle(
              color: Colors.amber[700],
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TextStyle(fontSize: 12, color: Colors.amber[700]),
            ),
          ),
        ],
      ),
    );
  }
}

/// Error widget for when data loading fails.
///
/// Displays a user-friendly error message with retry functionality
/// and helpful suggestions for resolving the issue.
class LoadingFailedWidget extends StatelessWidget {
  /// The error that occurred.
  final Object error;

  /// Callback function to retry loading data.
  final VoidCallback? onRetry;

  /// Creates a new [LoadingFailedWidget].
  const LoadingFailedWidget({super.key, required this.error, this.onRetry});

  /// Converts technical error messages to user-friendly descriptions.
  String _getHumanReadableError(
    Object error,
    AppInternationalizationService intl,
  ) {
    final errorString = error.toString().toLowerCase();

    // Network-related errors
    if (errorString.contains('network') ||
        errorString.contains('connection') ||
        errorString.contains('timeout') ||
        errorString.contains('unreachable')) {
      return intl.networkErrorMessage;
    }

    // Authentication errors
    if (errorString.contains('auth') ||
        errorString.contains('unauthorized') ||
        errorString.contains('forbidden')) {
      return intl.authErrorMessage;
    }

    // Server errors
    if (errorString.contains('server') ||
        errorString.contains('500') ||
        errorString.contains('internal')) {
      return intl.serverErrorMessage;
    }

    // Data format errors
    if (errorString.contains('format') ||
        errorString.contains('parse') ||
        errorString.contains('json')) {
      return intl.dataFormatErrorMessage;
    }

    // Generic fallback
    return intl.genericErrorMessage;
  }

  /// Shows contact support dialog.
  void _showContactSupport(
    BuildContext context,
    AppInternationalizationService intl,
  ) {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(
        title: Text(intl.contactSupportText),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(intl.contactSupportMessage),
            const SizedBox(height: 16),

            // Error details for support
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    intl.errorDetailsText,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    error.toString(),
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Close button
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShadButton.outline(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(intl.closeText),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        border: Border.fromBorderSide(
          BorderSide(color: Colors.red[50] ?? Colors.red),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Error icon
          Icon(LucideIcons.triangleAlert, size: 48, color: Colors.red[600]),

          const SizedBox(height: 16),

          // Main error title
          Text(
            intl.errorLoadingSuppliers,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.red[800],
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // User-friendly error description
          Text(
            _getHumanReadableError(error, intl),
            style: TextStyle(fontSize: 14, color: Colors.red[700]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // Suggestions
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.amber[50],
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.fromBorderSide(
                BorderSide(color: Colors.amber[200] ?? Colors.amber),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      LucideIcons.lightbulb,
                      size: 16,
                      color: Colors.amber[700],
                    ),
                    const SizedBox(width: 8),
                    Text(
                      intl.suggestionsText,
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.amber[800],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                _SuggestionsList(intl: intl),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Retry button
              if (onRetry != null) ...[
                ShadButton(
                  onPressed: onRetry,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(LucideIcons.refreshCw, size: 16),
                      const SizedBox(width: 8),
                      Text(intl.retryText),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
              ],

              // Contact support button
              ShadButton.outline(
                onPressed: () => _showContactSupport(context, intl),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(LucideIcons.handHelping, size: 16),
                    const SizedBox(width: 8),
                    Text(intl.contactSupportText),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
