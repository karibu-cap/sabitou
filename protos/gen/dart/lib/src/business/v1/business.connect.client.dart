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

  /// Get all businesses of the current user.
  Future<businessv1business.GetMyBusinessesResponse> getMyBusinesses(
    businessv1business.GetMyBusinessesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.getMyBusinesses,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get a business by id.
  Future<businessv1business.GetBusinessDetailsResponse> getBusinessDetails(
    businessv1business.GetBusinessDetailsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.getBusinessDetails,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update a business.
  Future<businessv1business.UpdateBusinessResponse> updateBusiness(
    businessv1business.UpdateBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.updateBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Request the deletion of the business. This request doesn't delete the business direcly instead it put the business in inactive state and remove all business members.
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

  /// Add user to business or invite user to business.
  Future<businessv1business.AddUserToBusinessResponse> addUserToBusiness(
    businessv1business.AddUserToBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.addUserToBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Associate user to business.
  Future<businessv1business.AssociateUserToBusinessResponse> associateUserToBusiness(
    businessv1business.AssociateUserToBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.associateUserToBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Remove user from business.
  /// If the user has been created by the business, the user will be deleted.
  /// NOTE: The authenticated user need to have the permission to remove the
  /// user.
  Future<businessv1business.RemoveUserFromBusinessResponse> removeUserFromBusiness(
    businessv1business.RemoveUserFromBusinessRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.removeUserFromBusiness,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Changes the business currency
  Future<businessv1business.ChangeBusinessCurrencyResponse> changeBusinessCurrency(
    businessv1business.ChangeBusinessCurrencyRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.changeBusinessCurrency,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get the users of the business.
  Future<businessv1business.GetBusinessMembersResponse> getBusinessMembers(
    businessv1business.GetBusinessMembersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.getBusinessMembers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get a specific business member.
  Future<businessv1business.GetBusinessMemberResponse> getBusinessMember(
    businessv1business.GetBusinessMemberRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.getBusinessMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update a business member (role, status, permissions).
  Future<businessv1business.UpdateBusinessMemberResponse> updateBusinessMember(
    businessv1business.UpdateBusinessMemberRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BusinessService.updateBusinessMember,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Stream business members for real-time updates.
  Stream<businessv1business.StreamBusinessMembersResponse> streamBusinessMembers(
    businessv1business.StreamBusinessMembersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.BusinessService.streamBusinessMembers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
