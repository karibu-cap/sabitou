//
//  Generated code. Do not modify.
//  source: inventory/v1/product.proto
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

import 'product.pb.dart' as $8;
import 'product.pbjson.dart';

export 'product.pb.dart';

abstract class ProductServiceBase extends $pb.GeneratedService {
  $async.Future<$8.FindGlobalProductsResponse> findGlobalProducts($pb.ServerContext ctx, $8.FindGlobalProductsRequest request);
  $async.Future<$8.FindCategoryResponse> findCategory($pb.ServerContext ctx, $8.FindCategoryRequest request);
  $async.Future<$8.AddProductResponse> addProduct($pb.ServerContext ctx, $8.AddProductRequest request);
  $async.Future<$8.GetProductResponse> getProduct($pb.ServerContext ctx, $8.GetProductRequest request);
  $async.Future<$8.UpdateProductResponse> updateProduct($pb.ServerContext ctx, $8.UpdateProductRequest request);
  $async.Future<$8.DeleteProductResponse> deleteProduct($pb.ServerContext ctx, $8.DeleteProductRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'FindGlobalProducts': return $8.FindGlobalProductsRequest();
      case 'FindCategory': return $8.FindCategoryRequest();
      case 'AddProduct': return $8.AddProductRequest();
      case 'GetProduct': return $8.GetProductRequest();
      case 'UpdateProduct': return $8.UpdateProductRequest();
      case 'DeleteProduct': return $8.DeleteProductRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'FindGlobalProducts': return this.findGlobalProducts(ctx, request as $8.FindGlobalProductsRequest);
      case 'FindCategory': return this.findCategory(ctx, request as $8.FindCategoryRequest);
      case 'AddProduct': return this.addProduct(ctx, request as $8.AddProductRequest);
      case 'GetProduct': return this.getProduct(ctx, request as $8.GetProductRequest);
      case 'UpdateProduct': return this.updateProduct(ctx, request as $8.UpdateProductRequest);
      case 'DeleteProduct': return this.deleteProduct(ctx, request as $8.DeleteProductRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => ProductServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => ProductServiceBase$messageJson;
}

