import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:printing/printing.dart';

/// Alert model.
class Alert {
  /// Constructs a new [Alert].
  Alert({
    required this.id,
    required this.type,
    required this.message,
    required this.severity,
    this.productId,
    required this.createdAtInUtc,
    required this.read,
  });

  /// The ID of the alert.
  final String id;

  /// The type of the alert.
  final AlertType type;

  /// The message of the alert.
  final String message;

  /// The severity of the alert.
  final SeverityType severity;

  /// The ID of the product associated with the alert.
  final String? productId;

  /// The date and time when the alert was created.
  final DateTime createdAtInUtc;

  /// Whether the alert has been read.
  final bool read;
}

/// Alert type.
enum AlertType {
  /// Low stock alert.
  lowstock,

  /// Expiry alert.
  expiry,

  /// Backup alert.
  backup,
}

/// Alert severity.
enum SeverityType {
  /// Low severity.
  low,

  /// Medium severity.
  medium,

  /// High severity.
  high,
}

/// The app printer model.
class AppPrinter {
  /// The printer url.
  final String url;

  /// The printer name.
  final String? name;

  /// The printer model.
  final String? model;

  /// The printer location.
  final String? location;

  /// The printer comment.
  final String? comment;

  /// Whether the printer is default.
  final bool? isDefault;

  /// Whether the printer is available.
  final bool? isAvailable;

  /// Constructs a new [AppPrinter].
  AppPrinter({
    required this.url,
    this.name,
    this.model,
    this.location,
    this.comment,
    this.isDefault,
    this.isAvailable,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppPrinter &&
          runtimeType == other.runtimeType &&
          url == other.url &&
          name == other.name &&
          model == other.model &&
          location == other.location &&
          comment == other.comment &&
          isDefault == other.isDefault &&
          isAvailable == other.isAvailable);

  /// Copy the [AppPrinter] with the given properties.
  AppPrinter copyWith({
    String? url,
    String? name,
    String? model,
    String? location,
    String? comment,
    bool? isDefault,
    bool? isAvailable,
  }) {
    return AppPrinter(
      url: url ?? this.url,
      name: name ?? this.name,
      model: model ?? this.model,
      location: location ?? this.location,
      comment: comment ?? this.comment,
      isDefault: isDefault ?? this.isDefault,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }

  /// Create a [AppPrinter] from a [BluetoothDevice].
  factory AppPrinter.fromBluetoothDevice(BluetoothDevice device) {
    final String url =
        '${device.address}#U#${device.name}#U#${PrinterModel.bluetoothDevice.name}';

    return AppPrinter(
      url: url,
      name: device.name,
      model: PrinterModel.bluetoothDevice.name,
      location: device.address ?? '',
      comment: device.type.toString(),
      isDefault: false,
    );
  }

  /// Create a [BluetoothDevice] from the [url].
  BluetoothDevice toBluetoothDevice() {
    final List<String> deviceUrl = url.split('#U#');
    final BluetoothDevice device = BluetoothDevice(deviceUrl[1], deviceUrl[0]);

    return device;
  }

  /// Create a [AppPrinter] from a [Printer].
  factory AppPrinter.fromPrinter(Printer printer) {
    return AppPrinter(
      url: printer.url,
      name: printer.name,
      model: printer.model,
      location: printer.location,
      comment: printer.comment,
      isDefault: printer.isDefault,
      isAvailable: printer.isAvailable,
    );
  }

  /// Create a [Printer] from the [AppPrinter].
  Printer toPrinter() {
    return Printer(
      url: url,
      name: name,
      model: model,
      location: location,
      comment: comment,
      isDefault: isDefault,
      isAvailable: isAvailable,
    );
  }
}

/// Printer model.
enum PrinterModel {
  /// Bluetooth device.
  bluetoothDevice,

  /// Network device.
  networkDevice,

  /// Sunmi device.
  sunmiDevice,
}
