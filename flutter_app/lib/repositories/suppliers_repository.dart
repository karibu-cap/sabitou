import 'dart:async';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The suppliers repository.
final class SuppliersRepository {
  final _logger = LoggerApp('SuppliersRepository');

  /// The supplier service client.
  final SupplierServiceClient supplierServiceClient;

  /// The instance of [SuppliersRepository].
  static final instance = GetIt.I.get<SuppliersRepository>();

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

  /// Gets all suppliers base on busines.
  Future<List<Supplier>> getBusinessSuppliers(
    GetBusinessSuppliersRequest request,
  ) async {
    try {
      final response = await supplierServiceClient.getBusinessSuppliers(
        request,
      );

      return response.suppliers;
    } on Exception catch (e) {
      _logger.severe('getBusinessSuppliers Error: $e');

      return [];
    }
  }

  /// Gets a supplier by ref.
  Future<Supplier?> getSupplier(GetSupplierRequest request) async {
    try {
      final response = await supplierServiceClient.getSupplier(request);

      return response.supplier;
    } on Exception catch (e) {
      _logger.severe('getSupplierBySupplierId Error: $e');

      return null;
    }
  }

  /// Creates a new supplier.
  Future<String?> createSupplier(CreateSupplierRequest request) async {
    try {
      final response = await supplierServiceClient.createSupplier(request);

      return response.supplierId;
    } on Exception catch (e) {
      _logger.severe('createSupplier Error: $e');

      return null;
    }
  }

  /// Updates an existing supplier.
  Future<Supplier?> updateSupplier(UpdateSupplierRequest request) async {
    try {
      final response = await supplierServiceClient.updateSupplier(request);

      return response.supplier;
    } on Exception catch (e) {
      _logger.severe('updateSupplier Error: $e');

      return null;
    }
  }

  /// Deletes a supplier by ID.
  Future<bool> deleteSupplier(DeleteSupplierRequest request) async {
    try {
      final response = await supplierServiceClient.deleteSupplier(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('deleteSupplier Error: $e');

      return false;
    }
  }

  /// Stream suppliers for a specific business.
  Stream<List<Supplier>> streamBusinessSuppliers(
    GetBusinessSuppliersRequest request,
  ) {
    try {
      // Use the native gRPC streaming service
      final grpcStream = supplierServiceClient.streamBusinessSuppliers(request);
      
      // Transform the gRPC stream to return List<Supplier>
      return grpcStream.map((response) => response.suppliers);
    } catch (e) {
      _logger.severe('streamSuppliersByBusinessId Error: $e');
      
      // Return empty stream on error
      return Stream.value([]);
    }
  }
}
