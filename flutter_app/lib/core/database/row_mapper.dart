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

/// Extract table prefix from a row.
Map<String, dynamic> extractTable(Map<String, dynamic> row, String prefix) {
  final Map<String, dynamic> result = {};
  row.forEach((key, value) {
    if (key.startsWith('${prefix}_')) {
      result[key.replaceFirst('${prefix}_', '')] = value;
    }
  });

  return result.isEmpty ? row : result;
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
    StoreProductsFields.imagesLinksIds: jsonEncode(product.imagesLinksIds),
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
    StoreProductsFields.openingStock: product.openingStock,
    StoreProductsFields.openingStockPerUnit: product.openingStockPerUnit,
    StoreProductsFields.defaultPurchasePrice: product.defaultPurchasePrice,
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
    openingStock: row.optInt(StoreProductsFields.openingStock) ?? 0,
    openingStockPerUnit: row.optDouble(StoreProductsFields.openingStockPerUnit),
    defaultPurchasePrice: row.optDouble(
      StoreProductsFields.defaultPurchasePrice,
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
    GlobalProductsFields.imagesLinksIds: jsonEncode(product.imagesLinksIds),
    GlobalProductsFields.categories: jsonEncode(
      product.categories.map((c) => c.toProto3Json()).toList(),
    ),
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
    categories: row.optString(GlobalProductsFields.categories) != null
        ? (jsonDecode(row.optString(GlobalProductsFields.categories) ?? '[]')
                  as List)
              .map((e) => Category.create()..mergeFromProto3Json(e))
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

/// Converts a [Category] to a [RawRow].
RawRow fromCategoryToRaw(Category category) {
  return {
    CategoriesFields.refId: category.hasRefId() ? category.refId : null,
    CategoriesFields.name: category.hasName()
        ? jsonEncode(category.name.toProto3Json())
        : null,
    CategoriesFields.businessId: category.businessId,
    CategoriesFields.parentCategoryId: category.hasParentCategoryId()
        ? category.parentCategoryId
        : null,
    CategoriesFields.status: category.hasStatus() ? category.status.name : null,
    CategoriesFields.type: category.hasType() ? category.type.name : null,
  };
}

/// Converts a [RawRow] to a [Category].
Category fromRowToCategory(RawRow row) {
  return Category(
    refId: row.optString(CategoriesFields.refId) ?? '',
    name: row.optString(CategoriesFields.name) != null
        ? (Internationalized.create()..mergeFromProto3Json(
            jsonDecode(row.optString(CategoriesFields.name) ?? '{}'),
          ))
        : null,
    businessId: row.requireString(CategoriesFields.businessId),
    parentCategoryId: row.optString(CategoriesFields.parentCategoryId),
    status: CategoryStatus.values.firstWhereOrNull(
      (e) => e.name == row.optString(CategoriesFields.status),
    ),
    type: CategoryType.values.firstWhereOrNull(
      (e) => e.name == row.optString(CategoriesFields.type),
    ),
  );
}

/// Converts a [CashReceipt] to a [RawRow].
RawRow fromCashReceiptToRaw(CashReceipt receipt) {
  return {
    CashReceiptsFields.refId: receipt.hasRefId() ? receipt.refId : null,
    CashReceiptsFields.cashierUserId: receipt.cashierUserId,
    CashReceiptsFields.customerId: receipt.hasCustomerId()
        ? receipt.customerId
        : null,
    CashReceiptsFields.storeId: receipt.storeId,
    CashReceiptsFields.items: receipt.items.isNotEmpty
        ? jsonEncode(receipt.items.map((i) => i.toProto3Json()).toList())
        : null,
    CashReceiptsFields.subtotal: receipt.subtotal,
    CashReceiptsFields.taxAmount: receipt.taxAmount,
    CashReceiptsFields.totalAmount: receipt.totalAmount,
    CashReceiptsFields.amountPaid: receipt.amountPaid,
    CashReceiptsFields.changeGiven: receipt.changeGiven,
    CashReceiptsFields.currency: receipt.currency,
    CashReceiptsFields.paymentIds: receipt.paymentIds.isNotEmpty
        ? jsonEncode(receipt.paymentIds)
        : null,
    CashReceiptsFields.transactionTime: receipt.hasTransactionTime()
        ? receipt.transactionTime.toDateTime().toIso8601String()
        : null,
    CashReceiptsFields.notes: receipt.hasNotes() ? receipt.notes : null,
    CashReceiptsFields.voucherIssuedCode: receipt.hasVoucherIssuedCode()
        ? receipt.voucherIssuedCode
        : null,
    CashReceiptsFields.owedToCustomer: receipt.hasOwedToCustomer()
        ? receipt.owedToCustomer
        : null,
  };
}

/// Converts a [RawRow] to a [CashReceipt].
CashReceipt fromRowToCashReceipt(RawRow row) {
  return CashReceipt(
    refId: row.optString(CashReceiptsFields.refId) ?? '',
    cashierUserId: row.requireString(CashReceiptsFields.cashierUserId),
    customerId: row.optString(CashReceiptsFields.customerId),
    storeId: row.requireString(CashReceiptsFields.storeId),
    items: row.optString(CashReceiptsFields.items) != null
        ? (jsonDecode(row.optString(CashReceiptsFields.items) ?? '[]') as List)
              .map((e) => InvoiceLineItem.create()..mergeFromProto3Json(e))
              .toList()
        : [],
    subtotal: row.requireDouble(CashReceiptsFields.subtotal),
    taxAmount: row.requireDouble(CashReceiptsFields.taxAmount),
    totalAmount: row.requireDouble(CashReceiptsFields.totalAmount),
    amountPaid: row.requireDouble(CashReceiptsFields.amountPaid),
    changeGiven: row.requireDouble(CashReceiptsFields.changeGiven),
    currency: row.requireString(CashReceiptsFields.currency),
    paymentIds: row.optString(CashReceiptsFields.paymentIds) != null
        ? (jsonDecode(row.optString(CashReceiptsFields.paymentIds) ?? '[]')
                  as List)
              .map((e) => e.toString())
              .toList()
        : [],
    transactionTime: row.optDateTime(CashReceiptsFields.transactionTime) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(CashReceiptsFields.transactionTime),
          ),
    notes: row.optString(CashReceiptsFields.notes),
    voucherIssuedCode: row.optString(CashReceiptsFields.voucherIssuedCode),
    owedToCustomer: row.optDouble(CashReceiptsFields.owedToCustomer),
  );
}

/// Converts a [PurchaseOrder] to a [RawRow].
RawRow fromPurchaseOrderToRaw(PurchaseOrder order) {
  return {
    PurchaseOrdersFields.refId: order.hasRefId() ? order.refId : null,
    PurchaseOrdersFields.supplierId: order.supplierId,
    PurchaseOrdersFields.storeId: order.storeId,
    PurchaseOrdersFields.status: order.hasStatus() ? order.status.name : null,
    PurchaseOrdersFields.totalAmount: order.totalAmount,
    PurchaseOrdersFields.currency: order.currency,
    PurchaseOrdersFields.createdByUserId: order.createdByUserId,
    PurchaseOrdersFields.createdAt: order.hasCreatedAt()
        ? order.createdAt.toDateTime().toIso8601String()
        : null,
    PurchaseOrdersFields.expectedDeliveryDate: order.hasExpectedDeliveryDate()
        ? order.expectedDeliveryDate.toDateTime().toIso8601String()
        : null,
    PurchaseOrdersFields.notes: order.hasNotes() ? order.notes : null,
    PurchaseOrdersFields.destinationAddress: order.hasDestinationAddress()
        ? order.destinationAddress
        : null,
    PurchaseOrdersFields.storeName: order.hasStoreName()
        ? order.storeName
        : null,
    PurchaseOrdersFields.supplierName: order.hasSupplierName()
        ? order.supplierName
        : null,
    PurchaseOrdersFields.orderDate: order.hasOrderDate()
        ? order.orderDate.toDateTime().toIso8601String()
        : null,
    PurchaseOrdersFields.paymentId: order.hasPaymentId()
        ? order.paymentId
        : null,
    PurchaseOrdersFields.subTotal: order.hasSubTotal() ? order.subTotal : null,
    PurchaseOrdersFields.taxTotal: order.hasTaxTotal() ? order.taxTotal : null,
  };
}

/// Converts a [RawRow] to a [PurchaseOrder].
PurchaseOrder fromRowToPurchaseOrder(RawRow row) {
  return PurchaseOrder(
    refId: row.optString(PurchaseOrdersFields.refId) ?? '',
    supplierId: row.requireString(PurchaseOrdersFields.supplierId),
    storeId: row.requireString(PurchaseOrdersFields.storeId),
    status: PurchaseOrderStatus.values.firstWhereOrNull(
      (e) => e.name == row.optString(PurchaseOrdersFields.status),
    ),
    totalAmount: row.optDouble(PurchaseOrdersFields.totalAmount) ?? 0.0,
    currency: row.requireString(PurchaseOrdersFields.currency),
    createdByUserId: row.requireString(PurchaseOrdersFields.createdByUserId),
    createdAt: row.optDateTime(PurchaseOrdersFields.createdAt) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(PurchaseOrdersFields.createdAt),
          ),
    expectedDeliveryDate:
        row.optDateTime(PurchaseOrdersFields.expectedDeliveryDate) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(PurchaseOrdersFields.expectedDeliveryDate),
          ),
    notes: row.optString(PurchaseOrdersFields.notes),
    destinationAddress: row.optString(PurchaseOrdersFields.destinationAddress),
    storeName: row.optString(PurchaseOrdersFields.storeName),
    supplierName: row.optString(PurchaseOrdersFields.supplierName),
    orderDate: row.optDateTime(PurchaseOrdersFields.orderDate) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(PurchaseOrdersFields.orderDate),
          ),
    paymentId: row.optString(PurchaseOrdersFields.paymentId),
    subTotal: row.optDouble(PurchaseOrdersFields.subTotal),
    taxTotal: row.optDouble(PurchaseOrdersFields.taxTotal),
  );
}

