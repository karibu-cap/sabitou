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

  /// Gets a client by id.
  static const getBusinessClient = connect.Spec(
    '/$name/GetBusinessClient',
    connect.StreamType.unary,
    businessv1client.GetBusinessClientRequest.new,
    businessv1client.GetBusinessClientResponse.new,
  );

  /// Updates a client.
  /// Note:Only the fields that are set will be updated.
  static const updateBusinessClient = connect.Spec(
    '/$name/UpdateBusinessClient',
    connect.StreamType.unary,
    businessv1client.UpdateBusinessClientRequest.new,
    businessv1client.UpdateBusinessClientResponse.new,
  );

  /// Deletes a client.
  static const deleteBusinessClient = connect.Spec(
    '/$name/DeleteBusinessClient',
    connect.StreamType.unary,
    businessv1client.DeleteBusinessClientRequest.new,
    businessv1client.DeleteBusinessClientResponse.new,
  );
}
