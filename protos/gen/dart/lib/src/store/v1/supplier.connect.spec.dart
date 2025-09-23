//
//  Generated code. Do not modify.
//  source: store/v1/supplier.proto
//

import "package:connectrpc/connect.dart" as connect;
import "supplier.pb.dart" as storev1supplier;

abstract final class SupplierService {
  /// Fully-qualified name of the SupplierService service.
  static const name = 'store.v1.SupplierService';

  /// Creates a new supplier.
  static const createSupplier = connect.Spec(
    '/$name/CreateSupplier',
    connect.StreamType.unary,
    storev1supplier.CreateSupplierRequest.new,
    storev1supplier.CreateSupplierResponse.new,
  );

  /// Gets a supplier by id.
  static const getSupplier = connect.Spec(
    '/$name/GetSupplier',
    connect.StreamType.unary,
    storev1supplier.GetSupplierRequest.new,
    storev1supplier.GetSupplierResponse.new,
  );

  /// Gets all suppliers of a store.
  static const getStoreSuppliers = connect.Spec(
    '/$name/GetStoreSuppliers',
    connect.StreamType.unary,
    storev1supplier.GetStoreSuppliersRequest.new,
    storev1supplier.GetStoreSuppliersResponse.new,
  );

  /// Streams all suppliers of a store with real-time updates.
  /// This is a server streaming RPC that will send updates whenever suppliers change.
  static const streamStoreSuppliers = connect.Spec(
    '/$name/StreamStoreSuppliers',
    connect.StreamType.server,
    storev1supplier.StreamStoreSuppliersRequest.new,
    storev1supplier.StreamStoreSuppliersResponse.new,
  );

  /// Updates a supplier.
  /// Note:Only the fields that are set will be updated. array fields like external_links will be replaced.
  static const updateSupplier = connect.Spec(
    '/$name/UpdateSupplier',
    connect.StreamType.unary,
    storev1supplier.UpdateSupplierRequest.new,
    storev1supplier.UpdateSupplierResponse.new,
  );

  /// Deletes a supplier.
  static const deleteSupplier = connect.Spec(
    '/$name/DeleteSupplier',
    connect.StreamType.unary,
    storev1supplier.DeleteSupplierRequest.new,
    storev1supplier.DeleteSupplierResponse.new,
  );
}
