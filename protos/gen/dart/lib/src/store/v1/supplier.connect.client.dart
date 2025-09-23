//
//  Generated code. Do not modify.
//  source: store/v1/supplier.proto
//

import "package:connectrpc/connect.dart" as connect;
import "supplier.pb.dart" as storev1supplier;
import "supplier.connect.spec.dart" as specs;

extension type SupplierServiceClient (connect.Transport _transport) {
  /// Creates a new supplier.
  Future<storev1supplier.CreateSupplierResponse> createSupplier(
    storev1supplier.CreateSupplierRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.createSupplier,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a supplier by id.
  Future<storev1supplier.GetSupplierResponse> getSupplier(
    storev1supplier.GetSupplierRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.getSupplier,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets all suppliers of a store.
  Future<storev1supplier.GetStoreSuppliersResponse> getStoreSuppliers(
    storev1supplier.GetStoreSuppliersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.getStoreSuppliers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Streams all suppliers of a store with real-time updates.
  /// This is a server streaming RPC that will send updates whenever suppliers change.
  Stream<storev1supplier.StreamStoreSuppliersResponse> streamStoreSuppliers(
    storev1supplier.StreamStoreSuppliersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.SupplierService.streamStoreSuppliers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a supplier.
  /// Note:Only the fields that are set will be updated. array fields like external_links will be replaced.
  Future<storev1supplier.UpdateSupplierResponse> updateSupplier(
    storev1supplier.UpdateSupplierRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.updateSupplier,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a supplier.
  Future<storev1supplier.DeleteSupplierResponse> deleteSupplier(
    storev1supplier.DeleteSupplierRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.deleteSupplier,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
