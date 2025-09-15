// This is a generated file - do not edit.
//
// Generated from order/v1/invoice.proto.

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

class OrderInvoiceItem extends $pb.GeneratedMessage {
  factory OrderInvoiceItem({
    $core.String? productId,
    $core.String? productName,
    $core.String? productPriceInXaf,
    $core.int? quantity,
    $core.int? invoiceItemTotalPriceInXaf,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (productName != null) result.productName = productName;
    if (productPriceInXaf != null) result.productPriceInXaf = productPriceInXaf;
    if (quantity != null) result.quantity = quantity;
    if (invoiceItemTotalPriceInXaf != null)
      result.invoiceItemTotalPriceInXaf = invoiceItemTotalPriceInXaf;
    return result;
  }

  OrderInvoiceItem._();

  factory OrderInvoiceItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderInvoiceItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderInvoiceItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'productName')
    ..aOS(3, _omitFieldNames ? '' : 'productPriceInXaf')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'invoiceItemTotalPriceInXaf',
        $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderInvoiceItem clone() => OrderInvoiceItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderInvoiceItem copyWith(void Function(OrderInvoiceItem) updates) =>
      super.copyWith((message) => updates(message as OrderInvoiceItem))
          as OrderInvoiceItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderInvoiceItem create() => OrderInvoiceItem._();
  @$core.override
  OrderInvoiceItem createEmptyInstance() => create();
  static $pb.PbList<OrderInvoiceItem> createRepeated() =>
      $pb.PbList<OrderInvoiceItem>();
  @$core.pragma('dart2js:noInline')
  static OrderInvoiceItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderInvoiceItem>(create);
  static OrderInvoiceItem? _defaultInstance;

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
  $core.String get productPriceInXaf => $_getSZ(2);
  @$pb.TagNumber(3)
  set productPriceInXaf($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProductPriceInXaf() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductPriceInXaf() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get invoiceItemTotalPriceInXaf => $_getIZ(4);
  @$pb.TagNumber(5)
  set invoiceItemTotalPriceInXaf($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasInvoiceItemTotalPriceInXaf() => $_has(4);
  @$pb.TagNumber(5)
  void clearInvoiceItemTotalPriceInXaf() => $_clearField(5);
}

/// The invoice of an order.
/// The invoice is a PDF file that can be downloaded by the customer.
/// It contains the order details, the customer details, the payment details.
class OrderInvoice extends $pb.GeneratedMessage {
  factory OrderInvoice({
    $core.String? orderId,
    $core.String? orderStatus,
    $core.String? orderTotalPriceInXaf,
    $core.String? orderCreatedAt,
    $core.String? orderUpdatedAt,
    $core.String? orderResourceName,
    $core.String? orderResourceAddress,
    $core.String? orderResourcePhoneNumber,
    $core.String? orderResourceEmail,
    $core.String? orderResourceLogoMediaId,
    $core.Iterable<OrderInvoiceItem>? orderItems,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    if (orderStatus != null) result.orderStatus = orderStatus;
    if (orderTotalPriceInXaf != null)
      result.orderTotalPriceInXaf = orderTotalPriceInXaf;
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

  OrderInvoice._();

  factory OrderInvoice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderInvoice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderInvoice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..aOS(2, _omitFieldNames ? '' : 'orderStatus')
    ..aOS(3, _omitFieldNames ? '' : 'orderTotalPriceInXaf')
    ..aOS(4, _omitFieldNames ? '' : 'orderCreatedAt')
    ..aOS(5, _omitFieldNames ? '' : 'orderUpdatedAt')
    ..aOS(6, _omitFieldNames ? '' : 'orderResourceName')
    ..aOS(7, _omitFieldNames ? '' : 'orderResourceAddress')
    ..aOS(8, _omitFieldNames ? '' : 'orderResourcePhoneNumber')
    ..aOS(9, _omitFieldNames ? '' : 'orderResourceEmail')
    ..aOS(10, _omitFieldNames ? '' : 'orderResourceLogoMediaId')
    ..pc<OrderInvoiceItem>(
        11, _omitFieldNames ? '' : 'orderItems', $pb.PbFieldType.PM,
        subBuilder: OrderInvoiceItem.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderInvoice clone() => OrderInvoice()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderInvoice copyWith(void Function(OrderInvoice) updates) =>
      super.copyWith((message) => updates(message as OrderInvoice))
          as OrderInvoice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderInvoice create() => OrderInvoice._();
  @$core.override
  OrderInvoice createEmptyInstance() => create();
  static $pb.PbList<OrderInvoice> createRepeated() =>
      $pb.PbList<OrderInvoice>();
  @$core.pragma('dart2js:noInline')
  static OrderInvoice getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderInvoice>(create);
  static OrderInvoice? _defaultInstance;

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
  $core.String get orderTotalPriceInXaf => $_getSZ(2);
  @$pb.TagNumber(3)
  set orderTotalPriceInXaf($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOrderTotalPriceInXaf() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderTotalPriceInXaf() => $_clearField(3);

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
  $pb.PbList<OrderInvoiceItem> get orderItems => $_getList(10);
}

class GenerateInvoiceRequest extends $pb.GeneratedMessage {
  factory GenerateInvoiceRequest({
    $core.String? orderId,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  GenerateInvoiceRequest._();

  factory GenerateInvoiceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateInvoiceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateInvoiceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvoiceRequest clone() =>
      GenerateInvoiceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvoiceRequest copyWith(
          void Function(GenerateInvoiceRequest) updates) =>
      super.copyWith((message) => updates(message as GenerateInvoiceRequest))
          as GenerateInvoiceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateInvoiceRequest create() => GenerateInvoiceRequest._();
  @$core.override
  GenerateInvoiceRequest createEmptyInstance() => create();
  static $pb.PbList<GenerateInvoiceRequest> createRepeated() =>
      $pb.PbList<GenerateInvoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static GenerateInvoiceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateInvoiceRequest>(create);
  static GenerateInvoiceRequest? _defaultInstance;

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

class GenerateInvoiceResponse extends $pb.GeneratedMessage {
  factory GenerateInvoiceResponse({
    OrderInvoice? orderInvoice,
  }) {
    final result = create();
    if (orderInvoice != null) result.orderInvoice = orderInvoice;
    return result;
  }

  GenerateInvoiceResponse._();

  factory GenerateInvoiceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GenerateInvoiceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GenerateInvoiceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<OrderInvoice>(1, _omitFieldNames ? '' : 'orderInvoice',
        subBuilder: OrderInvoice.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvoiceResponse clone() =>
      GenerateInvoiceResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GenerateInvoiceResponse copyWith(
          void Function(GenerateInvoiceResponse) updates) =>
      super.copyWith((message) => updates(message as GenerateInvoiceResponse))
          as GenerateInvoiceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GenerateInvoiceResponse create() => GenerateInvoiceResponse._();
  @$core.override
  GenerateInvoiceResponse createEmptyInstance() => create();
  static $pb.PbList<GenerateInvoiceResponse> createRepeated() =>
      $pb.PbList<GenerateInvoiceResponse>();
  @$core.pragma('dart2js:noInline')
  static GenerateInvoiceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GenerateInvoiceResponse>(create);
  static GenerateInvoiceResponse? _defaultInstance;

  /// The invoice of the order.
  @$pb.TagNumber(1)
  OrderInvoice get orderInvoice => $_getN(0);
  @$pb.TagNumber(1)
  set orderInvoice(OrderInvoice value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderInvoice() => $_clearField(1);
  @$pb.TagNumber(1)
  OrderInvoice ensureOrderInvoice() => $_ensure(0);
}

class InvoiceServiceApi {
  final $pb.RpcClient _client;

  InvoiceServiceApi(this._client);

  /// Generates an invoice for the order.
  $async.Future<GenerateInvoiceResponse> generateInvoice(
          $pb.ClientContext? ctx, GenerateInvoiceRequest request) =>
      _client.invoke<GenerateInvoiceResponse>(ctx, 'InvoiceService',
          'GenerateInvoice', request, GenerateInvoiceResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
