import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:protobuf/protobuf.dart' as $pb;
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

class JsonMapper {
  /// For unique proto object (ex: Address, ResourceLink)
  static T? toMessage<T extends $pb.GeneratedMessage>(
    String? jsonStr,
    T Function() creator,
  ) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return null;
    }
    try {
      final decoded = jsonDecode(jsonStr);

      return creator()..mergeFromProto3Json(decoded);
    } catch (e) {
      print('Mapping Error (Message): $e');

      return null;
    }
  }

  /// For object list Protobuf (ex: List<ConnectedAccount>)
  static List<T> toMessageList<T extends $pb.GeneratedMessage>(
    String? jsonStr,
    T Function() creator,
  ) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is List) {
        return decoded.map((e) => creator()..mergeFromProto3Json(e)).toList();
      }
    } catch (e) {
      print('Mapping Error (MessageList): $e');
    }

    return [];
  }

  /// For simple list types (ex: List<String>, List<int>)
  static List<T> toPrimitiveList<T>(String? jsonStr) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is List) {
        return decoded.cast<T>();
      }
    } catch (e) {
      print('Mapping Error (PrimitiveList): $e');
    }

    return [];
  }

  /// For single enums (ex: AccountStatusType)
  static T? toEnum<T extends $pb.ProtobufEnum>(String? value, List<T> values) {
    if (value == null || value.isEmpty) {
      return null;
    }

    return values.firstWhereOrNull((e) => e.name == value);
  }

  /// For enum lists (ex: List<AuthActionType> stored as name strings)
  static List<T> toEnumList<T extends $pb.ProtobufEnum>(
    String? jsonStr,
    List<T> values,
  ) {
    if (jsonStr == null || jsonStr.isEmpty) {
      return [];
    }
    try {
      final decoded = jsonDecode(jsonStr);
      if (decoded is List) {
        return decoded
            .map((e) => values.firstWhereOrNull((v) => v.name == e.toString()))
            .whereType<T>()
            .toList();
      }
    } catch (e) {
      print('Mapping Error (EnumList): $e');
    }

    return [];
  }
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
    accountStatus: JsonMapper.toEnum<AccountStatusType>(
      row.optString(UsersFields.accountStatus),
      AccountStatusType.values,
    ),
    connectedAccounts: JsonMapper.toMessageList<ConnectedAccount>(
      row.optString(UsersFields.connectedAccounts),
      ConnectedAccount.create,
    ),
    requiredActions: JsonMapper.toEnumList<AuthActionType>(
      row.optString(UsersFields.requiredActions),
      AuthActionType.values,
    ),
    profileLink: JsonMapper.toMessage<ResourceLink>(
      row.optString(UsersFields.profileLinkId),
      ResourceLink.create,
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
    UsersFields.accountStatus: user.hasAccountStatus()
        ? user.accountStatus.value
        : null,
    UsersFields.connectedAccounts: jsonEncode(
      user.connectedAccounts.map((a) => a.toProto3Json()).toList(),
    ),
    UsersFields.requiredActions: jsonEncode(
      user.requiredActions.map((a) => a.value).toList(),
    ),
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
        JsonMapper.toEnum<BusinessStatusType>(
          row.optString(BusinessesFields.status),
          BusinessStatusType.values,
        ) ??
        BusinessStatusType.BUSINESS_STATUS_TYPE_UNSPECIFIED,
    ownerId: row.requireString(BusinessesFields.ownerId),
    logoLinkId: row.optString(BusinessesFields.logoLinkId) ?? '',
    countryCode: row.requireString(BusinessesFields.countryCode),
    currencyCode: row.requireString(BusinessesFields.currencyCode),
    externalLinksIds: JsonMapper.toPrimitiveList<String>(
      row.optString(BusinessesFields.externalLinksIds),
    ),
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
    address: JsonMapper.toMessage<Address>(
      row.optString(StoresFields.address),
      Address.create,
    ),
    email: row.optString(StoresFields.email),
    costingMethod: JsonMapper.toEnum<StoreCostingMethod>(
      row.optString(StoresFields.costingMethod),
      StoreCostingMethod.values,
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
        JsonMapper.toEnum<BusinessMemberStatus>(
          row.optString(BusinessMembersFields.status),
          BusinessMemberStatus.values,
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
    permissions: JsonMapper.toMessage<StorePermissions>(
      row.optString(StoreMembersFields.permissions),
      StorePermissions.create,
    ),
    memberSince: row.optDateTime(StoreMembersFields.memberSince) == null
        ? null
        : Timestamp.fromDateTime(
            row.optDateTime(StoreMembersFields.memberSince) ?? DateTime.now(),
          ),
    status:
        JsonMapper.toEnum<StoreMemberStatus>(
          row.optString(StoreMembersFields.status),
          StoreMemberStatus.values,
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
    batches: JsonMapper.toMessageList<Batch>(
      row.optString(InventoryLevelsFields.batches),
      Batch.create,
    ),
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
    imagesLinksIds: JsonMapper.toPrimitiveList<String>(
      row.optString(StoreProductsFields.imagesLinksIds),
    ),
    status: JsonMapper.toEnum<ProductStatus>(
      row.optString(StoreProductsFields.status),
      ProductStatus.values,
    ),
    expirationType: JsonMapper.toEnum<ExpirationType>(
      row.optString(StoreProductsFields.expirationType),
      ExpirationType.values,
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
    name: JsonMapper.toMessage<Internationalized>(
      row.optString(GlobalProductsFields.name),
      Internationalized.create,
    ),
    description: JsonMapper.toMessage<Internationalized>(
      row.optString(GlobalProductsFields.description),
      Internationalized.create,
    ),
    barCodeValue: row.optString(GlobalProductsFields.barCodeValue),
    imagesLinksIds: JsonMapper.toPrimitiveList<String>(
      row.optString(GlobalProductsFields.imagesLinksIds),
    ),
    categories: JsonMapper.toMessageList<Category>(
      row.optString(GlobalProductsFields.categories),
      Category.create,
    ),
    status: JsonMapper.toEnum<GlobalProductStatus>(
      row.optString(GlobalProductsFields.status),
      GlobalProductStatus.values,
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
    transactionType: JsonMapper.toEnum<TransactionType>(
      row.optString(InventoryTransactionsFields.transactionType),
      TransactionType.values,
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
    externalLinksIds: JsonMapper.toPrimitiveList<String>(
      row.optString(SuppliersFields.externalLinksIds),
    ),
    contactPhone: row.optString(SuppliersFields.contactPhone),
    contactEmail: row.optString(SuppliersFields.contactEmail),
    contactAddress: row.optString(SuppliersFields.contactAddress),
    status: JsonMapper.toEnum<SupplierStatus>(
      row.optString(SuppliersFields.status),
      SupplierStatus.values,
    ),
    storeIds: JsonMapper.toPrimitiveList<String>(
      row.optString(SuppliersFields.storeIds),
    ),
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
    name: JsonMapper.toMessage<Internationalized>(
      row.optString(CategoriesFields.name),
      Internationalized.create,
    ),
    businessId: row.requireString(CategoriesFields.businessId),
    parentCategoryId: row.optString(CategoriesFields.parentCategoryId),
    status: JsonMapper.toEnum<CategoryStatus>(
      row.optString(CategoriesFields.status),
      CategoryStatus.values,
    ),
    type: JsonMapper.toEnum<CategoryType>(
      row.optString(CategoriesFields.type),
      CategoryType.values,
    ),
  );
}

/// Converts a [CashReceipt] to a [RawRow].
RawRow fromCashReceiptToRaw(CashReceipt receipt) {
  return {
    CashReceiptsFields.refId: receipt.hasRefId() ? receipt.refId : null,
    CashReceiptsFields.cashierUserId: receipt.cashierUserId,
    CashReceiptsFields.customer: receipt.hasCustomer()
        ? receipt.customer
        : null,
    CashReceiptsFields.storeId: receipt.storeId,
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
    CashReceiptsFields.status: receipt.hasStatus() ? receipt.status.name : null,
  };
}

/// Converts a [RawRow] to a [CashReceipt].
CashReceipt fromRowToCashReceipt(RawRow row) {
  return CashReceipt(
    refId: row.optString(CashReceiptsFields.refId) ?? '',
    cashierUserId: row.requireString(CashReceiptsFields.cashierUserId),
    customer: row.optString(CashReceiptsFields.customer),
    storeId: row.requireString(CashReceiptsFields.storeId),
    subtotal: row.requireDouble(CashReceiptsFields.subtotal),
    taxAmount: row.requireDouble(CashReceiptsFields.taxAmount),
    totalAmount: row.requireDouble(CashReceiptsFields.totalAmount),
    amountPaid: row.requireDouble(CashReceiptsFields.amountPaid),
    changeGiven: row.requireDouble(CashReceiptsFields.changeGiven),
    currency: row.requireString(CashReceiptsFields.currency),
    paymentIds: JsonMapper.toPrimitiveList<String>(
      row.optString(CashReceiptsFields.paymentIds),
    ),
    transactionTime: row.optDateTime(CashReceiptsFields.transactionTime) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(CashReceiptsFields.transactionTime),
          ),
    notes: row.optString(CashReceiptsFields.notes),
    voucherIssuedCode: row.optString(CashReceiptsFields.voucherIssuedCode),
    owedToCustomer: row.optDouble(CashReceiptsFields.owedToCustomer),
    status: JsonMapper.toEnum<CashReceiptStatus>(
      row.optString(CashReceiptsFields.status),
      CashReceiptStatus.values,
    ),
  );
}

/// Converts a [InvoiceLineItem] to a [RawRow] for cash_receipt_items.
RawRow fromCashReceiptItemToRaw(
  InvoiceLineItem item,
  String receiptId,
  String storeId,
) {
  return {
    CashReceiptItemsFields.receiptId: receiptId,
    CashReceiptItemsFields.storeId: storeId,
    CashReceiptItemsFields.productId: item.productId,
    CashReceiptItemsFields.quantity: item.quantity,
    CashReceiptItemsFields.unitPrice: item.unitPrice,
    CashReceiptItemsFields.subtotal: item.subtotal,
    CashReceiptItemsFields.taxRate: item.taxRate,
    CashReceiptItemsFields.taxAmount: item.taxAmount,
    CashReceiptItemsFields.total: item.total,
    CashReceiptItemsFields.batchId: item.hasBatchId() ? item.batchId : null,
    CashReceiptItemsFields.productName: item.hasProductName()
        ? jsonEncode(item.productName.toProto3Json())
        : null,
  };
}

/// Converts a [RawRow] to a [InvoiceLineItem].
InvoiceLineItem fromRowToCashReceiptItem(RawRow row) {
  return InvoiceLineItem(
    productId: row.requireString(CashReceiptItemsFields.productId),
    quantity: row.requireInt(CashReceiptItemsFields.quantity),
    unitPrice: row.requireDouble(CashReceiptItemsFields.unitPrice),
    subtotal: row.requireDouble(CashReceiptItemsFields.subtotal),
    taxRate: row.optDouble(CashReceiptItemsFields.taxRate) ?? 0.0,
    taxAmount: row.optDouble(CashReceiptItemsFields.taxAmount) ?? 0.0,
    total: row.requireDouble(CashReceiptItemsFields.total),
    batchId: row.optString(CashReceiptItemsFields.batchId),
    productName: JsonMapper.toMessage<Internationalized>(
      row.optString(CashReceiptItemsFields.productName),
      Internationalized.create,
    ),
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
    status: JsonMapper.toEnum<PurchaseOrderStatus>(
      row.optString(PurchaseOrdersFields.status),
      PurchaseOrderStatus.values,
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
) {
  return {
    ReceivingNoteLineItemsFields.receivingNoteId: receivingNoteId,
    ReceivingNoteLineItemsFields.storeId: lineItem.storeId,
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
  return ReceivingNoteLineItem(
    storeId: row.requireString(ReceivingNoteLineItemsFields.storeId),
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
    BillsFields.paymentIds: bill.paymentIds.isNotEmpty
        ? jsonEncode(bill.paymentIds)
        : null,
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
        JsonMapper.toEnum<BillStatus>(
          row.optString(BillsFields.status),
          BillStatus.values,
        ) ??
        BillStatus.BILL_STATUS_UNSPECIFIED,
    paymentIds: JsonMapper.toPrimitiveList<String>(
      row.optString(BillsFields.paymentIds),
    ),
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
RawRow fromBillLineItemToRaw(BillLineItem item, String billId, String storeId) {
  return {
    BillLineItemsFields.billId: billId,
    BillLineItemsFields.storeId: storeId,
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

/// Converts a [RawRow] to a [PurchaseOrderLineItems].
PurchaseOrderLineItems fromRowToPurchaseOrderItems(RawRow row) {
  return PurchaseOrderLineItems(
    storeId: row.requireString(PurchaseOrderItemsFields.storeId),
    productId: row.requireString(PurchaseOrderItemsFields.productId),
    quantityOrdered: row.requireInt(PurchaseOrderItemsFields.quantityOrdered),
    productName: JsonMapper.toMessage<Internationalized>(
      row.optString(PurchaseOrderItemsFields.productName),
      Internationalized.create,
    ),
    unitPrice: row.optDouble(PurchaseOrderItemsFields.unitPrice) ?? 0.0,
    total: row.optDouble(PurchaseOrderItemsFields.total) ?? 0.0,
    batchId: row.optString(PurchaseOrderItemsFields.batchId),
    quantityReceived:
        row.optInt(PurchaseOrderItemsFields.quantityReceived) ?? 0,
    taxAmount: row.optDouble(PurchaseOrderItemsFields.taxAmount) ?? 0.0,
  );
}

/// Converts a [PurchaseOrderLineItems] to a [RawRow].
RawRow fromPurchaseOrderItemsToRow(
  PurchaseOrderLineItems item,
  String purchaseOrderId,
) {
  return {
    PurchaseOrderItemsFields.purchaseOrderId: purchaseOrderId,
    PurchaseOrderItemsFields.storeId: item.storeId,
    PurchaseOrderItemsFields.productId: item.productId,
    PurchaseOrderItemsFields.quantityOrdered: item.quantityOrdered,
    PurchaseOrderItemsFields.productName: jsonEncode(
      item.productName.toProto3Json(),
    ),
    PurchaseOrderItemsFields.unitPrice: item.unitPrice,
    PurchaseOrderItemsFields.total: item.total,
    PurchaseOrderItemsFields.batchId: item.batchId,
    PurchaseOrderItemsFields.quantityReceived: item.quantityReceived,
    PurchaseOrderItemsFields.taxAmount: item.taxAmount,
  };
}

/// Converts a [Payment] to a [RawRow].
RawRow fromPaymentToRaw(Payment payment) {
  return {
    PaymentsFields.refId: payment.hasRefId() ? payment.refId : null,
    PaymentsFields.payerId: payment.hasPayerId() ? payment.payerId : null,
    PaymentsFields.receiverRef: payment.hasReceiverRef()
        ? payment.receiverRef
        : null,
    PaymentsFields.amount: payment.hasAmount() ? payment.amount : null,
    PaymentsFields.currency: payment.hasCurrency() ? payment.currency : null,
    PaymentsFields.warehouseId: payment.hasWarehouseId()
        ? payment.warehouseId
        : null,
    PaymentsFields.paymentMethod: payment.hasPaymentMethod()
        ? payment.paymentMethod.name
        : null,
    PaymentsFields.status: payment.hasStatus() ? payment.status.name : null,
    PaymentsFields.paymentDate: payment.hasPaymentDate()
        ? payment.paymentDate.toDateTime().toIso8601String()
        : null,
    PaymentsFields.referenceNumber: payment.hasReferenceNumber()
        ? payment.referenceNumber
        : null,
    PaymentsFields.createdByUserId: payment.hasCreatedByUserId()
        ? payment.createdByUserId
        : null,
    PaymentsFields.notes: payment.hasNotes() ? payment.notes : null,
    PaymentsFields.relatedDocs: jsonEncode(
      payment.relatedDocs.map((c) => c.toProto3Json()).toList(),
    ),
  };
}

/// Converts a [RawRow] to a [Payment].
Payment fromRowToPayment(RawRow row) {
  return Payment(
    refId: row.optString(PaymentsFields.refId) ?? '',
    payerId: row.optString(PaymentsFields.payerId),
    receiverRef: row.optString(PaymentsFields.receiverRef),
    amount: row.optDouble(PaymentsFields.amount) ?? 0.0,
    currency: row.optString(PaymentsFields.currency) ?? 'XAF',
    warehouseId: row.optString(PaymentsFields.warehouseId),
    paymentMethod:
        JsonMapper.toEnum<PaymentMethod>(
          row.optString(PaymentsFields.paymentMethod),
          PaymentMethod.values,
        ) ??
        PaymentMethod.PAYMENT_METHOD_UNSPECIFIED,
    status:
        JsonMapper.toEnum<PaymentStatus>(
          row.optString(PaymentsFields.status),
          PaymentStatus.values,
        ) ??
        PaymentStatus.PAYMENT_STATUS_UNSPECIFIED,
    paymentDate: row.optDateTime(PaymentsFields.paymentDate) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(PaymentsFields.paymentDate),
          ),
    referenceNumber: row.optString(PaymentsFields.referenceNumber),
    createdByUserId: row.optString(PaymentsFields.createdByUserId),
    notes: row.optString(PaymentsFields.notes),
    relatedDocs: JsonMapper.toMessageList<PaymentRelatedDoc>(
      row.optString(PaymentsFields.relatedDocs),
      PaymentRelatedDoc.create,
    ),
  );
}

/// Converts a [GiftVoucher] to a [RawRow].
RawRow fromGiftVoucherToRaw(GiftVoucher voucher) {
  return {
    GiftVouchersFields.refId: voucher.hasRefId() ? voucher.refId : null,
    GiftVouchersFields.voucherCode: voucher.hasVoucherCode()
        ? voucher.voucherCode
        : null,
    GiftVouchersFields.initialValue: voucher.hasInitialValue()
        ? voucher.initialValue
        : null,
    GiftVouchersFields.remainingValue: voucher.hasRemainingValue()
        ? voucher.remainingValue
        : null,
    GiftVouchersFields.currency: voucher.hasCurrency()
        ? voucher.currency
        : null,
    GiftVouchersFields.issuedToCustomer: voucher.hasIssuedToCustomer()
        ? voucher.issuedToCustomer
        : null,
    GiftVouchersFields.issuedByUserId: voucher.hasIssuedByUserId()
        ? voucher.issuedByUserId
        : null,
    GiftVouchersFields.warehouseId: voucher.hasWarehouseId()
        ? voucher.warehouseId
        : null,
    GiftVouchersFields.status: voucher.hasStatus() ? voucher.status.name : null,
    GiftVouchersFields.issuedAt: voucher.hasIssuedAt()
        ? voucher.issuedAt.toDateTime().toIso8601String()
        : null,
    GiftVouchersFields.validUntil: voucher.hasValidUntil()
        ? voucher.validUntil.toDateTime().toIso8601String()
        : null,
    GiftVouchersFields.notes: voucher.hasNotes() ? voucher.notes : null,
  };
}

/// Converts a [RawRow] to a [GiftVoucher].
GiftVoucher fromRowToGiftVoucher(RawRow row) {
  return GiftVoucher(
    refId: row.optString(GiftVouchersFields.refId) ?? '',
    voucherCode: row.optString(GiftVouchersFields.voucherCode) ?? '',
    initialValue: row.optDouble(GiftVouchersFields.initialValue) ?? 0.0,
    remainingValue: row.optDouble(GiftVouchersFields.remainingValue) ?? 0.0,
    currency: row.optString(GiftVouchersFields.currency) ?? 'XAF',
    issuedToCustomer: row.optString(GiftVouchersFields.issuedToCustomer),
    issuedByUserId: row.optString(GiftVouchersFields.issuedByUserId),
    warehouseId: row.optString(GiftVouchersFields.warehouseId),
    status: JsonMapper.toEnum<VoucherStatus>(
      row.optString(GiftVouchersFields.status),
      VoucherStatus.values,
    ),
    issuedAt: row.optDateTime(GiftVouchersFields.issuedAt) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(GiftVouchersFields.issuedAt),
          ),
    validUntil: row.optDateTime(GiftVouchersFields.validUntil) == null
        ? null
        : Timestamp.fromDateTime(
            row.requireDateTime(GiftVouchersFields.validUntil),
          ),
    notes: row.optString(GiftVouchersFields.notes),
  );
}
