import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The products repository.
final class ProductsRepository extends GetxService {
  /// The instance of [ProductsRepository].
  static final instance = Get.find<ProductsRepository>();

  /// Gets all products base on business Id.
  Future<List<BusinessProduct>> getProductsByBusinessId(
    String businessId,
  ) async {
    try {
      final businessdata =
          fakeData[CollectionName.businessProducts]
              ?.map(
                (e) =>
                    BusinessProduct()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return businessdata.where((bp) => bp.businessId == businessId).toList();
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  /// Gets all the global products optional filter by refId.
  Future<List<GlobalProduct>> getGlobalsProduct({String? refId}) async {
    try {
      final globaldata =
          fakeData[CollectionName.globalProducts]
              ?.map(
                (e) =>
                    GlobalProduct()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      if (refId != null) {
        return globaldata.where((gp) => gp.refId == refId).toList();
      }

      return globaldata;
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }

  /// Get the global product by ref.
  Future<GlobalProduct?> getGlobalProductByRefId(String refId) async {
    try {
      final globaldata =
          fakeData[CollectionName.globalProducts]
              ?.map(
                (e) =>
                    GlobalProduct()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return globaldata.firstWhereOrNull((gp) => gp.refId == refId);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  /// Get the business product by ref.
  Future<BusinessProduct?> getBusinessProductByRefId(String refId) async {
    try {
      final businessdata =
          fakeData[CollectionName.businessProducts]
              ?.map(
                (e) =>
                    BusinessProduct()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return businessdata.firstWhereOrNull((bp) => bp.refId == refId);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
