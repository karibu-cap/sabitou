/// The [SqlCondition] enum.
enum SqlCondition {
  /// Equal to.
  isEqualTo,

  /// Not equal to.
  isNotEqualTo,

  /// Greater than.
  isGreaterThan,

  /// Wheter the data is greater than or equal to.
  isGreaterThanOrEqualTo,

  /// Less than.
  isLessThan,

  /// Wheter the data is less than or equal to.
  isLessThanOrEqualTo,

  /// [whereIn] condition.
  whereIn,

  /// [whereNotIn] condition.
  whereNotIn,

  /// Null condition.
  isNull,

  /// Not null condition.
  isNotNull,

  /// [like] condition.
  like, // LIKE '%value%'
  /// [between] condition.
  between, // value doit être List[min, max]
  /// Raw condition.
  raw,
}

/// The [SqlOrGroup] class.
class SqlOrGroup {
  /// The [SqlQuery] conditions.
  final List<SqlQuery> conditions;

  /// The [SqlOrGroup] Constructor.
  const SqlOrGroup(this.conditions);

  /// Compile the condition to sql.
  (String clause, List<Object?> args) toSql([String? tableAlias]) {
    final clauses = <String>[];
    final args = <Object?>[];

    for (final condition in conditions) {
      final (clause, cArgs) = condition.toSql(tableAlias);
      clauses.add(clause);
      args.addAll(cArgs);
    }

    return ('(${clauses.join(' OR ')})', args);
  }
}

/// The [SqlQuery] class.
class SqlQuery {
  final String key;
  final dynamic value;
  final SqlCondition condition;
  final String? tableAlias;

  /// The [SqlQuery] Constructor.
  const SqlQuery(this.key, this.value, this.condition, {this.tableAlias});

  /// Create a [SqlQuery] with [SqlCondition.isEqualTo].
  factory SqlQuery.equals(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isEqualTo);

  /// Create a [SqlQuery] with [SqlCondition.isNotEqualTo].
  factory SqlQuery.notEquals(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isNotEqualTo);

  /// Create a [SqlQuery] with [SqlCondition.isGreaterThan].
  factory SqlQuery.greaterThan(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isGreaterThan);

  /// Create a [SqlQuery] with [SqlCondition.isLessThan].
  factory SqlQuery.lessThan(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isLessThan);

  /// Create a [SqlQuery] with [SqlCondition.whereIn].
  factory SqlQuery.whereIn(String key, List<dynamic> values) =>
      SqlQuery(key, values, SqlCondition.whereIn);

  /// Create a [SqlQuery] with [SqlCondition.isNull].
  factory SqlQuery.isNull(String key) =>
      SqlQuery(key, null, SqlCondition.isNull);

  /// Create a [SqlQuery] with [SqlCondition.isNotNull].
  factory SqlQuery.isNotNull(String key) =>
      SqlQuery(key, null, SqlCondition.isNotNull);

  /// Create a [SqlQuery] with [SqlCondition.like].
  factory SqlQuery.like(String key, String pattern) =>
      SqlQuery(key, pattern, SqlCondition.like);

  /// Create a [SqlQuery] with [SqlCondition.between].
  factory SqlQuery.between(String key, dynamic min, dynamic max) =>
      SqlQuery(key, [min, max], SqlCondition.between);

  /// Create a [SqlQuery] with [SqlCondition.isLessThanOrEqualTo].
  factory SqlQuery.isLessThanOrEqualTo(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isLessThanOrEqualTo);

  /// Create a [SqlQuery] with [SqlCondition.isGreaterThanOrEqualTo].
  factory SqlQuery.isGreaterThanOrEqualTo(String key, dynamic value) =>
      SqlQuery(key, value, SqlCondition.isGreaterThanOrEqualTo);

  /// Create a [SqlQuery] with [SqlCondition.raw].
  factory SqlQuery.columnComparison(
    String colA,
    String colB,
    SqlCondition cond,
  ) => SqlQuery(
    switch (cond) {
      SqlCondition.isLessThan => '$colA < $colB',
      SqlCondition.isLessThanOrEqualTo => '$colA <= $colB',
      SqlCondition.isGreaterThan => '$colA > $colB',
      SqlCondition.isGreaterThanOrEqualTo => '$colA >= $colB',
      SqlCondition.isEqualTo => '$colA = $colB',
      SqlCondition.isNotEqualTo => '$colA != $colB',
      _ => throw Exception('Invalid condition for columnLessThan'),
    },
    null,
    SqlCondition.raw,
  );

  /// Compile the condition to sql.
  (String clause, List<Object?> args) toSql([String? rootAlias]) {
    final activeAlias = tableAlias ?? rootAlias;
    final col = (activeAlias != null && !key.contains('.'))
        ? '$activeAlias.$key'
        : key;

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
      SqlCondition.raw => (key, []),
    };
  }
}

/// The [SqlOrderBy] class.
class SqlOrderBy {
  final String field;
  final bool descending;
  final dynamic startAt;
  final dynamic endAt;

  /// The [SqlOrderBy] Constructor.
  const SqlOrderBy(
    this.field, {
    this.descending = false,
    this.startAt,
    this.endAt,
  });

  /// Compile the order by to sql.
  String toSql([String? tableAlias]) {
    final col = (tableAlias != null && !field.contains('.'))
        ? '$tableAlias.$field'
        : field;

    return '$col ${descending ? 'DESC' : 'ASC'}';
  }
}
