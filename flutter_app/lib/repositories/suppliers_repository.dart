import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';

/// The suppliers repository.
final class SuppliersRepository extends GetxService {
  /// The supplier service client.
  final SupplierServiceClient supplierServiceClient;

  /// The instance of [SuppliersRepository].
  static final instance = Get.find<SuppliersRepository>();

  /// Constructs a new [SuppliersRepository].
  SuppliersRepository()
    : supplierServiceClient = SupplierServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all suppliers base on business Id.
  Future<List<Supplier>> getSuppliersByBusinessId(String businessId) async {
    try {
      final response = await supplierServiceClient.getBusinessSuppliers(
        GetBusinessSuppliersRequest(businessId: businessId),
      );

      return response.suppliers;
    } catch (e) {
      debugPrint(e.toString());

      return [];
    }
  }
}