/// Converts a [ReceivingNote] to a [RawRow].
RawRow fromReceivingNoteToRaw(ReceivingNote receivingNote) {
  return {
    ReceivingNotesFields.refId: receivingNote.hasRefId()
        ? receivingNote.refId
        : null,
    ReceivingNotesFields.relatedPurchaseOrderId:
        receivingNote.hasRelatedPurchaseOrderId()
        ? receivingNote.relatedPurchaseOrderId
        : null,
    ReceivingNotesFields.supplierId: receivingNote.supplierId,
    ReceivingNotesFields.storeId: receivingNote.storeId,
    ReceivingNotesFields.receivedByUserId: receivingNote.hasReceivedByUserId()
        ? receivingNote.receivedByUserId
        : null,
    ReceivingNotesFields.receivedAt: receivingNote.hasReceivedAt()
        ? receivingNote.receivedAt.toDateTime().toIso8601String()
        : null,
    ReceivingNotesFields.notes: receivingNote.hasNotes()
        ? receivingNote.notes
        : null,
    ReceivingNotesFields.createdAt: receivingNote.hasCreatedAt()
        ? receivingNote.createdAt.toDateTime().toIso8601String()
        : null,
  };
}

/// Converts a [RawRow] to a [ReceivingNote].
ReceivingNote fromRowToReceivingNote(RawRow row) {
  return ReceivingNote(
    refId: row.optString(ReceivingNotesFields.refId) ?? '',
    relatedPurchaseOrderId: row.requireString(
      ReceivingNotesFields.relatedPurchaseOrderId,
    ),
    supplierId: row.requireString(ReceivingNotesFields.supplierId),
    storeId: row.requireString(ReceivingNotesFields.storeId),
    receivedByUserId: row.requireString(ReceivingNotesFields.receivedByUserId),
    receivedAt: row.optDateTime(ReceivingNotesFields.receivedAt) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(ReceivingNotesFields.receivedAt),
          ),
    notes: row.optString(ReceivingNotesFields.notes),
    createdAt: row.optDateTime(ReceivingNotesFields.createdAt) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(ReceivingNotesFields.createdAt),
          ),
  );
}

