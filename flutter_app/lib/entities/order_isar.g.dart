// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderIsarCollection on Isar {
  IsarCollection<OrderIsar> get orderIsars => this.collection();
}

const OrderIsarSchema = CollectionSchema(
  name: r'OrderIsar',
  id: 61872048,
  properties: {
    r'canBeModified': PropertySchema(
      id: 0,
      name: r'canBeModified',
      type: IsarType.bool,
    ),
    r'createdAt': PropertySchema(
      id: 1,
      name: r'createdAt',
      type: IsarType.dateTime,
    ),
    r'fromId': PropertySchema(id: 2, name: r'fromId', type: IsarType.string),
    r'initiatedBy': PropertySchema(
      id: 3,
      name: r'initiatedBy',
      type: IsarType.string,
    ),
    r'isCancelled': PropertySchema(
      id: 4,
      name: r'isCancelled',
      type: IsarType.bool,
    ),
    r'isClientOrder': PropertySchema(
      id: 5,
      name: r'isClientOrder',
      type: IsarType.string,
    ),
    r'isCompleted': PropertySchema(
      id: 6,
      name: r'isCompleted',
      type: IsarType.bool,
    ),
    r'itemCount': PropertySchema(
      id: 7,
      name: r'itemCount',
      type: IsarType.long,
    ),
    r'refId': PropertySchema(id: 8, name: r'refId', type: IsarType.string),
    r'status': PropertySchema(id: 9, name: r'status', type: IsarType.long),
    r'statusDescription': PropertySchema(
      id: 10,
      name: r'statusDescription',
      type: IsarType.string,
    ),
    r'storeId': PropertySchema(id: 11, name: r'storeId', type: IsarType.string),
    r'totalPrice': PropertySchema(
      id: 12,
      name: r'totalPrice',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 13,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _orderIsarEstimateSize,
  serialize: _orderIsarSerialize,
  deserialize: _orderIsarDeserialize,
  deserializeProp: _orderIsarDeserializeProp,
  idName: r'id',
  indexes: {
    r'refId': IndexSchema(
      id: -5849034591004344426,
      name: r'refId',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'refId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
    r'status': IndexSchema(
      id: -107785170620420283,
      name: r'status',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'status',
          type: IndexType.value,
          caseSensitive: false,
        ),
      ],
    ),
    r'storeId': IndexSchema(
      id: 2730892149058446507,
      name: r'storeId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'storeId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {
    r'orderItems': LinkSchema(
      id: 7880647187820868609,
      name: r'orderItems',
      target: r'OrderItemIsar',
      single: false,
    ),
    r'statusHistory': LinkSchema(
      id: 3626030309325088006,
      name: r'statusHistory',
      target: r'OrderStatusHistoryIsar',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _orderIsarGetId,
  getLinks: _orderIsarGetLinks,
  attach: _orderIsarAttach,
  version: '3.3.0-dev.2',
);

int _orderIsarEstimateSize(
  OrderIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.fromId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  bytesCount += 3 + object.initiatedBy.length * 3;
  bytesCount += 3 + object.isClientOrder.length * 3;
  bytesCount += 3 + object.refId.length * 3;
  bytesCount += 3 + object.statusDescription.length * 3;
  bytesCount += 3 + object.storeId.length * 3;
  return bytesCount;
}

void _orderIsarSerialize(
  OrderIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.canBeModified);
  writer.writeDateTime(offsets[1], object.createdAt);
  writer.writeString(offsets[2], object.fromId);
  writer.writeString(offsets[3], object.initiatedBy);
  writer.writeBool(offsets[4], object.isCancelled);
  writer.writeString(offsets[5], object.isClientOrder);
  writer.writeBool(offsets[6], object.isCompleted);
  writer.writeLong(offsets[7], object.itemCount);
  writer.writeString(offsets[8], object.refId);
  writer.writeLong(offsets[9], object.status);
  writer.writeString(offsets[10], object.statusDescription);
  writer.writeString(offsets[11], object.storeId);
  writer.writeLong(offsets[12], object.totalPrice);
  writer.writeDateTime(offsets[13], object.updatedAt);
}

OrderIsar _orderIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderIsar(
    createdAt: reader.readDateTime(offsets[1]),
    fromId: reader.readStringOrNull(offsets[2]),
    initiatedBy: reader.readString(offsets[3]),
    isClientOrder: reader.readString(offsets[5]),
    refId: reader.readString(offsets[8]),
    status: reader.readLong(offsets[9]),
    storeId: reader.readString(offsets[11]),
    totalPrice: reader.readLong(offsets[12]),
    updatedAt: reader.readDateTimeOrNull(offsets[13]),
  );
  object.id = id;
  return object;
}

P _orderIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readBool(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    case 6:
      return (reader.readBool(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readString(offset)) as P;
    case 9:
      return (reader.readLong(offset)) as P;
    case 10:
      return (reader.readString(offset)) as P;
    case 11:
      return (reader.readString(offset)) as P;
    case 12:
      return (reader.readLong(offset)) as P;
    case 13:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderIsarGetId(OrderIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderIsarGetLinks(OrderIsar object) {
  return [object.orderItems, object.statusHistory];
}

void _orderIsarAttach(IsarCollection<dynamic> col, Id id, OrderIsar object) {
  object.id = id;
  object.orderItems.attach(
    col,
    col.isar.collection<OrderItemIsar>(),
    r'orderItems',
    id,
  );
  object.statusHistory.attach(
    col,
    col.isar.collection<OrderStatusHistoryIsar>(),
    r'statusHistory',
    id,
  );
}

extension OrderIsarByIndex on IsarCollection<OrderIsar> {
  Future<OrderIsar?> getByRefId(String refId) {
    return getByIndex(r'refId', [refId]);
  }

  OrderIsar? getByRefIdSync(String refId) {
    return getByIndexSync(r'refId', [refId]);
  }

  Future<bool> deleteByRefId(String refId) {
    return deleteByIndex(r'refId', [refId]);
  }

  bool deleteByRefIdSync(String refId) {
    return deleteByIndexSync(r'refId', [refId]);
  }

  Future<List<OrderIsar?>> getAllByRefId(List<String> refIdValues) {
    final values = refIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'refId', values);
  }

  List<OrderIsar?> getAllByRefIdSync(List<String> refIdValues) {
    final values = refIdValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'refId', values);
  }

  Future<int> deleteAllByRefId(List<String> refIdValues) {
    final values = refIdValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'refId', values);
  }

  int deleteAllByRefIdSync(List<String> refIdValues) {
    final values = refIdValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'refId', values);
  }

  Future<Id> putByRefId(OrderIsar object) {
    return putByIndex(r'refId', object);
  }

  Id putByRefIdSync(OrderIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'refId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRefId(List<OrderIsar> objects) {
    return putAllByIndex(r'refId', objects);
  }

  List<Id> putAllByRefIdSync(List<OrderIsar> objects, {bool saveLinks = true}) {
    return putAllByIndexSync(r'refId', objects, saveLinks: saveLinks);
  }
}

extension OrderIsarQueryWhereSort
    on QueryBuilder<OrderIsar, OrderIsar, QWhere> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhere> anyStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'status'),
      );
    });
  }
}

