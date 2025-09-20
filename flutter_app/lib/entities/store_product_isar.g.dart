// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store_product_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetStoreProductIsarCollection on Isar {
  IsarCollection<StoreProductIsar> get storeProductIsars => this.collection();
}

const StoreProductIsarSchema = CollectionSchema(
  name: r'StoreProductIsar',
  id: -619533,
  properties: {
    r'createdAt': PropertySchema(
      id: 0,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'expirationDate': PropertySchema(
      id: 1,
      name: r'expirationDate',
      type: IsarType.dateTime,
    ),
    r'globalProductId': PropertySchema(
      id: 2,
      name: r'globalProductId',
      type: IsarType.string,
    ),
    r'imagesLinksIds': PropertySchema(
      id: 3,
      name: r'imagesLinksIds',
      type: IsarType.stringList,
    ),
    r'inboundDate': PropertySchema(
      id: 4,
      name: r'inboundDate',
      type: IsarType.dateTime,
    ),
    r'minStockThreshold': PropertySchema(
      id: 5,
      name: r'minStockThreshold',
      type: IsarType.long,
    ),
    r'price': PropertySchema(id: 6, name: r'price', type: IsarType.long),
    r'refId': PropertySchema(id: 7, name: r'refId', type: IsarType.string),
    r'stockQuantity': PropertySchema(
      id: 8,
      name: r'stockQuantity',
      type: IsarType.long,
    ),
    r'storeId': PropertySchema(id: 9, name: r'storeId', type: IsarType.string),
    r'supplierId': PropertySchema(
      id: 10,
      name: r'supplierId',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 11,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _storeProductIsarEstimateSize,
  serialize: _storeProductIsarSerialize,
  deserialize: _storeProductIsarDeserialize,
  deserializeProp: _storeProductIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _storeProductIsarGetId,
  getLinks: _storeProductIsarGetLinks,
  attach: _storeProductIsarAttach,
  version: '3.3.0-dev.2',
);

int _storeProductIsarEstimateSize(
  StoreProductIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.globalProductId.length * 3;
  {
    final list = object.imagesLinksIds;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount += value.length * 3;
        }
      }
    }
  }
  bytesCount += 3 + object.refId.length * 3;
  bytesCount += 3 + object.storeId.length * 3;
  {
    final value = object.supplierId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _storeProductIsarSerialize(
  StoreProductIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.createdAt);
  writer.writeDateTime(offsets[1], object.expirationDate);
  writer.writeString(offsets[2], object.globalProductId);
  writer.writeStringList(offsets[3], object.imagesLinksIds);
  writer.writeDateTime(offsets[4], object.inboundDate);
  writer.writeLong(offsets[5], object.minStockThreshold);
  writer.writeLong(offsets[6], object.price);
  writer.writeString(offsets[7], object.refId);
  writer.writeLong(offsets[8], object.stockQuantity);
  writer.writeString(offsets[9], object.storeId);
  writer.writeString(offsets[10], object.supplierId);
  writer.writeDateTime(offsets[11], object.updatedAt);
}

StoreProductIsar _storeProductIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = StoreProductIsar(
    createdAt: reader.readDateTimeOrNull(offsets[0]),
    expirationDate: reader.readDateTimeOrNull(offsets[1]),
    globalProductId: reader.readString(offsets[2]),
    imagesLinksIds: reader.readStringList(offsets[3]),
    inboundDate: reader.readDateTimeOrNull(offsets[4]),
    minStockThreshold: reader.readLong(offsets[5]),
    price: reader.readLongOrNull(offsets[6]),
    refId: reader.readString(offsets[7]),
    stockQuantity: reader.readLong(offsets[8]),
    storeId: reader.readString(offsets[9]),
    supplierId: reader.readStringOrNull(offsets[10]),
    updatedAt: reader.readDateTimeOrNull(offsets[11]),
  );
  object.id = id;
  return object;
}

