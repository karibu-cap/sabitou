import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../tmp/fake_data.dart';
import '../utils/app_constants.dart';

/// The supliers repository.
final class SuppliersRepository extends GetxService {
  /// The instance of [SuppliersRepository].
  static final instance = Get.find<SuppliersRepository>();

  /// Gets all supliers base on business Id.
  Future<List<Supplier>> getSupliersByBusinessId(String businessId) async {
    try {
      final businessdata =
          fakeData[CollectionName.suppliers]
              ?.map(
                (e) =>
                    Supplier()
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
}
