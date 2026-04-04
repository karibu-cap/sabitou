//
//  Generated code. Do not modify.
//  source: store/v1/store.proto
//

import "package:connectrpc/connect.dart" as connect;
import "store.pb.dart" as storev1store;
import "store.connect.spec.dart" as specs;

extension type StoreServiceClient (connect.Transport _transport) {
  /// Creates a new store.
  Future<storev1store.CreateStoreResponse> createStore(
    storev1store.CreateStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.createStore,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a store.
  Future<storev1store.DeleteStoreResponse> deleteStore(
    storev1store.DeleteStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.deleteStore,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
