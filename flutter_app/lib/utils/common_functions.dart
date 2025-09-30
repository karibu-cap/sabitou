import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_colors.dart';

/// Checks if a product is low in stock.
bool isLowStock(StoreProduct businessProduct) {
  return businessProduct.stockQuantity <= businessProduct.minStockThreshold;
}

/// Computes expiring products (improved to next 30 days).
List<StoreProduct> computeExpiringProducts(List<StoreProduct> storeProducts) {
  return storeProducts.where((p) {
    return isExpiringSoon(p, 60);
  }).toList()..sort(
    (a, b) =>
        a.expirationDate.toDateTime().compareTo(b.expirationDate.toDateTime()),
  );
}

/// Checks if a product is expiring soon.
bool isExpiringSoon(StoreProduct businessProduct, int days) {
  final now = clock.now();
  final threshold = now.add(Duration(days: days));

  if (!businessProduct.hasExpirationDate()) {
    return false;
  }
  final expiry = businessProduct.expirationDate.toDateTime().toUtc();

  return !expiry.isAfter(threshold);
}

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
