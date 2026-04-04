//
//  Generated code. Do not modify.
//  source: business/v1/client.proto
//

import "package:connectrpc/connect.dart" as connect;
import "client.pb.dart" as businessv1client;

abstract final class BusinessClientService {
  /// Fully-qualified name of the BusinessClientService service.
  static const name = 'business.v1.BusinessClientService';

  /// Creates a new client.
  static const createBusinessClient = connect.Spec(
    '/$name/CreateBusinessClient',
    connect.StreamType.unary,
    businessv1client.CreateBusinessClientRequest.new,
    businessv1client.CreateBusinessClientResponse.new,
  );

  /// Deletes a client.
  static const deleteBusinessClient = connect.Spec(
    '/$name/DeleteBusinessClient',
    connect.StreamType.unary,
    businessv1client.DeleteBusinessClientRequest.new,
    businessv1client.DeleteBusinessClientResponse.new,
  );
}
