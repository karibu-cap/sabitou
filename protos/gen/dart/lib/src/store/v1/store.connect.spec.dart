//
//  Generated code. Do not modify.
//  source: store/v1/store.proto
//

import "package:connectrpc/connect.dart" as connect;
import "store.pb.dart" as storev1store;

abstract final class StoreService {
  /// Fully-qualified name of the StoreService service.
  static const name = 'store.v1.StoreService';

  /// Creates a new store.
  static const createStore = connect.Spec(
    '/$name/CreateStore',
    connect.StreamType.unary,
    storev1store.CreateStoreRequest.new,
    storev1store.CreateStoreResponse.new,
  );

  /// Gets a store by id.
  static const getStore = connect.Spec(
    '/$name/GetStore',
    connect.StreamType.unary,
    storev1store.GetStoreRequest.new,
    storev1store.GetStoreResponse.new,
  );

  /// Updates a store.
  /// Note:Only the fields that are set will be updated.
  static const updateStore = connect.Spec(
    '/$name/UpdateStore',
    connect.StreamType.unary,
    storev1store.UpdateStoreRequest.new,
    storev1store.UpdateStoreResponse.new,
  );

  /// Deletes a store.
  static const deleteStore = connect.Spec(
    '/$name/DeleteStore',
    connect.StreamType.unary,
    storev1store.DeleteStoreRequest.new,
    storev1store.DeleteStoreResponse.new,
  );

  /// Gets all stores base on business Id.
  static const getBusinessStores = connect.Spec(
    '/$name/GetBusinessStores',
    connect.StreamType.unary,
    storev1store.GetBusinessStoresRequest.new,
    storev1store.GetBusinessStoresResponse.new,
  );
}
