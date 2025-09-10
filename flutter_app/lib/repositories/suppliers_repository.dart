import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
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
  SuppliersRepository([connect.Transport? transport])
    : supplierServiceClient = SupplierServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Gets all suppliers base on store Id.
  Future<List<Supplier>> getSuppliersByStore(String storeId) async {
    try {
      final response = await supplierServiceClient.getStoreSuppliers(
        GetStoreSuppliersRequest(storeId: storeId),
      );

      return response.suppliers;
    } on Exception catch (e) {
      _logger.severe('getSuppliersByStoreId Error: $e');

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

  /// Gets all suppliers base on store.
  Future<List<Supplier>> getStoreSuppliers(
    GetStoreSuppliersRequest request,
  ) async {
    try {
      final response = await supplierServiceClient.getStoreSuppliers(request);

      return response.suppliers;
    } on Exception catch (e) {
      _logger.severe('getStoreSuppliers Error: $e');

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

  /// Stream suppliers for a specific store.
  Stream<List<Supplier>> streamStoreSuppliers(
    GetStoreSuppliersRequest request,
  ) {
    try {
      // Use the native gRPC streaming service
      final grpcStream = supplierServiceClient.streamStoreSuppliers(request);

      // Transform the gRPC stream to return List<Supplier>
      return grpcStream.map((response) => response.suppliers);
    } on Exception catch (e) {
      _logger.severe('streamStoreSuppliers Error: $e');

      // Return empty stream on error
      return Stream.value([]);
    }
  }
}
