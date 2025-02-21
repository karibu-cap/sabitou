//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
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

import 'order.pb.dart' as $11;
import 'order.pbjson.dart';

export 'order.pb.dart';

abstract class OrderServiceBase extends $pb.GeneratedService {
  $async.Future<$11.CreateOrderResponse> createOrder($pb.ServerContext ctx, $11.CreateOrderRequest request);
  $async.Future<$11.GetOrderResponse> getOrder($pb.ServerContext ctx, $11.GetOrderRequest request);
  $async.Future<$11.DeleteOrderResponse> deleteOrder($pb.ServerContext ctx, $11.DeleteOrderRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateOrder': return $11.CreateOrderRequest();
      case 'GetOrder': return $11.GetOrderRequest();
      case 'DeleteOrder': return $11.DeleteOrderRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateOrder': return this.createOrder(ctx, request as $11.CreateOrderRequest);
      case 'GetOrder': return this.getOrder(ctx, request as $11.GetOrderRequest);
      case 'DeleteOrder': return this.deleteOrder(ctx, request as $11.DeleteOrderRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => OrderServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => OrderServiceBase$messageJson;
}

