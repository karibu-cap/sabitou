// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_history_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrderStatusHistoryIsarCollection on Isar {
  IsarCollection<OrderStatusHistoryIsar> get orderStatusHistoryIsars =>
      this.collection();
}

const OrderStatusHistoryIsarSchema = CollectionSchema(
  name: r'OrderStatusHistoryIsar',
  id: -6293716647003207846,
  properties: {
    r'status': PropertySchema(id: 0, name: r'status', type: IsarType.long),
    r'statusDescription': PropertySchema(
      id: 1,
      name: r'statusDescription',
      type: IsarType.string,
    ),
    r'updatedAt': PropertySchema(
      id: 2,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
    r'updatedBy': PropertySchema(
      id: 3,
      name: r'updatedBy',
      type: IsarType.string,
    ),
  },

  estimateSize: _orderStatusHistoryIsarEstimateSize,
  serialize: _orderStatusHistoryIsarSerialize,
  deserialize: _orderStatusHistoryIsarDeserialize,
  deserializeProp: _orderStatusHistoryIsarDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},

  getId: _orderStatusHistoryIsarGetId,
  getLinks: _orderStatusHistoryIsarGetLinks,
  attach: _orderStatusHistoryIsarAttach,
  version: '3.3.0-dev.2',
);

int _orderStatusHistoryIsarEstimateSize(
  OrderStatusHistoryIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.statusDescription.length * 3;
  bytesCount += 3 + object.updatedBy.length * 3;
  return bytesCount;
}

void _orderStatusHistoryIsarSerialize(
  OrderStatusHistoryIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.status);
  writer.writeString(offsets[1], object.statusDescription);
  writer.writeDateTime(offsets[2], object.updatedAt);
  writer.writeString(offsets[3], object.updatedBy);
}

OrderStatusHistoryIsar _orderStatusHistoryIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrderStatusHistoryIsar(
    status: reader.readLong(offsets[0]),
    updatedAt: reader.readDateTime(offsets[2]),
    updatedBy: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _orderStatusHistoryIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _orderStatusHistoryIsarGetId(OrderStatusHistoryIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _orderStatusHistoryIsarGetLinks(
  OrderStatusHistoryIsar object,
) {
  return [];
}

void _orderStatusHistoryIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  OrderStatusHistoryIsar object,
) {
  object.id = id;
}

extension OrderStatusHistoryIsarQueryWhereSort
    on QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QWhere> {
  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterWhere>
  anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrderStatusHistoryIsarQueryWhere
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QWhereClause
        > {
  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterWhereClause
  >
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterWhereClause
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterWhereClause
  >
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterWhereClause
  >
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterWhereClause
  >
  idBetween(
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

extension OrderStatusHistoryIsarQueryFilter
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QFilterCondition
        > {
  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'status', value: value),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusGreaterThan(int value, {bool include = false}) {
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusLessThan(int value, {bool include = false}) {
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusBetween(
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusDescriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'statusDescription', value: ''),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  statusDescriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'statusDescription', value: ''),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedAtEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedAtLessThan(DateTime value, {bool include = false}) {
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedAtBetween(
    DateTime lower,
    DateTime upper, {
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

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedBy',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'updatedBy',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'updatedBy',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedBy', value: ''),
      );
    });
  }

  QueryBuilder<
    OrderStatusHistoryIsar,
    OrderStatusHistoryIsar,
    QAfterFilterCondition
  >
  updatedByIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'updatedBy', value: ''),
      );
    });
  }
}

extension OrderStatusHistoryIsarQueryObject
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QFilterCondition
        > {}

extension OrderStatusHistoryIsarQueryLinks
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QFilterCondition
        > {}

extension OrderStatusHistoryIsarQuerySortBy
    on QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QSortBy> {
  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByStatusDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByStatusDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  sortByUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.desc);
    });
  }
}

extension OrderStatusHistoryIsarQuerySortThenBy
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QSortThenBy
        > {
  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByStatusDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'status', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByStatusDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByStatusDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'statusDescription', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByUpdatedBy() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.asc);
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QAfterSortBy>
  thenByUpdatedByDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedBy', Sort.desc);
    });
  }
}

extension OrderStatusHistoryIsarQueryWhereDistinct
    on QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QDistinct> {
  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QDistinct>
  distinctByStatus() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'status');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QDistinct>
  distinctByStatusDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(
        r'statusDescription',
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QDistinct>
  distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, OrderStatusHistoryIsar, QDistinct>
  distinctByUpdatedBy({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedBy', caseSensitive: caseSensitive);
    });
  }
}

extension OrderStatusHistoryIsarQueryProperty
    on
        QueryBuilder<
          OrderStatusHistoryIsar,
          OrderStatusHistoryIsar,
          QQueryProperty
        > {
  QueryBuilder<OrderStatusHistoryIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, int, QQueryOperations> statusProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'status');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, String, QQueryOperations>
  statusDescriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'statusDescription');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, DateTime, QQueryOperations>
  updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }

  QueryBuilder<OrderStatusHistoryIsar, String, QQueryOperations>
  updatedByProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedBy');
    });
  }
}
