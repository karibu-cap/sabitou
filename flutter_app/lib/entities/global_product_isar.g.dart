// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_product_isar.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGlobalProductIsarCollection on Isar {
  IsarCollection<GlobalProductIsar> get globalProductIsars => this.collection();
}

const GlobalProductIsarSchema = CollectionSchema(
  name: r'GlobalProductIsar',
  id: -2472812650201689644,
  properties: {
    r'barCodeValue': PropertySchema(
      id: 0,
      name: r'barCodeValue',
      type: IsarType.string,
    ),
    r'description': PropertySchema(
      id: 1,
      name: r'description',
      type: IsarType.string,
    ),
    r'imagesLinksIds': PropertySchema(
      id: 2,
      name: r'imagesLinksIds',
      type: IsarType.stringList,
    ),
    r'name': PropertySchema(id: 3, name: r'name', type: IsarType.string),
    r'refId': PropertySchema(id: 4, name: r'refId', type: IsarType.string),
  },

  estimateSize: _globalProductIsarEstimateSize,
  serialize: _globalProductIsarSerialize,
  deserialize: _globalProductIsarDeserialize,
  deserializeProp: _globalProductIsarDeserializeProp,
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
  },
  links: {
    r'categories': LinkSchema(
      id: 7009196197965042851,
      name: r'categories',
      target: r'ProductCategoryIsar',
      single: false,
    ),
  },
  embeddedSchemas: {},

  getId: _globalProductIsarGetId,
  getLinks: _globalProductIsarGetLinks,
  attach: _globalProductIsarAttach,
  version: '3.3.0-dev.2',
);

int _globalProductIsarEstimateSize(
  GlobalProductIsar object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.barCodeValue;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.description;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
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
  bytesCount += 3 + object.name.length * 3;
  bytesCount += 3 + object.refId.length * 3;
  return bytesCount;
}

void _globalProductIsarSerialize(
  GlobalProductIsar object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barCodeValue);
  writer.writeString(offsets[1], object.description);
  writer.writeStringList(offsets[2], object.imagesLinksIds);
  writer.writeString(offsets[3], object.name);
  writer.writeString(offsets[4], object.refId);
}

GlobalProductIsar _globalProductIsarDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = GlobalProductIsar(
    barCodeValue: reader.readStringOrNull(offsets[0]),
    description: reader.readStringOrNull(offsets[1]),
    imagesLinksIds: reader.readStringList(offsets[2]),
    name: reader.readString(offsets[3]),
    refId: reader.readString(offsets[4]),
  );
  object.id = id;
  return object;
}

