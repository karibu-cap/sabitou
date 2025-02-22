//
//  Generated code. Do not modify.
//  source: order/v1/billing.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OrderReceiptItem extends $pb.GeneratedMessage {
  factory OrderReceiptItem({
    $core.String? productUid,
    $core.String? productName,
    $core.String? productPriceInCents,
    $core.int? quantity,
    $core.int? receiptItemTotalPriceInCents,
  }) {
    final $result = create();
    if (productUid != null) {
      $result.productUid = productUid;
    }
    if (productName != null) {
      $result.productName = productName;
    }
    if (productPriceInCents != null) {
      $result.productPriceInCents = productPriceInCents;
    }
    if (quantity != null) {
      $result.quantity = quantity;
    }
    if (receiptItemTotalPriceInCents != null) {
      $result.receiptItemTotalPriceInCents = receiptItemTotalPriceInCents;
    }
    return $result;
  }
  OrderReceiptItem._() : super();
  factory OrderReceiptItem.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderReceiptItem.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OrderReceiptItem', package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productUid')
    ..aOS(2, _omitFieldNames ? '' : 'productName')
    ..aOS(3, _omitFieldNames ? '' : 'productPriceInCents')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'receiptItemTotalPriceInCents', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrderReceiptItem clone() => OrderReceiptItem()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrderReceiptItem copyWith(void Function(OrderReceiptItem) updates) => super.copyWith((message) => updates(message as OrderReceiptItem)) as OrderReceiptItem;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderReceiptItem create() => OrderReceiptItem._();
  OrderReceiptItem createEmptyInstance() => create();
  static $pb.PbList<OrderReceiptItem> createRepeated() => $pb.PbList<OrderReceiptItem>();
  @$core.pragma('dart2js:noInline')
  static OrderReceiptItem getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderReceiptItem>(create);
  static OrderReceiptItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set productUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get productName => $_getSZ(1);
  @$pb.TagNumber(2)
  set productName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasProductName() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get productPriceInCents => $_getSZ(2);
  @$pb.TagNumber(3)
  set productPriceInCents($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasProductPriceInCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductPriceInCents() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get receiptItemTotalPriceInCents => $_getIZ(4);
  @$pb.TagNumber(5)
  set receiptItemTotalPriceInCents($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasReceiptItemTotalPriceInCents() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiptItemTotalPriceInCents() => clearField(5);
}

/// The receipt of an order.
/// The receipt is a PDF file that can be downloaded by the customer.
/// It contains the order details, the customer details, the payment details.
class OrderReceipt extends $pb.GeneratedMessage {
  factory OrderReceipt({
    $core.String? orderUid,
    $core.String? orderStatus,
    $core.String? orderTotalPriceInCents,
    $core.String? orderCreatedAt,
    $core.String? orderUpdatedAt,
    $core.String? orderResourceName,
    $core.String? orderResourceAddress,
    $core.String? orderResourcePhoneNumber,
    $core.String? orderResourceEmail,
    $core.String? orderResourceLogoMediaUid,
    $core.Iterable<OrderReceiptItem>? orderItems,
  }) {
    final $result = create();
    if (orderUid != null) {
      $result.orderUid = orderUid;
    }
    if (orderStatus != null) {
      $result.orderStatus = orderStatus;
    }
    if (orderTotalPriceInCents != null) {
      $result.orderTotalPriceInCents = orderTotalPriceInCents;
    }
    if (orderCreatedAt != null) {
      $result.orderCreatedAt = orderCreatedAt;
    }
    if (orderUpdatedAt != null) {
      $result.orderUpdatedAt = orderUpdatedAt;
    }
    if (orderResourceName != null) {
      $result.orderResourceName = orderResourceName;
    }
    if (orderResourceAddress != null) {
      $result.orderResourceAddress = orderResourceAddress;
    }
    if (orderResourcePhoneNumber != null) {
      $result.orderResourcePhoneNumber = orderResourcePhoneNumber;
    }
    if (orderResourceEmail != null) {
      $result.orderResourceEmail = orderResourceEmail;
    }
    if (orderResourceLogoMediaUid != null) {
      $result.orderResourceLogoMediaUid = orderResourceLogoMediaUid;
    }
    if (orderItems != null) {
      $result.orderItems.addAll(orderItems);
    }
    return $result;
  }
  OrderReceipt._() : super();
  factory OrderReceipt.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory OrderReceipt.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'OrderReceipt', package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderUid')
    ..aOS(2, _omitFieldNames ? '' : 'orderStatus')
    ..aOS(3, _omitFieldNames ? '' : 'orderTotalPriceInCents')
    ..aOS(4, _omitFieldNames ? '' : 'orderCreatedAt')
    ..aOS(5, _omitFieldNames ? '' : 'orderUpdatedAt')
    ..aOS(6, _omitFieldNames ? '' : 'orderResourceName')
    ..aOS(7, _omitFieldNames ? '' : 'orderResourceAddress')
    ..aOS(8, _omitFieldNames ? '' : 'orderResourcePhoneNumber')
    ..aOS(9, _omitFieldNames ? '' : 'orderResourceEmail')
    ..aOS(10, _omitFieldNames ? '' : 'orderResourceLogoMediaUid')
    ..pc<OrderReceiptItem>(11, _omitFieldNames ? '' : 'orderItems', $pb.PbFieldType.PM, subBuilder: OrderReceiptItem.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  OrderReceipt clone() => OrderReceipt()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  OrderReceipt copyWith(void Function(OrderReceipt) updates) => super.copyWith((message) => updates(message as OrderReceipt)) as OrderReceipt;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderReceipt create() => OrderReceipt._();
  OrderReceipt createEmptyInstance() => create();
  static $pb.PbList<OrderReceipt> createRepeated() => $pb.PbList<OrderReceipt>();
  @$core.pragma('dart2js:noInline')
  static OrderReceipt getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderReceipt>(create);
  static OrderReceipt? _defaultInstance;

  /// / ...order details...
  @$pb.TagNumber(1)
  $core.String get orderUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderUid() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderStatus => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderStatus($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasOrderStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderStatus() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get orderTotalPriceInCents => $_getSZ(2);
  @$pb.TagNumber(3)
  set orderTotalPriceInCents($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasOrderTotalPriceInCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderTotalPriceInCents() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get orderCreatedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set orderCreatedAt($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasOrderCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderCreatedAt() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get orderUpdatedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderUpdatedAt($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasOrderUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderUpdatedAt() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get orderResourceName => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderResourceName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasOrderResourceName() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderResourceName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get orderResourceAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set orderResourceAddress($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasOrderResourceAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderResourceAddress() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get orderResourcePhoneNumber => $_getSZ(7);
  @$pb.TagNumber(8)
  set orderResourcePhoneNumber($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasOrderResourcePhoneNumber() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrderResourcePhoneNumber() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get orderResourceEmail => $_getSZ(8);
  @$pb.TagNumber(9)
  set orderResourceEmail($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasOrderResourceEmail() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrderResourceEmail() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get orderResourceLogoMediaUid => $_getSZ(9);
  @$pb.TagNumber(10)
  set orderResourceLogoMediaUid($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasOrderResourceLogoMediaUid() => $_has(9);
  @$pb.TagNumber(10)
  void clearOrderResourceLogoMediaUid() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<OrderReceiptItem> get orderItems => $_getList(10);
}

class GenerateBillingRequest extends $pb.GeneratedMessage {
  factory GenerateBillingRequest({
    $core.String? orderUid,
  }) {
    final $result = create();
    if (orderUid != null) {
      $result.orderUid = orderUid;
    }
    return $result;
  }
  GenerateBillingRequest._() : super();
  factory GenerateBillingRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateBillingRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateBillingRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateBillingRequest clone() => GenerateBillingRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateBillingRequest copyWith(void Function(GenerateBillingRequest) updates) => super.copyWith((message) => updates(message as GenerateBillingRequest)) as GenerateBillingRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateBillingRequest create() => GenerateBillingRequest._();
  GenerateBillingRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateBillingRequest> createRepeated() => $pb.PbList<GenerateBillingRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateBillingRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateBillingRequest>(create);
  static GenerateBillingRequest? _defaultInstance;

  /// The unique identifier of the order.
  @$pb.TagNumber(1)
  $core.String get orderUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderUid() => clearField(1);
}

class GenerateBillingResponse extends $pb.GeneratedMessage {
  factory GenerateBillingResponse({
    OrderReceipt? orderReceipt,
  }) {
    final $result = create();
    if (orderReceipt != null) {
      $result.orderReceipt = orderReceipt;
    }
    return $result;
  }
  GenerateBillingResponse._() : super();
  factory GenerateBillingResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GenerateBillingResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GenerateBillingResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'), createEmptyInstance: create)
    ..aOM<OrderReceipt>(1, _omitFieldNames ? '' : 'orderReceipt', subBuilder: OrderReceipt.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GenerateBillingResponse clone() => GenerateBillingResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GenerateBillingResponse copyWith(void Function(GenerateBillingResponse) updates) => super.copyWith((message) => updates(message as GenerateBillingResponse)) as GenerateBillingResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateBillingResponse create() => GenerateBillingResponse._();
  GenerateBillingResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateBillingResponse> createRepeated() => $pb.PbList<GenerateBillingResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateBillingResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GenerateBillingResponse>(create);
  static GenerateBillingResponse? _defaultInstance;

  /// The receipt of the order.
  @$pb.TagNumber(1)
  OrderReceipt get orderReceipt => $_getN(0);
  @$pb.TagNumber(1)
  set orderReceipt(OrderReceipt v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasOrderReceipt() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderReceipt() => clearField(1);
  @$pb.TagNumber(1)
  OrderReceipt ensureOrderReceipt() => $_ensure(0);
}

class BillingServiceApi {
  $pb.RpcClient _client;
  BillingServiceApi(this._client);

  $async.Future<GenerateBillingResponse> generateBilling($pb.ClientContext? ctx, GenerateBillingRequest request) =>
    _client.invoke<GenerateBillingResponse>(ctx, 'BillingService', 'GenerateBilling', request, GenerateBillingResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
