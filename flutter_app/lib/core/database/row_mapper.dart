import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/powersync/schema.dart';
import 'local_data_source.dart';

/// Extenxion to map a row to a model.
extension RowMapper on Map<String, dynamic> {
  /// Require a string column.
  String requireString(String col) {
    final val = this[col];
    if (val == null) throw StateError('Column "$col" is null but required');

    return val as String;
  }

  /// Optional string column.
  String? optString(String col) => this[col] as String?;

  /// Require int column.
  int requireInt(String col) => (this[col] as num).toInt();

  /// Optional int column.
  int? optInt(String col) => (this[col] as num?)?.toInt();

  /// Require double column.
  double requireDouble(String col) => (this[col] as num).toDouble();

  /// Optional double column.
  double? optDouble(String col) => (this[col] as num?)?.toDouble();

  /// Optional bool column.
  bool optBool(String col, {bool fallback = false}) {
    final val = this[col];
    if (val == null) return fallback;
    if (val is bool) return val;

    return val == 1;
  }

  /// Optional datetime column.
  DateTime? optDateTime(String col) {
    final val = optString(col);

    return val != null ? DateTime.parse(val) : null;
  }

  /// Require datetime column.
  DateTime requireDateTime(String col) => DateTime.parse(requireString(col));
}

/// Converts a [User] to a [User].
User fromRowToUser(RawRow row) {
  return User(
    refId: row.optString(UsersFields.refId),
    email: row.optString(UsersFields.email),
    userName: row.optString(UsersFields.userName),
    phoneNumber: row.optString(UsersFields.phoneNumber),
    firstName: row.optString(UsersFields.firstName),
    lastName: row.optString(UsersFields.lastName),
    accountStatus: AccountStatusType.values.firstWhereOrNull(
      (e) => e.name == row.optString(UsersFields.accountStatus),
    ),
    connectedAccounts: row.optString(UsersFields.connectedAccounts) != null
        ? (jsonDecode(row.optString(UsersFields.connectedAccounts).toString())
                  as List)
              .map((e) => ConnectedAccount.create()..mergeFromProto3Json(e))
              .toList()
        : [],
    requiredActions: row.optString(UsersFields.requiredActions) == null
        ? []
        : (jsonDecode(row.optString(UsersFields.requiredActions).toString())
              as List<AuthActionType>),

    profileLink:
        row.optString(UsersFields.profileLinkId) == null
              ? null
              : ResourceLink.create()
          ?..mergeFromProto3Json(
            jsonDecode(row.optString(UsersFields.profileLinkId).toString()),
          ),
    activeBusinessId: row.optString(UsersFields.activeBusinessId),
    activeStoreId: row.optString(UsersFields.activeStoreId),
  );
}

/// Converts a [User] to a [RawRow].
RawRow fromUsertoRaw(User user) {
  return {
    UsersFields.refId: user.hasRefId() ? user.refId : null,
    UsersFields.userName: user.userName,
    UsersFields.email: user.hasEmail() ? user.email : null,
    UsersFields.phoneNumber: user.hasPhoneNumber() ? user.phoneNumber : null,
    UsersFields.firstName: user.hasFirstName() ? user.firstName : null,
    UsersFields.lastName: user.hasLastName() ? user.lastName : null,

    // enum → int
    UsersFields.accountStatus: user.hasAccountStatus()
        ? user.accountStatus.value
        : null,

    // repeated message → JSON array (proto3Json par message)
    UsersFields.connectedAccounts: jsonEncode(
      user.connectedAccounts.map((a) => a.toProto3Json()).toList(),
    ),

    // repeated enum → JSON int array
    UsersFields.requiredActions: jsonEncode(
      user.requiredActions.map((a) => a.value).toList(),
    ),

    // nested message → JSON object
    UsersFields.profileLinkId: user.hasProfileLink()
        ? jsonEncode(user.profileLink.toProto3Json())
        : null,

    UsersFields.activeBusinessId: user.activeBusinessId,
    UsersFields.activeStoreId: user.activeStoreId,
  };
}

