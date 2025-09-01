import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The stores repository.
final class StoresRepository extends GetxService {
  /// The instance of [StoresRepository].
  static final instance = Get.find<StoresRepository>();

  /// Gets all stores base on business Id.
  Future<List<Store>> getStoresByBusinessId(String businessId) async {
    try {
      final storedata =
          fakeData[CollectionName.stores]
              ?.map(
                (e) =>
                    Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return storedata.where((s) => s.businessId == businessId).toList();
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  /// Get the store by ref.
  Future<Store?> getStoreByRefId(String refId) async {
    try {
      final storedata =
          fakeData[CollectionName.stores]
              ?.map(
                (e) =>
                    Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return storedata.firstWhereOrNull((s) => s.refId == refId);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
