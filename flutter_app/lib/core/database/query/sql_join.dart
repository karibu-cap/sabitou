/// Request join type.
enum JoinType {
  /// Inner join.
  inner,

  /// Left join.
  left,

  /// Right join.
  right,
}

/// Sql Join request.
class SqlJoin {
  /// Table name.
  final String table;

  /// The alias of the table.
  final String alias;

  /// The join condition.
  final String on;

  /// Join type.
  final JoinType type;

  /// The columns to select.
  final List<String> selectColumns;

  /// Qualified columns.
  List<String> get qualifiedColumns =>
      selectColumns.map((c) => '$alias.$c').toList();

  List<String> get aliasedColumns {
    return selectColumns.map((col) {
      if (col == '*') return '$alias.*';

      return '$alias.$col AS ${alias}_$col';
    }).toList();
  }

  /// Constructor of new [SqlJoin].
  const SqlJoin({
    required this.table,
    required this.alias,
    required this.on,
    this.type = JoinType.left,
    this.selectColumns = const [],
  });

  /// Convert to SQL.
  String toSql() {
    final joinKeyword = switch (type) {
      JoinType.inner => 'INNER JOIN',
      JoinType.left => 'LEFT JOIN',
      JoinType.right => 'RIGHT JOIN',
    };

    return '$joinKeyword $table $alias ON $on';
  }
}