/// Converts a [Business] to a [RawRow].
RawRow fromBusinessToRaw(Business business) {
  return {
    BusinessesFields.refId: business.hasRefId() ? business.refId : null,
    BusinessesFields.name: business.name,
    BusinessesFields.description: business.hasDescription()
        ? business.description
        : null,
    BusinessesFields.status: business.hasStatus() ? business.status.name : null,
    BusinessesFields.ownerId: business.ownerId,
    BusinessesFields.logoLinkId: business.hasLogoLinkId()
        ? business.logoLinkId
        : null,
    BusinessesFields.countryCode: business.countryCode,
    BusinessesFields.currencyCode: business.currencyCode,
    BusinessesFields.externalLinksIds: business.externalLinksIds.isNotEmpty
        ? jsonEncode(business.externalLinksIds)
        : null,
    BusinessesFields.contactInfo: business.hasContactInfo()
        ? business.contactInfo
        : null,
    BusinessesFields.address: business.hasAddress() ? business.address : null,
    BusinessesFields.email: business.hasEmail() ? business.email : null,
  };
}

/// Converts a [RawRow] to a [Business].
Business fromRowToBusiness(RawRow row) {
  return Business(
    refId: row.optString(BusinessesFields.refId) ?? '',
    name: row.requireString(BusinessesFields.name),
    description: row.optString(BusinessesFields.description) ?? '',
    status:
        BusinessStatusType.values.firstWhereOrNull(
          (e) => e.name == row.optString(BusinessesFields.status),
        ) ??
        BusinessStatusType.BUSINESS_STATUS_TYPE_UNSPECIFIED,
    ownerId: row.requireString(BusinessesFields.ownerId),
    logoLinkId: row.optString(BusinessesFields.logoLinkId) ?? '',
    countryCode: row.requireString(BusinessesFields.countryCode),
    currencyCode: row.requireString(BusinessesFields.currencyCode),
    externalLinksIds: row.optString(BusinessesFields.externalLinksIds) != null
        ? (jsonDecode(
                    row.optString(BusinessesFields.externalLinksIds).toString(),
                  )
                  as List)
              .map((e) => e.toString())
              .toList()
        : [],
    contactInfo: row.optString(BusinessesFields.contactInfo),
    address: row.optString(BusinessesFields.address),
    email: row.optString(BusinessesFields.email),
  );
}

/// Converts a [Store] to a [RawRow].
RawRow fromStoreToRaw(Store store) {
  return {
    StoresFields.refId: store.hasRefId() ? store.refId : null,
    StoresFields.name: store.name,
    StoresFields.description: store.hasDescription() ? store.description : null,
    StoresFields.logoLinkId: store.hasLogoLinkId() ? store.logoLinkId : null,
    StoresFields.externalLinksIds: store.hasExternalLinksIds()
        ? store.externalLinksIds
        : null,
    StoresFields.businessId: store.businessId,
    StoresFields.createdAt: store.hasCreatedAt()
        ? store.createdAt.toDateTime().toIso8601String()
        : null,
    StoresFields.updatedAt: store.hasUpdatedAt()
        ? store.updatedAt.toDateTime().toIso8601String()
        : null,
    StoresFields.phone: store.hasPhone() ? store.phone : null,
    StoresFields.address: store.hasAddress()
        ? jsonEncode(store.address.toProto3Json())
        : null,
    StoresFields.email: store.hasEmail() ? store.email : null,
    StoresFields.costingMethod: store.hasCostingMethod()
        ? store.costingMethod.name
        : null,
    StoresFields.tax: store.hasTax() ? store.tax : null,
    StoresFields.postalBox: store.hasPostalBox() ? store.postalBox : null,
    StoresFields.nui: store.hasNui() ? store.nui : null,
    StoresFields.taxPayerNumber: store.hasTaxPayerNumber()
        ? store.taxPayerNumber
        : null,
  };
}

