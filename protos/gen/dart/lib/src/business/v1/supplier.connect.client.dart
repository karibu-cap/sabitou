//
//  Generated code. Do not modify.
//  source: business/v1/supplier.proto
//

import "package:connectrpc/connect.dart" as connect;
import "supplier.pb.dart" as businessv1supplier;
import "supplier.connect.spec.dart" as specs;

extension type SupplierServiceClient (connect.Transport _transport) {
  /// Creates a new supplier.
  Future<businessv1supplier.CreateSupplierResponse> createSupplier(
    businessv1supplier.CreateSupplierRequest input, {
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
  Future<businessv1supplier.GetSupplierResponse> getSupplier(
    businessv1supplier.GetSupplierRequest input, {
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

  /// Gets all suppliers of a business.
  Future<businessv1supplier.GetBusinessSuppliersResponse> getBusinessSuppliers(
    businessv1supplier.GetBusinessSuppliersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SupplierService.getBusinessSuppliers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a supplier.
  /// Note:Only the fields that are set will be updated. array fiels like external_links will be replaced.
  Future<businessv1supplier.UpdateSupplierResponse> updateSupplier(
    businessv1supplier.UpdateSupplierRequest input, {
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
  Future<businessv1supplier.DeleteSupplierResponse> deleteSupplier(
    businessv1supplier.DeleteSupplierRequest input, {
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
