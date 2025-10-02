import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_colors.dart';

/// Shows an error toast.
void showErrorToast({
  required BuildContext context,
  required String message,
  String? title,
}) {
  ShadToaster.of(context).show(
    ShadToast.destructive(
      title: title != null ? Text(title) : null,
      description: Text(message),
    ),
  );
}

/// Shows a success toast.
void showSuccessToast({
  required BuildContext context,
  required String message,
  String? title,
}) {
  ShadToaster.of(context).show(
    ShadToast(
      title: title != null
          ? Text(title, style: const TextStyle(color: AppColors.grey0))
          : null,
      description: Text(
        message,
        style: const TextStyle(color: AppColors.grey0),
      ),
      backgroundColor: AppColors.dartGreen,
    ),
  );
}

/// Shows a warning toast.
void showWarningToast({
  required BuildContext context,
  required String message,
  String? title,
}) {
  ShadToaster.of(context).show(
    ShadToast(
      title: title != null ? Text(title) : null,
      description: Text(message),
      backgroundColor: AppColors.lightOrange,
    ),
  );
}

/// Shows a warning toast.
void showNeutralToast({
  required BuildContext context,
  required String message,
  String? title,
}) {
  ShadToaster.of(context).show(
    ShadToast(
      title: title != null ? Text(title) : null,
      description: Text(message),
    ),
  );
}

/// Gets the month name from month number.
String getMonthName(int month) {
  const monthNames = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];

  return monthNames[month - 1];
}