/// Converts a [RawRow] to a [Store].
Store fromRowToStore(RawRow row) {
  return Store(
    refId: row.optString(StoresFields.refId) ?? '',
    name: row.requireString(StoresFields.name),
    description: row.optString(StoresFields.description),
    logoLinkId: row.optString(StoresFields.logoLinkId),
    externalLinksIds: row.optString(StoresFields.externalLinksIds),
    businessId: row.requireString(StoresFields.businessId),
    createdAt: Timestamp.fromDateTime(
      row.optDateTime(StoresFields.createdAt) ?? DateTime.now(),
    ),
    updatedAt: Timestamp.fromDateTime(
      row.optDateTime(StoresFields.updatedAt) ?? DateTime.now(),
    ),
    phone: row.optString(StoresFields.phone),
    address: Address.create()
      ..mergeFromProto3Json(
        jsonDecode(row.optString(StoresFields.address) ?? '{}'),
      ),
    email: row.optString(StoresFields.email),
    costingMethod: StoreCostingMethod.values.firstWhereOrNull(
      (e) => e.name == row.optString(StoresFields.costingMethod),
    ),
    tax: row.optDouble(StoresFields.tax),
    postalBox: row.optString(StoresFields.postalBox),
    nui: row.optString(StoresFields.nui),
    taxPayerNumber: row.optString(StoresFields.taxPayerNumber),
  );
}

/// Converts a [BusinessMember] to a [RawRow].
RawRow fromBusinessMembersToRaw(BusinessMember businessMember) {
  return {
    BusinessMembersFields.businessId: businessMember.businessId,
    BusinessMembersFields.userId: businessMember.userId,
    BusinessMembersFields.status: businessMember.hasStatus()
        ? businessMember.status.name
        : null,
    BusinessMembersFields.memberSince: businessMember.hasMemberSince()
        ? businessMember.memberSince.toDateTime().toIso8601String()
        : null,
  };
}

/// Converts a [RawRow] to a [BusinessMember].
BusinessMember fromRowToBusinessMembers(RawRow row) {
  return BusinessMember(
    userId: row.requireString(BusinessMembersFields.userId),
    businessId: row.requireString(BusinessMembersFields.businessId),
    memberSince: row.optDateTime(BusinessMembersFields.memberSince) == null
        ? null
        : Timestamp.fromDateTime(
            row.optDateTime(BusinessMembersFields.memberSince) ??
                DateTime.now(),
          ),
    status:
        BusinessMemberStatus.values.firstWhereOrNull(
          (e) => e.name == row.optString(BusinessMembersFields.status),
        ) ??
        BusinessMemberStatus.BUSINESS_MEMBER_STATUS_UNSPECIFIED,
  );
}

/// Converts a [StoreMember] to a [RawRow].
RawRow fromStoreMembersToRaw(StoreMember storeMember) {
  return {
    StoreMembersFields.storeId: storeMember.storeId,
    StoreMembersFields.userId: storeMember.userId,
    StoreMembersFields.permissions: storeMember.hasPermissions()
        ? jsonEncode(storeMember.permissions.toProto3Json())
        : null,
    StoreMembersFields.status: storeMember.hasStatus()
        ? storeMember.status.name
        : null,
    StoreMembersFields.memberSince: storeMember.hasMemberSince()
        ? storeMember.memberSince.toDateTime().toIso8601String()
        : null,
  };
}

/// Converts a [RawRow] to a [StoreMember].
StoreMember fromRowToStoreMembers(RawRow row) {
  return StoreMember(
    userId: row.requireString(StoreMembersFields.userId),
    storeId: row.requireString(StoreMembersFields.storeId),
    permissions: row.optString(StoreMembersFields.permissions) != null
        ? (StorePermissions.create()..mergeFromProto3Json(
            jsonDecode(
              row.optString(StoreMembersFields.permissions).toString(),
            ),
          ))
        : null,
    memberSince: row.optDateTime(StoreMembersFields.memberSince) == null
        ? null
        : Timestamp.fromDateTime(
            row.optDateTime(StoreMembersFields.memberSince) ?? DateTime.now(),
          ),
    status:
        StoreMemberStatus.values.firstWhereOrNull(
          (e) => e.name == row.optString(StoreMembersFields.status),
        ) ??
        StoreMemberStatus.STORE_MEMBER_STATUS_UNSPECIFIED,
  );
}

