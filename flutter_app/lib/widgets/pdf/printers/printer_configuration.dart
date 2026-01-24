import '../../../utils/printer_management.dart';

/// Printer configuration stored in preferences
class PrinterConfiguration {
  /// The default printer for receipts
  final Printer? defaultPrinter;

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
          ? Printer.fromJson(json)
          : null,
      autoPrintEnabled: json['autoPrintEnabled'] as bool? ?? true,
    );
  }

  /// Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'defaultPrinter': defaultPrinter != null
          ? defaultPrinter?.toJson()
          : null,
      'autoPrintEnabled': autoPrintEnabled,
    };
  }

  /// Copy with
  PrinterConfiguration copyWith({
    Printer? defaultPrinter,
    bool? autoPrintEnabled,
  }) {
    return PrinterConfiguration(
      defaultPrinter: defaultPrinter ?? this.defaultPrinter,
      autoPrintEnabled: autoPrintEnabled ?? this.autoPrintEnabled,
    );
  }
}
