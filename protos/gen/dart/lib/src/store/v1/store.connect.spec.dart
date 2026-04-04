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

  /// Deletes a store.
  static const deleteStore = connect.Spec(
    '/$name/DeleteStore',
    connect.StreamType.unary,
    storev1store.DeleteStoreRequest.new,
    storev1store.DeleteStoreResponse.new,
  );
}
