//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'business.pb.dart' as $0;
import 'business.pbjson.dart';

export 'business.pb.dart';

abstract class BusinessServiceBase extends $pb.GeneratedService {
  $async.Future<$0.CreateBusinessResponse> createBusiness($pb.ServerContext ctx, $0.CreateBusinessRequest request);
  $async.Future<$0.GetBusinessResponse> getBusiness($pb.ServerContext ctx, $0.GetBusinessRequest request);
  $async.Future<$0.UpdateBusinessResponse> updateBusiness($pb.ServerContext ctx, $0.UpdateBusinessRequest request);
  $async.Future<$0.RequestDeleteBusinessResponse> requestDeleteBusiness($pb.ServerContext ctx, $0.RequestDeleteBusinessRequest request);
  $async.Future<$0.DeleteBusinessResponse> deleteBusiness($pb.ServerContext ctx, $0.DeleteBusinessRequest request);
  $async.Future<$0.AddUserToBusinessResponse> addUserToBusiness($pb.ServerContext ctx, $0.AddUserToBusinessRequest request);
  $async.Future<$0.RemoveUserFromBusinessResponse> removeUserFromBusiness($pb.ServerContext ctx, $0.RemoveUserFromBusinessRequest request);
  $async.Future<$0.GetBusinessUsersResponse> getBusinessUsers($pb.ServerContext ctx, $0.GetBusinessUsersRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateBusiness': return $0.CreateBusinessRequest();
      case 'GetBusiness': return $0.GetBusinessRequest();
      case 'UpdateBusiness': return $0.UpdateBusinessRequest();
      case 'RequestDeleteBusiness': return $0.RequestDeleteBusinessRequest();
      case 'DeleteBusiness': return $0.DeleteBusinessRequest();
      case 'AddUserToBusiness': return $0.AddUserToBusinessRequest();
      case 'RemoveUserFromBusiness': return $0.RemoveUserFromBusinessRequest();
      case 'GetBusinessUsers': return $0.GetBusinessUsersRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateBusiness': return this.createBusiness(ctx, request as $0.CreateBusinessRequest);
      case 'GetBusiness': return this.getBusiness(ctx, request as $0.GetBusinessRequest);
      case 'UpdateBusiness': return this.updateBusiness(ctx, request as $0.UpdateBusinessRequest);
      case 'RequestDeleteBusiness': return this.requestDeleteBusiness(ctx, request as $0.RequestDeleteBusinessRequest);
      case 'DeleteBusiness': return this.deleteBusiness(ctx, request as $0.DeleteBusinessRequest);
      case 'AddUserToBusiness': return this.addUserToBusiness(ctx, request as $0.AddUserToBusinessRequest);
      case 'RemoveUserFromBusiness': return this.removeUserFromBusiness(ctx, request as $0.RemoveUserFromBusinessRequest);
      case 'GetBusinessUsers': return this.getBusinessUsers(ctx, request as $0.GetBusinessUsersRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => BusinessServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => BusinessServiceBase$messageJson;
}

