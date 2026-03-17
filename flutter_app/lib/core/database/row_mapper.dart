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
