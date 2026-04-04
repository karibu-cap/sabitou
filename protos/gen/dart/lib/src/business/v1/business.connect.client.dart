//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//

import "package:connectrpc/connect.dart" as connect;
import "business.pb.dart" as businessv1business;
import "business.connect.spec.dart" as specs;

extension type BusinessServiceClient (connect.Transport _transport) {
  /// Create a new business.
  Future<businessv1business.CreateBusinessResponse> createBusiness(
    businessv1business.CreateBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.createBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Request the deletion of the business. This request doesn't delete the business directly instead it put the business in inactive state and remove all business members.
  Future<businessv1business.RequestDeleteBusinessResponse> requestDeleteBusiness(
    businessv1business.RequestDeleteBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.requestDeleteBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