/// Converts a [ReceivingNoteLineItem] to a [RawRow].
RawRow fromReceivingNoteLineItemToRaw(
  ReceivingNoteLineItem lineItem,
  String receivingNoteId,
  int lineIndex,
) {
  return {
    ReceivingNoteLineItemsFields.receivingNoteId: receivingNoteId,
    ReceivingNoteLineItemsFields.storeId: lineItem.storeId,
    ReceivingNoteLineItemsFields.lineIndex: lineIndex,
    ReceivingNoteLineItemsFields.productId: lineItem.productId,
    ReceivingNoteLineItemsFields.quantityExpected: lineItem.quantityExpected,
    ReceivingNoteLineItemsFields.quantityReceived: lineItem.quantityReceived,
    ReceivingNoteLineItemsFields.quantityRejected:
        lineItem.hasQuantityRejected() ? lineItem.quantityRejected : null,
    ReceivingNoteLineItemsFields.rejectionReason: lineItem.hasRejectionReason()
        ? lineItem.rejectionReason
        : null,
    ReceivingNoteLineItemsFields.batchId: lineItem.hasBatchId()
        ? lineItem.batchId
        : null,
    ReceivingNoteLineItemsFields.expirationDate: lineItem.hasExpirationDate()
        ? lineItem.expirationDate.toDateTime().toIso8601String()
        : null,
    ReceivingNoteLineItemsFields.purchasePrice: lineItem.hasPurchasePrice()
        ? lineItem.purchasePrice
        : null,
  };
}