/// Converts a [InventoryLevel] to a [RawRow].
RawRow fromInventoryLevelToRaw(InventoryLevel level) {
  return {
    InventoryLevelsFields.storeProductId: level.storeProductId,
    InventoryLevelsFields.storeId: level.storeId,
    InventoryLevelsFields.quantityAvailable: level.quantityAvailable,
    InventoryLevelsFields.quantityCommitted: level.quantityCommitted,
    InventoryLevelsFields.quantityOnHand: level.quantityOnHand,
    InventoryLevelsFields.minThreshold: level.minThreshold,
    InventoryLevelsFields.lastUpdated: level.hasLastUpdated()
        ? level.lastUpdated.toDateTime().toIso8601String()
        : null,
    InventoryLevelsFields.lastUpdatedByUserId: level.lastUpdatedByUserId,
    InventoryLevelsFields.batches: level.batches.isNotEmpty
        ? jsonEncode(level.batches.map((b) => b.toProto3Json()).toList())
        : null,
  };
}

/// Converts a [RawRow] to a [InventoryLevel].
InventoryLevel fromRowToInventoryLevel(RawRow row) {
  return InventoryLevel(
    storeProductId: row.requireString(InventoryLevelsFields.storeProductId),
    storeId: row.requireString(InventoryLevelsFields.storeId),
    quantityAvailable: row.requireInt(InventoryLevelsFields.quantityAvailable),
    quantityCommitted: row.requireInt(InventoryLevelsFields.quantityCommitted),
    quantityOnHand: row.requireInt(InventoryLevelsFields.quantityOnHand),
    minThreshold: row.requireInt(InventoryLevelsFields.minThreshold),
    lastUpdatedByUserId: row.optString(
      InventoryLevelsFields.lastUpdatedByUserId,
    ),
    lastUpdated: row.optDateTime(InventoryLevelsFields.lastUpdated) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(InventoryLevelsFields.lastUpdated),
          ),
    batches: row.optString(InventoryLevelsFields.batches) != null
        ? (jsonDecode(row.optString(InventoryLevelsFields.batches) ?? '[]')
                  as List)
              .map((e) => Batch.create()..mergeFromProto3Json(e))
              .toList()
        : [],
  );
}

/// Converts a [StoreProduct] to a [RawRow].
RawRow fromStoreProductToRaw(StoreProduct product) {
  return {
    StoreProductsFields.refId: product.hasRefId() ? product.refId : null,
    StoreProductsFields.storeId: product.storeId,
    StoreProductsFields.globalProductId: product.globalProductId,
    StoreProductsFields.salePrice: product.salePrice,
    StoreProductsFields.imagesLinksIds: product.imagesLinksIds.isNotEmpty
        ? jsonEncode(product.imagesLinksIds)
        : null,
    StoreProductsFields.status: product.hasStatus()
        ? product.status.name
        : null,
    StoreProductsFields.expirationType: product.hasExpirationType()
        ? product.expirationType.name
        : null,
    StoreProductsFields.sku: product.sku,
    StoreProductsFields.reorderPoint: product.reorderPoint,
    StoreProductsFields.createdAt: product.hasCreatedAt()
        ? product.createdAt.toDateTime().toIso8601String()
        : null,
  };
}

/// Converts a [RawRow] to a [StoreProduct].
StoreProduct fromRowToStoreProduct(RawRow row) {
  return StoreProduct(
    refId: row.optString(StoreProductsFields.refId) ?? '',
    storeId: row.requireString(StoreProductsFields.storeId),
    globalProductId: row.requireString(StoreProductsFields.globalProductId),
    salePrice: row.requireInt(StoreProductsFields.salePrice),
    imagesLinksIds: row.optString(StoreProductsFields.imagesLinksIds) != null
        ? (jsonDecode(row.optString(StoreProductsFields.imagesLinksIds) ?? '[]')
                  as List)
              .map((e) => e.toString())
              .toList()
        : [],
    status: ProductStatus.values.firstWhereOrNull(
      (e) => e.name == row.optString(StoreProductsFields.status),
    ),
    expirationType: ExpirationType.values.firstWhereOrNull(
      (e) => e.name == row.optString(StoreProductsFields.expirationType),
    ),
    sku: row.optString(StoreProductsFields.sku),
    reorderPoint: row.optInt(StoreProductsFields.reorderPoint) ?? 0,
    createdAt: row.optDateTime(StoreProductsFields.createdAt) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(StoreProductsFields.createdAt),
          ),
  );
}

