import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The business repository.
final class BusinessRepository extends GetxService {
  /// The instance of [BusinessRepository].
  static final instance = Get.find<BusinessRepository>();

  /// Gets the business by ref.
  Future<Business?> getBusinessByRefId(String refId) async {
    try {
      final businessdata =
          fakeData[CollectionName.businesses]
              ?.map(
                (e) =>
                    Business()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return businessdata.firstWhereOrNull((b) => b.refId == refId);
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }

  /// Gets the business menbers by business ref.
  Future<BusinessMember?> getBusinessMembersByBusinessRefId(
    String businessId,
    String userId,
  ) async {
    try {
      final businessdata =
          fakeData[CollectionName.businessMembers]
              ?.map(
                (e) =>
                    BusinessMember()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList() ??
          [];

      return businessdata.firstWhereOrNull(
        (bm) => bm.businessId == businessId && bm.userId == userId,
      );
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
