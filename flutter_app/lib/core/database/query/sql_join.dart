enum JoinType { inner, left, right }

class SqlJoin {
  final String table;
  final String alias;
  final String on;
  final JoinType type;
  // Colonnes à sélectionner depuis cette table jointe
  final List<String> selectColumns;

  const SqlJoin({
    required this.table,
    required this.alias,
    required this.on,
    this.type = JoinType.left,
    this.selectColumns = const [],
  });

  String toSql() {
    final joinKeyword = switch (type) {
      JoinType.inner => 'INNER JOIN',
      JoinType.left => 'LEFT JOIN',
      JoinType.right => 'RIGHT JOIN',
    };

    return '$joinKeyword $table $alias ON $on';
  }

  List<String> get qualifiedColumns =>
      selectColumns.map((c) => '$alias.$c').toList();
}