/// Converts a [RawRow] to a [ReceivingNoteLineItem].
ReceivingNoteLineItem fromRowToReceivingNoteLineItem(RawRow row) {
  final lineItem = ReceivingNoteLineItem(
    storeId: row.requireString(ReceivingNoteLineItemsFields.storeId),
    lineIndex: row.requireInt(ReceivingNoteLineItemsFields.lineIndex),
    productId: row.requireString(ReceivingNoteLineItemsFields.productId),
    quantityExpected: row.requireDouble(
      ReceivingNoteLineItemsFields.quantityExpected,
    ),
    quantityReceived: row.requireDouble(
      ReceivingNoteLineItemsFields.quantityReceived,
    ),
    quantityRejected:
        row.optDouble(ReceivingNoteLineItemsFields.quantityRejected) ?? 0.0,
    rejectionReason: row.optString(
      ReceivingNoteLineItemsFields.rejectionReason,
    ),
    batchId: row.optString(ReceivingNoteLineItemsFields.batchId),
    expirationDate:
        row.optDateTime(ReceivingNoteLineItemsFields.expirationDate) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(ReceivingNoteLineItemsFields.expirationDate),
          ),
    purchasePrice: row.optDouble(ReceivingNoteLineItemsFields.purchasePrice),
  );

  return lineItem;
}

/// Converts a [RawRow] to a [ResourceLink].
ResourceLink fromRowToResourceLink(RawRow row) {
  return ResourceLink(
    refId: row.optString(ResourceLinksFields.refId),
    iconUri: row.optString(ResourceLinksFields.iconUri),
    info: row.optString(ResourceLinksFields.info),
    label: row.optString(ResourceLinksFields.label),
    targetUri: row.optString(ResourceLinksFields.targetUri),
  );
}

/// Converts a [ResourceLink] to a [RawRow].
RawRow fromResourceLinkToRaw(ResourceLink link) {
  return {
    ResourceLinksFields.refId: link.hasRefId() ? link.refId : null,
    ResourceLinksFields.iconUri: link.hasIconUri() ? link.iconUri : null,
    ResourceLinksFields.label: link.hasLabel() ? link.label : null,
    ResourceLinksFields.info: link.hasInfo() ? link.info : null,
    ResourceLinksFields.targetUri: link.hasTargetUri() ? link.targetUri : null,
  };
}

