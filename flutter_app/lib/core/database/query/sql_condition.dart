/// Conditions supportées (équivalent DocumentFieldCondition)
enum SqlCondition {
  isEqualTo,
  isNotEqualTo,
  isGreaterThan,
  isGreaterThanOrEqualTo,
  isLessThan,
  isLessThanOrEqualTo,
  whereIn,
  whereNotIn,
  isNull,
  isNotNull,
  like, // LIKE '%value%'
  between, // value doit être List[min, max]
}

/// Équivalent de ton DocumentQuery
class SqlQuery {
  final String key;
  final dynamic value;
  final SqlCondition condition;

  const SqlQuery(this.key, this.value, this.condition);

  // Helpers factory pour un code encore plus lisible
  factory SqlQuery.equals(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isEqualTo);

  factory SqlQuery.notEquals(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isNotEqualTo);

  factory SqlQuery.greaterThan(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isGreaterThan);

  factory SqlQuery.lessThan(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isLessThan);

  factory SqlQuery.whereIn(String key, List<dynamic> values) =>
      SqlQuery(key, values, SqlCondition.whereIn);

  factory SqlQuery.isNull(String key) =>
      SqlQuery(key, null, SqlCondition.isNull);

  factory SqlQuery.isNotNull(String key) =>
      SqlQuery(key, null, SqlCondition.isNotNull);

  factory SqlQuery.like(String key, String pattern) =>
      SqlQuery(key, pattern, SqlCondition.like);

  factory SqlQuery.between(String key, dynamic min, dynamic max) =>
      SqlQuery(key, [min, max], SqlCondition.between);

  /// Compile la condition en fragment SQL
  (String clause, List<Object?> args) toSql(String? tableAlias) {
    final col = tableAlias != null ? '$tableAlias.$key' : key;

    return switch (condition) {
      SqlCondition.isEqualTo => ('$col = ?', [value]),
      SqlCondition.isNotEqualTo => ('$col != ?', [value]),
      SqlCondition.isGreaterThan => ('$col > ?', [value]),
      SqlCondition.isGreaterThanOrEqualTo => ('$col >= ?', [value]),
      SqlCondition.isLessThan => ('$col < ?', [value]),
      SqlCondition.isLessThanOrEqualTo => ('$col <= ?', [value]),
      SqlCondition.isNull => ('$col IS NULL', []),
      SqlCondition.isNotNull => ('$col IS NOT NULL', []),
      SqlCondition.like => ('$col LIKE ?', [value]),
      SqlCondition.between => (
        '$col BETWEEN ? AND ?',
        [(value as List)[0], (value as List)[1]],
      ),
      SqlCondition.whereIn => (
        '$col IN (${List.filled((value as List).length, '?').join(', ')})',
        List<Object?>.from(value as List),
      ),
      SqlCondition.whereNotIn => (
        '$col NOT IN (${List.filled((value as List).length, '?').join(', ')})',
        List<Object?>.from(value as List),
      ),
    };
  }
}

/// Équivalent de ton DocumentOrderBy
class SqlOrderBy {
  final String field;
  final bool descending;
  final dynamic startAt;
  final dynamic endAt;

  const SqlOrderBy(
    this.field, {
    this.descending = false,
    this.startAt,
    this.endAt,
  });

  String toSql([String? tableAlias]) {
    final col = tableAlias != null ? '$tableAlias.$field' : field;

    return '$col ${descending ? 'DESC' : 'ASC'}';
  }
}