/// Converts a [GlobalProduct] to a [RawRow].
RawRow fromGlobalProductToRaw(GlobalProduct product) {
  return {
    GlobalProductsFields.refId: product.hasRefId() ? product.refId : null,
    GlobalProductsFields.name: product.hasName()
        ? jsonEncode(product.name.toProto3Json())
        : null,
    GlobalProductsFields.description: product.hasDescription()
        ? jsonEncode(product.description.toProto3Json())
        : null,
    GlobalProductsFields.barCodeValue: product.barCodeValue,
    GlobalProductsFields.imagesLinksIds: product.imagesLinksIds.isNotEmpty
        ? jsonEncode(product.imagesLinksIds)
        : null,
    GlobalProductsFields.categories: product.categories.isNotEmpty
        ? jsonEncode(product.categories.map((c) => c.refId).toList())
        : null,
    GlobalProductsFields.status: product.hasStatus()
        ? product.status.name
        : null,
  };
}

/// Converts a [RawRow] to a [GlobalProduct].
GlobalProduct fromRowToGlobalProduct(RawRow row) {
  return GlobalProduct(
    refId: row.optString(GlobalProductsFields.refId) ?? '',
    name: row.optString(GlobalProductsFields.name) != null
        ? (Internationalized.create()..mergeFromProto3Json(
            jsonDecode(row.optString(GlobalProductsFields.name) ?? '{}'),
          ))
        : null,
    description: row.optString(GlobalProductsFields.description) != null
        ? (Internationalized.create()..mergeFromProto3Json(
            jsonDecode(row.optString(GlobalProductsFields.description) ?? '{}'),
          ))
        : null,
    barCodeValue: row.optString(GlobalProductsFields.barCodeValue),
    imagesLinksIds: row.optString(GlobalProductsFields.imagesLinksIds) != null
        ? (jsonDecode(
                    row.optString(GlobalProductsFields.imagesLinksIds) ?? '[]',
                  )
                  as List)
              .map((e) => e.toString())
              .toList()
        : [],
    status: GlobalProductStatus.values.firstWhereOrNull(
      (e) => e.name == row.optString(GlobalProductsFields.status),
    ),
  );
}

/// Converts a [InventoryTransaction] to a [RawRow].
RawRow fromInventoryTransactionToRaw(InventoryTransaction transaction) {
  return {
    InventoryTransactionsFields.refId: transaction.hasRefId()
        ? transaction.refId
        : null,
    InventoryTransactionsFields.storeId: transaction.storeId,
    InventoryTransactionsFields.productId: transaction.productId,
    InventoryTransactionsFields.transactionType:
        transaction.hasTransactionType()
        ? transaction.transactionType.name
        : null,
    InventoryTransactionsFields.quantityChange: transaction.quantityChange,
    InventoryTransactionsFields.quantityBefore: transaction.quantityBefore,
    InventoryTransactionsFields.quantityAfter: transaction.quantityAfter,
    InventoryTransactionsFields.relatedDocumentType:
        transaction.hasRelatedDocumentType()
        ? transaction.relatedDocumentType
        : null,
    InventoryTransactionsFields.relatedDocumentId:
        transaction.hasRelatedDocumentId()
        ? transaction.relatedDocumentId
        : null,
    InventoryTransactionsFields.performedByUserId:
        transaction.performedByUserId,
    InventoryTransactionsFields.transactionTime:
        transaction.hasTransactionTime()
        ? transaction.transactionTime.toDateTime().toIso8601String()
        : null,
    InventoryTransactionsFields.notes: transaction.hasNotes()
        ? transaction.notes
        : null,
    InventoryTransactionsFields.batchId: transaction.hasBatchId()
        ? transaction.batchId
        : null,
    InventoryTransactionsFields.unitPrice: transaction.hasUnitPrice()
        ? transaction.unitPrice
        : null,
    InventoryTransactionsFields.totalAmount: transaction.hasTotalAmount()
        ? transaction.totalAmount
        : null,
    InventoryTransactionsFields.currency: transaction.hasCurrency()
        ? transaction.currency
        : null,
  };
}