extension OrderIsarQueryWhere
    on QueryBuilder<OrderIsar, OrderIsar, QWhereClause> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> idGreaterThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> idLessThan(
    Id id, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> idBetween(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> refIdEqualTo(
    String refId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'refId', value: [refId]),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> refIdNotEqualTo(
    String refId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'refId',
                lower: [],
                upper: [refId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'refId',
                lower: [refId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'refId',
                lower: [refId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'refId',
                lower: [],
                upper: [refId],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> statusEqualTo(
    int status,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'status', value: [status]),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> statusNotEqualTo(
    int status,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [status],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'status',
                lower: [],
                upper: [status],
                includeUpper: false,
              ),
            );
      }
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> statusGreaterThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [status],
          includeLower: include,
          upper: [],
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> statusLessThan(
    int status, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [],
          upper: [status],
          includeUpper: include,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> statusBetween(
    int lowerStatus,
    int upperStatus, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.between(
          indexName: r'status',
          lower: [lowerStatus],
          includeLower: includeLower,
          upper: [upperStatus],
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> storeIdEqualTo(
    String storeId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'storeId', value: [storeId]),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterWhereClause> storeIdNotEqualTo(
    String storeId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'storeId',
                lower: [],
                upper: [storeId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'storeId',
                lower: [storeId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'storeId',
                lower: [storeId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'storeId',
                lower: [],
                upper: [storeId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension OrderIsarQueryFilter
    on QueryBuilder<OrderIsar, OrderIsar, QFilterCondition> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  canBeModifiedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'canBeModified', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'createdAt', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  createdAtGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> createdAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'fromId'),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'fromId'),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'fromId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'fromId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'fromId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'fromId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> fromIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'fromId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> idEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> idBetween(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  initiatedByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'initiatedBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  initiatedByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'initiatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> initiatedByMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'initiatedBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  initiatedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'initiatedBy', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  initiatedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'initiatedBy', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> isCancelledEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCancelled', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isClientOrder',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'isClientOrder',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'isClientOrder',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isClientOrder', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  isClientOrderIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'isClientOrder', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> isCompletedEqualTo(
    bool value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isCompleted', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> itemCountEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'itemCount', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  itemCountGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'itemCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> itemCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'itemCount',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> itemCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'itemCount',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdGreaterThan(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdLessThan(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdBetween(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'refId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> refIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'refId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> statusEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> statusGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> statusLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'status',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> statusBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'status',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'statusDescription',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'statusDescription',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'statusDescription',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusDescription', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'statusDescription', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdGreaterThan(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdLessThan(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdBetween(
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> storeIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'storeId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  storeIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'storeId', value: ''),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> totalPriceEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalPrice', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  totalPriceGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalPrice',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> totalPriceLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalPrice',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> totalPriceBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalPrice',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> updatedAtIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  updatedAtIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'updatedAt'),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> updatedAtEqualTo(
    DateTime? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> updatedAtLessThan(
    DateTime? value, {
    bool include = false,
  }) {
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

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> updatedAtBetween(
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

extension OrderIsarQueryObject
    on QueryBuilder<OrderIsar, OrderIsar, QFilterCondition> {}

extension OrderIsarQueryLinks
    on QueryBuilder<OrderIsar, OrderIsar, QFilterCondition> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> orderItems(
    FilterQuery<OrderItemIsar> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'orderItems');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'orderItems', length, true, length, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'orderItems', 0, true, 0, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'orderItems', 0, false, 999999, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'orderItems', 0, true, length, include);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'orderItems', length, include, 999999, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  orderItemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'orderItems',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition> statusHistory(
    FilterQuery<OrderStatusHistoryIsar> q,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'statusHistory');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusHistory', length, true, length, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusHistory', 0, true, 0, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusHistory', 0, false, 999999, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusHistory', 0, true, length, include);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'statusHistory', length, include, 999999, true);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterFilterCondition>
  statusHistoryLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'statusHistory',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension OrderIsarQuerySortBy on QueryBuilder<OrderIsar, OrderIsar, QSortBy> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByCanBeModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canBeModified', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByCanBeModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canBeModified', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByInitiatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiatedBy', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByInitiatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiatedBy', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsClientOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClientOrder', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsClientOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClientOrder', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByStatusDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy>
  sortByStatusDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension OrderIsarQuerySortThenBy
    on QueryBuilder<OrderIsar, OrderIsar, QSortThenBy> {
  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByCanBeModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canBeModified', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByCanBeModifiedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'canBeModified', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'createdAt', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByFromId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByFromIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fromId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByInitiatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiatedBy', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByInitiatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'initiatedBy', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsCancelledDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCancelled', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsClientOrder() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClientOrder', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsClientOrderDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isClientOrder', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByIsCompletedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isCompleted', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByItemCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'itemCount', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByStatusDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy>
  thenByStatusDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByStoreId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByStoreIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'storeId', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByTotalPriceDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPrice', Sort.desc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension OrderIsarQueryWhereDistinct
    on QueryBuilder<OrderIsar, OrderIsar, QDistinct> {
  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByCanBeModified() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'canBeModified');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'createdAt');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByFromId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fromId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByInitiatedBy({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'initiatedBy', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByIsCancelled() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCancelled');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByIsClientOrder({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'isClientOrder',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByIsCompleted() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isCompleted');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByItemCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'itemCount');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByRefId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByStatusDescription({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'statusDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByStoreId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'storeId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByTotalPrice() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPrice');
    });
  }

  QueryBuilder<OrderIsar, OrderIsar, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension OrderIsarQueryProperty
    on QueryBuilder<OrderIsar, OrderIsar, QQueryProperty> {
  QueryBuilder<OrderIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrderIsar, bool, QQueryOperations> canBeModifiedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'canBeModified');
    });
  }

  QueryBuilder<OrderIsar, DateTime, QQueryOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'createdAt');
    });
  }

  QueryBuilder<OrderIsar, String?, QQueryOperations> fromIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fromId');
    });
  }

  QueryBuilder<OrderIsar, String, QQueryOperations> initiatedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'initiatedBy');
    });
  }

  QueryBuilder<OrderIsar, bool, QQueryOperations> isCancelledProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCancelled');
    });
  }

  QueryBuilder<OrderIsar, String, QQueryOperations> isClientOrderProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isClientOrder');
    });
  }

  QueryBuilder<OrderIsar, bool, QQueryOperations> isCompletedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isCompleted');
    });
  }

  QueryBuilder<OrderIsar, int, QQueryOperations> itemCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'itemCount');
    });
  }

  QueryBuilder<OrderIsar, String, QQueryOperations> refIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refId');
    });
  }

  QueryBuilder<OrderIsar, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OrderIsar, String, QQueryOperations>
  statusDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusDescription');
    });
  }

  QueryBuilder<OrderIsar, String, QQueryOperations> storeIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'storeId');
    });
  }

  QueryBuilder<OrderIsar, int, QQueryOperations> totalPriceProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPrice');
    });
  }

  QueryBuilder<OrderIsar, DateTime?, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
