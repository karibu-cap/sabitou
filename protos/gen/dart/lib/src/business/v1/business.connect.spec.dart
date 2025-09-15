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

  /// Get all businesses of the current user.
  static const getMyBusinesses = connect.Spec(
    '/$name/GetMyBusinesses',
    connect.StreamType.unary,
    businessv1business.GetMyBusinessesRequest.new,
    businessv1business.GetMyBusinessesResponse.new,
  );

  /// Get a business by id.
  static const getBusinessDetails = connect.Spec(
    '/$name/GetBusinessDetails',
    connect.StreamType.unary,
    businessv1business.GetBusinessDetailsRequest.new,
    businessv1business.GetBusinessDetailsResponse.new,
  );

  /// Update a business.
  static const updateBusiness = connect.Spec(
    '/$name/UpdateBusiness',
    connect.StreamType.unary,
    businessv1business.UpdateBusinessRequest.new,
    businessv1business.UpdateBusinessResponse.new,
  );

  /// Request the deletion of the business. This request doesn't delete the business direcly instead it put the business in inactive state and remove all business members.
  static const requestDeleteBusiness = connect.Spec(
    '/$name/RequestDeleteBusiness',
    connect.StreamType.unary,
    businessv1business.RequestDeleteBusinessRequest.new,
    businessv1business.RequestDeleteBusinessResponse.new,
  );

  /// Add user to business or invite user to business.
  static const addUserToBusiness = connect.Spec(
    '/$name/AddUserToBusiness',
    connect.StreamType.unary,
    businessv1business.AddUserToBusinessRequest.new,
    businessv1business.AddUserToBusinessResponse.new,
  );

  /// Associate user to business.
  static const associateUserToBusiness = connect.Spec(
    '/$name/AssociateUserToBusiness',
    connect.StreamType.unary,
    businessv1business.AssociateUserToBusinessRequest.new,
    businessv1business.AssociateUserToBusinessResponse.new,
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

  /// Changes the business currency
  static const changeBusinessCurrency = connect.Spec(
    '/$name/ChangeBusinessCurrency',
    connect.StreamType.unary,
    businessv1business.ChangeBusinessCurrencyRequest.new,
    businessv1business.ChangeBusinessCurrencyResponse.new,
  );

  /// Get the users of the business.
  static const getBusinessMembers = connect.Spec(
    '/$name/GetBusinessMembers',
    connect.StreamType.unary,
    businessv1business.GetBusinessMembersRequest.new,
    businessv1business.GetBusinessMembersResponse.new,
  );

  /// Get a specific business member.
  static const getBusinessMember = connect.Spec(
    '/$name/GetBusinessMember',
    connect.StreamType.unary,
    businessv1business.GetBusinessMemberRequest.new,
    businessv1business.GetBusinessMemberResponse.new,
  );

  /// Update a business member (role, status, permissions).
  static const updateBusinessMember = connect.Spec(
    '/$name/UpdateBusinessMember',
    connect.StreamType.unary,
    businessv1business.UpdateBusinessMemberRequest.new,
    businessv1business.UpdateBusinessMemberResponse.new,
  );

  /// Stream business members for real-time updates.
  static const streamBusinessMembers = connect.Spec(
    '/$name/StreamBusinessMembers',
    connect.StreamType.server,
    businessv1business.StreamBusinessMembersRequest.new,
    businessv1business.StreamBusinessMembersResponse.new,
  );
}
