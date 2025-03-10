//
//  Generated code. Do not modify.
//  source: business/v1/client.proto
//

import "package:connectrpc/connect.dart" as connect;
import "client.pb.dart" as businessv1client;
import "client.connect.spec.dart" as specs;

extension type BusinessClientServiceClient (connect.Transport _transport) {
  /// Creates a new client.
  Future<businessv1client.CreateBusinessClientResponse> createBusinessClient(
    businessv1client.CreateBusinessClientRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessClientService.createBusinessClient,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a client by id.
  Future<businessv1client.GetBusinessClientResponse> getBusinessClient(
    businessv1client.GetBusinessClientRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessClientService.getBusinessClient,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a client.
  /// Note:Only the fields that are set will be updated.
  Future<businessv1client.UpdateBusinessClientResponse> updateBusinessClient(
    businessv1client.UpdateBusinessClientRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessClientService.updateBusinessClient,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a client.
  Future<businessv1client.DeleteBusinessClientResponse> deleteBusinessClient(
    businessv1client.DeleteBusinessClientRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessClientService.deleteBusinessClient,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
