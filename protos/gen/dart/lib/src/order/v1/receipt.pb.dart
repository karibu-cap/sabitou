// This is a generated file - do not edit.
//
// Generated from order/v1/receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class OrderReceiptItem extends $pb.GeneratedMessage {
  factory OrderReceiptItem({
    $core.String? productId,
    $core.String? productName,
    $core.String? productPrice,
    $core.int? quantity,
    $core.int? receiptItemTotalPrice,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (productName != null) result.productName = productName;
    if (productPrice != null) result.productPrice = productPrice;
    if (quantity != null) result.quantity = quantity;
    if (receiptItemTotalPrice != null)
      result.receiptItemTotalPrice = receiptItemTotalPrice;
    return result;
  }

  OrderReceiptItem._();

  factory OrderReceiptItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderReceiptItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderReceiptItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'productName')
    ..aOS(3, _omitFieldNames ? '' : 'productPrice')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'receiptItemTotalPrice', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderReceiptItem clone() => OrderReceiptItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderReceiptItem copyWith(void Function(OrderReceiptItem) updates) =>
      super.copyWith((message) => updates(message as OrderReceiptItem))
          as OrderReceiptItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderReceiptItem create() => OrderReceiptItem._();
  @$core.override
  OrderReceiptItem createEmptyInstance() => create();
  static $pb.PbList<OrderReceiptItem> createRepeated() =>
      $pb.PbList<OrderReceiptItem>();
  @$core.pragma('dart2js:noInline')
  static OrderReceiptItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderReceiptItem>(create);
  static OrderReceiptItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get productName => $_getSZ(1);
  @$pb.TagNumber(2)
  set productName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProductName() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductName() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get productPrice => $_getSZ(2);
  @$pb.TagNumber(3)
  set productPrice($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProductPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get receiptItemTotalPrice => $_getIZ(4);
  @$pb.TagNumber(5)
  set receiptItemTotalPrice($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceiptItemTotalPrice() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceiptItemTotalPrice() => $_clearField(5);
}

/// The receipt of an order.
/// The receipt is a PDF file that can be downloaded by the customer.
/// It contains the order details, the customer details, the payment details.
class OrderReceipt extends $pb.GeneratedMessage {
  factory OrderReceipt({
    $core.String? orderId,
    $core.String? orderStatus,
    $core.String? orderTotalPrice,
    $core.String? orderCreatedAt,
    $core.String? orderUpdatedAt,
    $core.String? orderResourceName,
    $core.String? orderResourceAddress,
    $core.String? orderResourcePhoneNumber,
    $core.String? orderResourceEmail,
    $core.String? orderResourceLogoMediaId,
    $core.Iterable<OrderReceiptItem>? orderItems,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (orderStatus != null) result.orderStatus = orderStatus;
    if (orderTotalPrice != null) result.orderTotalPrice = orderTotalPrice;
    if (orderCreatedAt != null) result.orderCreatedAt = orderCreatedAt;
    if (orderUpdatedAt != null) result.orderUpdatedAt = orderUpdatedAt;
    if (orderResourceName != null) result.orderResourceName = orderResourceName;
    if (orderResourceAddress != null)
      result.orderResourceAddress = orderResourceAddress;
    if (orderResourcePhoneNumber != null)
      result.orderResourcePhoneNumber = orderResourcePhoneNumber;
    if (orderResourceEmail != null)
      result.orderResourceEmail = orderResourceEmail;
    if (orderResourceLogoMediaId != null)
      result.orderResourceLogoMediaId = orderResourceLogoMediaId;
    if (orderItems != null) result.orderItems.addAll(orderItems);
    return result;
  }

  OrderReceipt._();

  factory OrderReceipt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderReceipt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderReceipt',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'orderStatus')
    ..aOS(3, _omitFieldNames ? '' : 'orderTotalPrice')
    ..aOS(4, _omitFieldNames ? '' : 'orderCreatedAt')
    ..aOS(5, _omitFieldNames ? '' : 'orderUpdatedAt')
    ..aOS(6, _omitFieldNames ? '' : 'orderResourceName')
    ..aOS(7, _omitFieldNames ? '' : 'orderResourceAddress')
    ..aOS(8, _omitFieldNames ? '' : 'orderResourcePhoneNumber')
    ..aOS(9, _omitFieldNames ? '' : 'orderResourceEmail')
    ..aOS(10, _omitFieldNames ? '' : 'orderResourceLogoMediaId')
    ..pc<OrderReceiptItem>(
        11, _omitFieldNames ? '' : 'orderItems', $pb.PbFieldType.PM,
        subBuilder: OrderReceiptItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderReceipt clone() => OrderReceipt()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderReceipt copyWith(void Function(OrderReceipt) updates) =>
      super.copyWith((message) => updates(message as OrderReceipt))
          as OrderReceipt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderReceipt create() => OrderReceipt._();
  @$core.override
  OrderReceipt createEmptyInstance() => create();
  static $pb.PbList<OrderReceipt> createRepeated() =>
      $pb.PbList<OrderReceipt>();
  @$core.pragma('dart2js:noInline')
  static OrderReceipt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderReceipt>(create);
  static OrderReceipt? _defaultInstance;

  /// / ...order details...
  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderStatus => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderStatus($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get orderTotalPrice => $_getSZ(2);
  @$pb.TagNumber(3)
  set orderTotalPrice($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOrderTotalPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderTotalPrice() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get orderCreatedAt => $_getSZ(3);
  @$pb.TagNumber(4)
  set orderCreatedAt($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasOrderCreatedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearOrderCreatedAt() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get orderUpdatedAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set orderUpdatedAt($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasOrderUpdatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearOrderUpdatedAt() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get orderResourceName => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderResourceName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderResourceName() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderResourceName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get orderResourceAddress => $_getSZ(6);
  @$pb.TagNumber(7)
  set orderResourceAddress($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasOrderResourceAddress() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderResourceAddress() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get orderResourcePhoneNumber => $_getSZ(7);
  @$pb.TagNumber(8)
  set orderResourcePhoneNumber($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasOrderResourcePhoneNumber() => $_has(7);
  @$pb.TagNumber(8)
  void clearOrderResourcePhoneNumber() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get orderResourceEmail => $_getSZ(8);
  @$pb.TagNumber(9)
  set orderResourceEmail($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOrderResourceEmail() => $_has(8);
  @$pb.TagNumber(9)
  void clearOrderResourceEmail() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get orderResourceLogoMediaId => $_getSZ(9);
  @$pb.TagNumber(10)
  set orderResourceLogoMediaId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasOrderResourceLogoMediaId() => $_has(9);
  @$pb.TagNumber(10)
  void clearOrderResourceLogoMediaId() => $_clearField(10);

  @$pb.TagNumber(11)
  $pb.PbList<OrderReceiptItem> get orderItems => $_getList(10);
}

class GenerateBillingRequest extends $pb.GeneratedMessage {
  factory GenerateBillingRequest({
    $core.String? orderId,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  GenerateBillingRequest._();

  factory GenerateBillingRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateBillingRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateBillingRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateBillingRequest clone() =>
      GenerateBillingRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateBillingRequest copyWith(
          void Function(GenerateBillingRequest) updates) =>
      super.copyWith((message) => updates(message as GenerateBillingRequest))
          as GenerateBillingRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateBillingRequest create() => GenerateBillingRequest._();
  @$core.override
  GenerateBillingRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateBillingRequest> createRepeated() =>
      $pb.PbList<GenerateBillingRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateBillingRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateBillingRequest>(create);
  static GenerateBillingRequest? _defaultInstance;

  /// The unique identifier of the order.
  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class GenerateBillingResponse extends $pb.GeneratedMessage {
  factory GenerateBillingResponse({
    OrderReceipt? orderReceipt,
  }) {
    final result = create();
    if (orderReceipt != null) result.orderReceipt = orderReceipt;
    return result;
  }

  GenerateBillingResponse._();

  factory GenerateBillingResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateBillingResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateBillingResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<OrderReceipt>(1, _omitFieldNames ? '' : 'orderReceipt',
        subBuilder: OrderReceipt.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateBillingResponse clone() =>
      GenerateBillingResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateBillingResponse copyWith(
          void Function(GenerateBillingResponse) updates) =>
      super.copyWith((message) => updates(message as GenerateBillingResponse))
          as GenerateBillingResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateBillingResponse create() => GenerateBillingResponse._();
  @$core.override
  GenerateBillingResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateBillingResponse> createRepeated() =>
      $pb.PbList<GenerateBillingResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateBillingResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateBillingResponse>(create);
  static GenerateBillingResponse? _defaultInstance;

  /// The receipt of the order.
  @$pb.TagNumber(1)
  OrderReceipt get orderReceipt => $_getN(0);
  @$pb.TagNumber(1)
  set orderReceipt(OrderReceipt value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderReceipt() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderReceipt() => $_clearField(1);
  @$pb.TagNumber(1)
  OrderReceipt ensureOrderReceipt() => $_ensure(0);
}

class BillingServiceApi {
  final $pb.RpcClient _client;

  BillingServiceApi(this._client);

  /// Generates a billing for the order.
  $async.Future<GenerateBillingResponse> generateBilling(
          $pb.ClientContext? ctx, GenerateBillingRequest request) =>
      _client.invoke<GenerateBillingResponse>(ctx, 'BillingService',
          'GenerateBilling', request, GenerateBillingResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
