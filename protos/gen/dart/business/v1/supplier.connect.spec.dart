//
//  Generated code. Do not modify.
//  source: business/v1/supplier.proto
//

import "package:connectrpc/connect.dart" as connect;
import "supplier.pb.dart" as businessv1supplier;

abstract final class SupplierService {
  /// Fully-qualified name of the SupplierService service.
  static const name = 'business.v1.SupplierService';

  /// Creates a new supplier.
  static const createSupplier = connect.Spec(
    '/$name/CreateSupplier',
    connect.StreamType.unary,
    businessv1supplier.CreateSupplierRequest.new,
    businessv1supplier.CreateSupplierResponse.new,
  );

  /// Gets a supplier by id.
  static const getSupplier = connect.Spec(
    '/$name/GetSupplier',
    connect.StreamType.unary,
    businessv1supplier.GetSupplierRequest.new,
    businessv1supplier.GetSupplierResponse.new,
  );

  /// Gets all suppliers of a business.
  static const getBusinessSuppliers = connect.Spec(
    '/$name/GetBusinessSuppliers',
    connect.StreamType.unary,
    businessv1supplier.GetBusinessSuppliersRequest.new,
    businessv1supplier.GetBusinessSuppliersResponse.new,
  );

  /// Updates a supplier.
  /// Note:Only the fields that are set will be updated.
  static const updateSupplier = connect.Spec(
    '/$name/UpdateSupplier',
    connect.StreamType.unary,
    businessv1supplier.UpdateSupplierRequest.new,
    businessv1supplier.UpdateSupplierResponse.new,
  );

  /// Deletes a supplier.
  static const deleteSupplier = connect.Spec(
    '/$name/DeleteSupplier',
    connect.StreamType.unary,
    businessv1supplier.DeleteSupplierRequest.new,
    businessv1supplier.DeleteSupplierResponse.new,
  );
}
