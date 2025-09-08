import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// Toast widget for displaying messages.
class Toast {
  /// Shows a success toast.
  static void showSuccessToast(
    BuildContext context,
    String title,
    String message,
  ) {
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(title),
        description: Text(message),
        backgroundColor: Colors.green.withValues(alpha: 0.5),
      ),
    );
  }

  /// Shows error toast notification.
  static void showErrorToast(
    BuildContext context,
    String title,
    String message,
  ) {
    ShadToaster.of(context).show(
      ShadToast(
        title: Text(title),
        description: Text(message),
        backgroundColor: Colors.red.withValues(alpha: 0.5),
      ),
    );
  }
}
