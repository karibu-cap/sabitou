//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//

import "package:connectrpc/connect.dart" as connect;
import "business.pb.dart" as businessv1business;

abstract final class BusinessService {
  /// Fully-qualified name of the BusinessService service.
  static const name = 'business.v1.BusinessService';

  /// Create a new business.
  static const createBusiness = connect.Spec(
    '/$name/CreateBusiness',
    connect.StreamType.unary,
    businessv1business.CreateBusinessRequest.new,
    businessv1business.CreateBusinessResponse.new,
  );

  /// Request the deletion of the business. This request doesn't delete the business directly instead it put the business in inactive state and remove all business members.
  static const requestDeleteBusiness = connect.Spec(
    '/$name/RequestDeleteBusiness',
    connect.StreamType.unary,
    businessv1business.RequestDeleteBusinessRequest.new,
    businessv1business.RequestDeleteBusinessResponse.new,
  );
}
