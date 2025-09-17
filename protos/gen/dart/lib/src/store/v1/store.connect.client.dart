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

  /// Gets a store by id.
  Future<storev1store.GetStoreResponse> getStore(
    storev1store.GetStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.getStore,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a store.
  /// Note:Only the fields that are set will be updated.
  Future<storev1store.UpdateStoreResponse> updateStore(
    storev1store.UpdateStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.updateStore,
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

  /// Gets all stores base on business Id.
  Future<storev1store.GetBusinessStoresResponse> getBusinessStores(
    storev1store.GetBusinessStoresRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.getBusinessStores,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Add user to store or invite user to store.
  Future<storev1store.AddUserToStoreResponse> addUserToStore(
    storev1store.AddUserToStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.addUserToStore,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update store member.
  Future<storev1store.UpdateStoreMemberResponse> updateStoreMember(
    storev1store.UpdateStoreMemberRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.updateStoreMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Stream store members.
  Stream<storev1store.StreamStoreMembersResponse> streamStoreMembers(
    storev1store.StreamStoreMembersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.StoreService.streamStoreMembers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get store members.
  Future<storev1store.GetStoreMembersResponse> getStoreMembers(
    storev1store.GetStoreMembersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.getStoreMembers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Set store member status.
  Future<storev1store.SetStoreMemberStatusResponse> setStoreMemberStatus(
    storev1store.SetStoreMemberStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.setStoreMemberStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Remove user from store.
  Future<storev1store.RemoveUserFromStoreResponse> removeUserFromStore(
    storev1store.RemoveUserFromStoreRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreService.removeUserFromStore,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
