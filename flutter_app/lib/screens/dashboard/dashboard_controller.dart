import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'dashboard_view_model.dart';

/// The dashboard controller.
class DashboardController extends GetxController {
  /// The dashboard view model.
  final DashboardViewModel viewModel = DashboardViewModel();

  /// Loading state.
  RxBool get isLoading => viewModel.isLoading;

  /// Error message if any.
  RxString get error => viewModel.error;

  /// Dashboard stats.
  Rx<DashboardStatsData> get stats => viewModel.stats;

  /// List of low stock products.
  RxList<BusinessProduct> get lowStockProducts => viewModel.lowStockProducts;

  /// List of expiring products.
  RxList<BusinessProduct> get expiringProducts => viewModel.expiringProducts;

  /// Map of global products for quick lookup (only for low stock and expiring).
  RxMap<String, GlobalProduct> get globalProducts => viewModel.globalProducts;

  /// Calculates the percentage change.
  double calculatePercentChange(num current, num? previous) {
    if (previous == null || previous == 0) return 0;

    return ((current - previous) / previous) * 100;
  }
}
