import '../../../utils/extends_models.dart';

/// Printer configuration stored in preferences
class PrinterConfiguration {
  /// The default printer for receipts
  final AppPrinter? defaultPrinter;

  /// Whether auto-print is enabled
  final bool autoPrintEnabled;

  /// Constructs a new [PrinterConfiguration]
  const PrinterConfiguration({
    this.defaultPrinter,
    this.autoPrintEnabled = true,
  });

  /// Create from JSON
  factory PrinterConfiguration.fromJson(Map<String, dynamic> json) {
    return PrinterConfiguration(
      defaultPrinter: json['defaultPrinter'] != null
          ? AppPrinter(
              url: json['defaultPrinter']['url'] as String,
              name: json['defaultPrinter']['name'] as String?,
              model: json['defaultPrinter']['model'] as String?,
              location: json['defaultPrinter']['location'] as String?,
              comment: json['defaultPrinter']['comment'] as String?,
              isDefault: json['defaultPrinter']['isDefault'] as bool?,
              isAvailable: json['defaultPrinter']['isAvailable'] as bool?,
            )
          : null,
      autoPrintEnabled: json['autoPrintEnabled'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'defaultPrinter': defaultPrinter != null
          ? {
              'url': defaultPrinter?.url,
              'name': defaultPrinter?.name,
              'model': defaultPrinter?.model,
              'location': defaultPrinter?.location,
              'comment': defaultPrinter?.comment,
              'isDefault': defaultPrinter?.isDefault,
              'isAvailable': defaultPrinter?.isAvailable,
            }
          : null,
      'autoPrintEnabled': autoPrintEnabled,
    };
  }

  /// Copy with
  PrinterConfiguration copyWith({
    AppPrinter? defaultPrinter,
    bool? autoPrintEnabled,
  }) {
    return PrinterConfiguration(
      defaultPrinter: defaultPrinter ?? this.defaultPrinter,
      autoPrintEnabled: autoPrintEnabled ?? this.autoPrintEnabled,
    );
  }
}