P _globalProductIsarDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringList(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    case 4:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _globalProductIsarGetId(GlobalProductIsar object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _globalProductIsarGetLinks(
  GlobalProductIsar object,
) {
  return [object.categories];
}

void _globalProductIsarAttach(
  IsarCollection<dynamic> col,
  Id id,
  GlobalProductIsar object,
) {
  object.id = id;
  object.categories.attach(
    col,
    col.isar.collection<ProductCategoryIsar>(),
    r'categories',
    id,
  );
}

extension GlobalProductIsarByIndex on IsarCollection<GlobalProductIsar> {
  Future<GlobalProductIsar?> getByRefId(String refId) {
    return getByIndex(r'refId', [refId]);
  }

  GlobalProductIsar? getByRefIdSync(String refId) {
    return getByIndexSync(r'refId', [refId]);
  }

  Future<bool> deleteByRefId(String refId) {
    return deleteByIndex(r'refId', [refId]);
  }

  bool deleteByRefIdSync(String refId) {
    return deleteByIndexSync(r'refId', [refId]);
  }

  Future<List<GlobalProductIsar?>> getAllByRefId(List<String> refIdValues) {
    final values = refIdValues.map((e) => [e]).toList();
    return getAllByIndex(r'refId', values);
  }

  List<GlobalProductIsar?> getAllByRefIdSync(List<String> refIdValues) {
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

  Future<Id> putByRefId(GlobalProductIsar object) {
    return putByIndex(r'refId', object);
  }

  Id putByRefIdSync(GlobalProductIsar object, {bool saveLinks = true}) {
    return putByIndexSync(r'refId', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRefId(List<GlobalProductIsar> objects) {
    return putAllByIndex(r'refId', objects);
  }

  List<Id> putAllByRefIdSync(
    List<GlobalProductIsar> objects, {
    bool saveLinks = true,
  }) {
    return putAllByIndexSync(r'refId', objects, saveLinks: saveLinks);
  }
}

extension GlobalProductIsarQueryWhereSort
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QWhere> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GlobalProductIsarQueryWhere
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QWhereClause> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
  idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(lower: id, upper: id));
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
  idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
  idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
  refIdEqualTo(String refId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'refId', value: [refId]),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterWhereClause>
  refIdNotEqualTo(String refId) {
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
}

extension GlobalProductIsarQueryFilter
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QFilterCondition> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'barCodeValue'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'barCodeValue'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'barCodeValue',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'barCodeValue',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'barCodeValue',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'barCodeValue', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  barCodeValueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'barCodeValue', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'description'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'description'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionEqualTo(String? value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'description',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'description',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'description',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  descriptionIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'description', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'id', value: value),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNull(property: r'imagesLinksIds'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const FilterCondition.isNotNull(property: r'imagesLinksIds'),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'imagesLinksIds', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsElementIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'imagesLinksIds', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', length, true, length, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, true, 0, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, false, 999999, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', 0, true, length, include);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  imagesLinksIdsLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(r'imagesLinksIds', length, include, 999999, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameEqualTo(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'name',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameStartsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameEndsWith(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'name',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'name',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'name', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
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

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  refIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'refId', value: ''),
      );
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  refIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'refId', value: ''),
      );
    });
  }
}

extension GlobalProductIsarQueryObject
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QFilterCondition> {}

extension GlobalProductIsarQueryLinks
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QFilterCondition> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categories(FilterQuery<ProductCategoryIsar> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'categories');
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, true, length, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, 0, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, false, 999999, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesLengthLessThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, length, include);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesLengthGreaterThan(int length, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, include, 999999, true);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterFilterCondition>
  categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
        r'categories',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension GlobalProductIsarQuerySortBy
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QSortBy> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByBarCodeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCodeValue', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByBarCodeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCodeValue', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  sortByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }
}

extension GlobalProductIsarQuerySortThenBy
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QSortThenBy> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByBarCodeValue() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCodeValue', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByBarCodeValueDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barCodeValue', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByDescription() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByDescriptionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'description', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByRefId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.asc);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QAfterSortBy>
  thenByRefIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'refId', Sort.desc);
    });
  }
}

extension GlobalProductIsarQueryWhereDistinct
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct> {
  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct>
  distinctByBarCodeValue({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barCodeValue', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct>
  distinctByDescription({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'description', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct>
  distinctByImagesLinksIds() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'imagesLinksIds');
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct> distinctByName({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<GlobalProductIsar, GlobalProductIsar, QDistinct>
  distinctByRefId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'refId', caseSensitive: caseSensitive);
    });
  }
}

extension GlobalProductIsarQueryProperty
    on QueryBuilder<GlobalProductIsar, GlobalProductIsar, QQueryProperty> {
  QueryBuilder<GlobalProductIsar, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<GlobalProductIsar, String?, QQueryOperations>
  barCodeValueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barCodeValue');
    });
  }

  QueryBuilder<GlobalProductIsar, String?, QQueryOperations>
  descriptionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'description');
    });
  }

  QueryBuilder<GlobalProductIsar, List<String>?, QQueryOperations>
  imagesLinksIdsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'imagesLinksIds');
    });
  }

  QueryBuilder<GlobalProductIsar, String, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<GlobalProductIsar, String, QQueryOperations> refIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'refId');
    });
  }
}
