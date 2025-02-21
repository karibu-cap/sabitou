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

  /// Get a business by id.
  static const getBusiness = connect.Spec(
    '/$name/GetBusiness',
    connect.StreamType.unary,
    businessv1business.GetBusinessRequest.new,
    businessv1business.GetBusinessResponse.new,
  );

  /// Update a business.
  static const updateBusiness = connect.Spec(
    '/$name/UpdateBusiness',
    connect.StreamType.unary,
    businessv1business.UpdateBusinessRequest.new,
    businessv1business.UpdateBusinessResponse.new,
  );

  /// Request the deletion of the business.
  static const requestDeleteBusiness = connect.Spec(
    '/$name/RequestDeleteBusiness',
    connect.StreamType.unary,
    businessv1business.RequestDeleteBusinessRequest.new,
    businessv1business.RequestDeleteBusinessResponse.new,
  );

  /// Processes the deletion of the business requested by the owner.
  static const deleteBusiness = connect.Spec(
    '/$name/DeleteBusiness',
    connect.StreamType.unary,
    businessv1business.DeleteBusinessRequest.new,
    businessv1business.DeleteBusinessResponse.new,
  );

  /// Add user to business or invite user to business.
  static const addUserToBusiness = connect.Spec(
    '/$name/AddUserToBusiness',
    connect.StreamType.unary,
    businessv1business.AddUserToBusinessRequest.new,
    businessv1business.AddUserToBusinessResponse.new,
  );

  /// Remove user from business.
  /// If the user has been created by the business, the user will be deleted.
  /// NOTE: The authenticated user need to have the permission to remove the
  /// user.
  static const removeUserFromBusiness = connect.Spec(
    '/$name/RemoveUserFromBusiness',
    connect.StreamType.unary,
    businessv1business.RemoveUserFromBusinessRequest.new,
    businessv1business.RemoveUserFromBusinessResponse.new,
  );

  /// Get the users of the business.
  static const getBusinessUsers = connect.Spec(
    '/$name/GetBusinessUsers',
    connect.StreamType.unary,
    businessv1business.GetBusinessUsersRequest.new,
    businessv1business.GetBusinessUsersResponse.new,
  );
}