/// Converts a [RawRow] to a [InventoryTransaction].
InventoryTransaction fromRowToInventoryTransaction(RawRow row) {
  return InventoryTransaction(
    refId: row.optString(InventoryTransactionsFields.refId) ?? '',
    storeId: row.requireString(InventoryTransactionsFields.storeId),
    productId: row.requireString(InventoryTransactionsFields.productId),
    transactionType: TransactionType.values.firstWhereOrNull(
      (e) =>
          e.name == row.optString(InventoryTransactionsFields.transactionType),
    ),
    quantityChange: row.requireInt(InventoryTransactionsFields.quantityChange),
    quantityBefore: row.requireInt(InventoryTransactionsFields.quantityBefore),
    quantityAfter: row.requireInt(InventoryTransactionsFields.quantityAfter),
    relatedDocumentType: row.optString(
      InventoryTransactionsFields.relatedDocumentType,
    ),
    relatedDocumentId: row.optString(
      InventoryTransactionsFields.relatedDocumentId,
    ),
    performedByUserId:
        row.optString(InventoryTransactionsFields.performedByUserId) ?? '',
    transactionTime:
        row.optDateTime(InventoryTransactionsFields.transactionTime) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(InventoryTransactionsFields.transactionTime),
          ),
    notes: row.optString(InventoryTransactionsFields.notes),
    batchId: row.optString(InventoryTransactionsFields.batchId),
    unitPrice: row.optDouble(InventoryTransactionsFields.unitPrice),
    totalAmount: row.optDouble(InventoryTransactionsFields.totalAmount),
    currency: row.optString(InventoryTransactionsFields.currency),
  );
}

/// Converts a [Supplier] to a [RawRow].
RawRow fromSupplierToRaw(Supplier supplier) {
  return {
    SuppliersFields.refId: supplier.hasRefId() ? supplier.refId : null,
    SuppliersFields.name: supplier.name,
    SuppliersFields.description: supplier.hasDescription()
        ? supplier.description
        : null,
    SuppliersFields.logoLinkId: supplier.hasLogoLinkId()
        ? supplier.logoLinkId
        : null,
    SuppliersFields.externalLinksIds: supplier.externalLinksIds.isNotEmpty
        ? jsonEncode(supplier.externalLinksIds)
        : null,
    SuppliersFields.contactPhone: supplier.hasContactPhone()
        ? supplier.contactPhone
        : null,
    SuppliersFields.contactEmail: supplier.hasContactEmail()
        ? supplier.contactEmail
        : null,
    SuppliersFields.contactAddress: supplier.hasContactAddress()
        ? supplier.contactAddress
        : null,
    SuppliersFields.status: supplier.hasStatus() ? supplier.status.name : null,
    SuppliersFields.storeIds: supplier.storeIds.isNotEmpty
        ? jsonEncode(supplier.storeIds)
        : null,
  };
}

/// Converts a [RawRow] to a [Supplier].
Supplier fromRowToSupplier(RawRow row) {
  return Supplier(
    refId: row.optString(SuppliersFields.refId) ?? '',
    name: row.requireString(SuppliersFields.name),
    description: row.optString(SuppliersFields.description),
    logoLinkId: row.optString(SuppliersFields.logoLinkId),
    externalLinksIds: row.optString(SuppliersFields.externalLinksIds) != null
        ? (jsonDecode(row.optString(SuppliersFields.externalLinksIds) ?? '[]')
                  as List)
              .map((e) => e.toString())
              .toList()
        : [],
    contactPhone: row.optString(SuppliersFields.contactPhone),
    contactEmail: row.optString(SuppliersFields.contactEmail),
    contactAddress: row.optString(SuppliersFields.contactAddress),
    status: SupplierStatus.values.firstWhereOrNull(
      (e) => e.name == row.optString(SuppliersFields.status),
    ),
    storeIds: row.optString(SuppliersFields.storeIds) != null
        ? (jsonDecode(row.optString(SuppliersFields.storeIds) ?? '[]') as List)
              .map((e) => e.toString())
              .toList()
        : [],
  );
}
