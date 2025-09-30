import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/internationalization/internationalization.dart';

/// The extension for the [StoreCostingMethod] enum.
extension StoreCostingMethodExtension on StoreCostingMethod {
  /// Gets the label for the store costing method.
  String get label {
    switch (this) {
      case StoreCostingMethod.STORE_COSTING_METHOD_AVERAGE:
        return Intls.to.average;
      case StoreCostingMethod.STORE_COSTING_METHOD_FIFO:
        return Intls.to.fifo;
      default:
        return Intls.to.costingMethod;
    }
  }
}