P _storeProductIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readStringList(offset)) as P;
    case 4:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readString(offset)) as P;
    case 8:
      return (reader.readLong(offset)) as P;
    case 9:
      return (reader.readString(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    case 11:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _storeProductIsarGetId(StoreProductIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _storeProductIsarGetLinks(StoreProductIsar object) {
  return [];
}

void _storeProductIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  StoreProductIsar object,
) {
  object.id = id;
}

extension StoreProductIsarQueryWhereSort
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QWhere> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension StoreProductIsarQueryWhere
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QWhereClause> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhereClause> idEqualTo(
    Id id,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhereClause>
  idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerId,
          includeLower: includeLower,
          upper: upperId,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension StoreProductIsarQueryFilter
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QFilterCondition> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'createdAt'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'createdAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  createdAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'createdAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'expirationDate'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'expirationDate'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'expirationDate', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'expirationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'expirationDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  expirationDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'expirationDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'globalProductId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'globalProductId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'globalProductId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'globalProductId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  globalProductIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'globalProductId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  idGreaterThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  idLessThan(Id value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'id',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'id',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagesLinksIds'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagesLinksIds'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'imagesLinksIds',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'imagesLinksIds',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'imagesLinksIds',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagesLinksIds', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagesLinksIds', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', length, true, length, true);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, true, 0, true);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, true, length, include);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', length, include, 999999, true);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'imagesLinksIds',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'inboundDate'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'inboundDate'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'inboundDate', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'inboundDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'inboundDate',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  inboundDateBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'inboundDate',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  minStockThresholdEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'minStockThreshold', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  minStockThresholdGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'minStockThreshold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  minStockThresholdLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'minStockThreshold',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  minStockThresholdBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'minStockThreshold',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'price'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'price'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'price', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceGreaterThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'price',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceLessThan(int? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'price',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  priceBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'price',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'refId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'refId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'refId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'refId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  refIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'refId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  stockQuantityEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'stockQuantity', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  stockQuantityGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'stockQuantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  stockQuantityLessThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'stockQuantity',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  stockQuantityBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'stockQuantity',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'storeId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'storeId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'storeId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'storeId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  storeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'storeId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'supplierId'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'supplierId'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'supplierId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'supplierId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'supplierId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'supplierId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  supplierIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'supplierId', value: ''),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtLessThan(DateTime? value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterFilterCondition>
  updatedAtBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension StoreProductIsarQueryObject
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QFilterCondition> {}

extension StoreProductIsarQueryLinks
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QFilterCondition> {}

extension StoreProductIsarQuerySortBy
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QSortBy> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByGlobalProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalProductId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByGlobalProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalProductId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByInboundDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inboundDate', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByInboundDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inboundDate', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByMinStockThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockThreshold', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByMinStockThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockThreshold', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy> sortByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy> sortByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StoreProductIsarQuerySortThenBy
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QSortThenBy> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByExpirationDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'expirationDate', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByGlobalProductId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalProductId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByGlobalProductIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'globalProductId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByInboundDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inboundDate', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByInboundDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'inboundDate', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByMinStockThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockThreshold', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByMinStockThresholdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'minStockThreshold', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy> thenByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'price', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy> thenByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByStockQuantityDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stockQuantity', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenBySupplierId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenBySupplierIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'supplierId', Sort.desc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension StoreProductIsarQueryWhereDistinct
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct> {
  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByExpirationDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'expirationDate');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByGlobalProductId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'globalProductId',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByImagesLinksIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagesLinksIds');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByInboundDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'inboundDate');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByMinStockThreshold() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'minStockThreshold');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'price');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct> distinctByRefId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByStockQuantity() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stockQuantity');
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByStoreId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctBySupplierId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'supplierId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<StoreProductIsar, StoreProductIsar, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension StoreProductIsarQueryProperty
    on QueryBuilder<StoreProductIsar, StoreProductIsar, QQueryProperty> {
  QueryBuilder<StoreProductIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<StoreProductIsar, DateTime?, QQueryOperations>
  createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<StoreProductIsar, DateTime?, QQueryOperations>
  expirationDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'expirationDate');
    });
  }

  QueryBuilder<StoreProductIsar, String, QQueryOperations>
  globalProductIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'globalProductId');
    });
  }

  QueryBuilder<StoreProductIsar, List<String>?, QQueryOperations>
  imagesLinksIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagesLinksIds');
    });
  }

  QueryBuilder<StoreProductIsar, DateTime?, QQueryOperations>
  inboundDateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'inboundDate');
    });
  }

  QueryBuilder<StoreProductIsar, int, QQueryOperations>
  minStockThresholdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'minStockThreshold');
    });
  }

  QueryBuilder<StoreProductIsar, int?, QQueryOperations> priceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'price');
    });
  }

  QueryBuilder<StoreProductIsar, String, QQueryOperations> refIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refId');
    });
  }

  QueryBuilder<StoreProductIsar, int, QQueryOperations>
  stockQuantityProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stockQuantity');
    });
  }

  QueryBuilder<StoreProductIsar, String, QQueryOperations> storeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeId');
    });
  }

  QueryBuilder<StoreProductIsar, String?, QQueryOperations>
  supplierIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'supplierId');
    });
  }

  QueryBuilder<StoreProductIsar, DateTime?, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