/// Converts a [Bill] to a [RawRow].
RawRow fromBillToRaw(Bill bill) {
  return {
    BillsFields.refId: bill.hasRefId() ? bill.refId : null,
    BillsFields.relatedPurchaseOrderId: bill.hasRelatedPurchaseOrderId()
        ? bill.relatedPurchaseOrderId
        : null,
    BillsFields.supplierId: bill.supplierId,
    BillsFields.storeId: bill.storeId,
    BillsFields.status: bill.hasStatus() ? bill.status.name : null,
    BillsFields.paymentId: bill.hasPaymentId() ? bill.paymentId : null,
    BillsFields.billDate: bill.hasBillDate()
        ? bill.billDate.toDateTime().toIso8601String()
        : null,
    BillsFields.dueDate: bill.hasDueDate()
        ? bill.dueDate.toDateTime().toIso8601String()
        : null,
    BillsFields.subTotal: bill.subTotal,
    BillsFields.taxTotal: bill.taxTotal,
    BillsFields.totalAmount: bill.totalAmount,
    BillsFields.balanceDue: bill.balanceDue,
    BillsFields.currency: bill.currency,
    BillsFields.notes: bill.hasNotes() ? bill.notes : null,
    BillsFields.createdAt: bill.hasCreatedAt()
        ? bill.createdAt.toDateTime().toIso8601String()
        : null,
  };
}

/// Converts a [RawRow] to a [Bill].
Bill fromRowToBill(RawRow row) {
  return Bill(
    refId: row.optString(BillsFields.refId) ?? '',
    relatedPurchaseOrderId: row.optString(BillsFields.relatedPurchaseOrderId),
    supplierId: row.requireString(BillsFields.supplierId),
    storeId: row.requireString(BillsFields.storeId),
    status:
        BillStatus.values.firstWhereOrNull(
          (e) => e.name == row.optString(BillsFields.status),
        ) ??
        BillStatus.BILL_STATUS_UNSPECIFIED,
    paymentId: row.optString(BillsFields.paymentId),
    billDate: row.optDateTime(BillsFields.billDate) == null
        ? null
        : Timestamp.fromDateTime(row.requireDateTime(BillsFields.billDate)),
    dueDate: row.optDateTime(BillsFields.dueDate) == null
        ? null
        : Timestamp.fromDateTime(row.requireDateTime(BillsFields.dueDate)),
    subTotal: row.optDouble(BillsFields.subTotal) ?? 0.0,
    taxTotal: row.optDouble(BillsFields.taxTotal) ?? 0.0,
    totalAmount: row.optDouble(BillsFields.totalAmount) ?? 0.0,
    balanceDue: row.optDouble(BillsFields.balanceDue) ?? 0.0,
    currency: row.requireString(BillsFields.currency),
    notes: row.optString(BillsFields.notes),
    createdAt: row.optDateTime(BillsFields.createdAt) == null
        ? null
        : Timestamp.fromDateTime(row.requireDateTime(BillsFields.createdAt)),
  );
}

/// Converts a [BillLineItem] to a [RawRow].
RawRow fromBillLineItemToRaw(BillLineItem item, String billId) {
  return {
    BillLineItemsFields.billId: billId,
    BillLineItemsFields.productId: item.productId,
    BillLineItemsFields.description: item.hasDescription()
        ? item.description
        : null,
    BillLineItemsFields.quantity: item.quantity,
    BillLineItemsFields.unitPrice: item.unitPrice,
    BillLineItemsFields.taxAmount: item.taxAmount,
    BillLineItemsFields.total: item.total,
  };
}

/// Converts a [RawRow] to a [BillLineItem].
BillLineItem fromRowToBillLineItem(RawRow row) {
  return BillLineItem(
    productId: row.requireString(BillLineItemsFields.productId),
    description: row.optString(BillLineItemsFields.description),
    quantity: row.requireInt(BillLineItemsFields.quantity),
    unitPrice: row.requireDouble(BillLineItemsFields.unitPrice),
    taxAmount: row.optDouble(BillLineItemsFields.taxAmount) ?? 0.0,
    total: row.requireDouble(BillLineItemsFields.total),
  );
}
