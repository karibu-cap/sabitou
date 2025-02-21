//
//  Generated code. Do not modify.
//  source: business/v1/supplier.proto
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

import 'supplier.pb.dart' as $1;
import 'supplier.pbjson.dart';

export 'supplier.pb.dart';

abstract class SupplierServiceBase extends $pb.GeneratedService {
  $async.Future<$1.CreateSupplierResponse> createSupplier($pb.ServerContext ctx, $1.CreateSupplierRequest request);
  $async.Future<$1.GetSupplierResponse> getSupplier($pb.ServerContext ctx, $1.GetSupplierRequest request);
  $async.Future<$1.GetBusinessSuppliersResponse> getBusinessSuppliers($pb.ServerContext ctx, $1.GetBusinessSuppliersRequest request);
  $async.Future<$1.UpdateSupplierResponse> updateSupplier($pb.ServerContext ctx, $1.UpdateSupplierRequest request);
  $async.Future<$1.DeleteSupplierResponse> deleteSupplier($pb.ServerContext ctx, $1.DeleteSupplierRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreateSupplier': return $1.CreateSupplierRequest();
      case 'GetSupplier': return $1.GetSupplierRequest();
      case 'GetBusinessSuppliers': return $1.GetBusinessSuppliersRequest();
      case 'UpdateSupplier': return $1.UpdateSupplierRequest();
      case 'DeleteSupplier': return $1.DeleteSupplierRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreateSupplier': return this.createSupplier(ctx, request as $1.CreateSupplierRequest);
      case 'GetSupplier': return this.getSupplier(ctx, request as $1.GetSupplierRequest);
      case 'GetBusinessSuppliers': return this.getBusinessSuppliers(ctx, request as $1.GetBusinessSuppliersRequest);
      case 'UpdateSupplier': return this.updateSupplier(ctx, request as $1.UpdateSupplierRequest);
      case 'DeleteSupplier': return this.deleteSupplier(ctx, request as $1.DeleteSupplierRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => SupplierServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => SupplierServiceBase$messageJson;
}

