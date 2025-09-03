import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The suppliers repository.
final class SuppliersRepository extends GetxService {
  final _logger = LoggerApp('SuppliersRepository');

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
    } on Exception catch (e) {
      _logger.severe('getSuppliersByBusinessId Error: $e');

      return [];
    }
  }

  /// Gets a supplier by ref.
  Future<Supplier?> getSupplierBySupplierId(String supplierId) async {
    try {
      final response = await supplierServiceClient.getSupplier(
        GetSupplierRequest(supplierId: supplierId),
      );

      return response.supplier;
    } on Exception catch (e) {
      _logger.severe('getSupplierBySupplierId Error: $e');

      return null;
    }
  }
}
