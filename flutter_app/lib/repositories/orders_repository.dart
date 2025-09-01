import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The orders repository.
final class OrdersRepository extends GetxService {
  /// The instance of [OrdersRepository].
  static final instance = Get.find<OrdersRepository>();

  /// Gets list of order with filter by suplier id.
  Future<List<Order>> getOrdersByQuery({String? supplierId}) async {
    try {
      final orderdata =
          fakeData[CollectionName.orders]
              ?.map(
                (e) =>
                    Order()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      if (supplierId != null) {
        return orderdata.where((o) => o.fromId == supplierId).toList();
      }

      return orderdata;
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  /// Gets the order by refid.
  Future<Order> getOrderByRefId(String refId) async {
    try {
      final orderdata =
          fakeData[CollectionName.orders]
              ?.map(
                (e) =>
                    Order()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return orderdata.firstWhere((o) => o.refId == refId);
    } catch (e) {
      debugPrint(e.toString());

      return Order();
    }
  }
}
