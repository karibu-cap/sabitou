//
//  Generated code. Do not modify.
//  source: store/v1/store.proto
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

import 'store.pb.dart' as $12;
import 'store.pbjson.dart';

export 'store.pb.dart';

abstract class StoreServiceBase extends $pb.GeneratedService {
  $async.Future<$12.CreateStoreResponse> createStore($pb.ServerContext ctx, $12.CreateStoreRequest request);
  $async.Future<$12.GetStoreResponse> getStore($pb.ServerContext ctx, $12.GetStoreRequest request);
  $async.Future<$12.UpdateStoreResponse> updateStore($pb.ServerContext ctx, $12.UpdateStoreRequest request);
  $async.Future<$12.DeleteStoreResponse> deleteStore($pb.ServerContext ctx, $12.DeleteStoreRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateStore': return $12.CreateStoreRequest();
      case 'GetStore': return $12.GetStoreRequest();
      case 'UpdateStore': return $12.UpdateStoreRequest();
      case 'DeleteStore': return $12.DeleteStoreRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateStore': return this.createStore(ctx, request as $12.CreateStoreRequest);
      case 'GetStore': return this.getStore(ctx, request as $12.GetStoreRequest);
      case 'UpdateStore': return this.updateStore(ctx, request as $12.UpdateStoreRequest);
      case 'DeleteStore': return this.deleteStore(ctx, request as $12.DeleteStoreRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => StoreServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => StoreServiceBase$messageJson;
}

