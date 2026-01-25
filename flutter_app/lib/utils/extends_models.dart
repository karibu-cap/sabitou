import 'package:flutter_blue_plus/flutter_blue_plus.dart' as fbp;
import 'package:hive_ce/hive.dart';
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

/// Change typeId to a unique value for your app
@HiveType(typeId: 15)
class AppPrinter {
  /// The printer url.
  @HiveField(0)
  final String url;

  /// The printer name.
  @HiveField(1)
  final String? name;

  /// The printer model.
  @HiveField(2)
  final String? model;

  /// The printer location.
  @HiveField(3)
  final String? location;

  /// The printer comment.
  @HiveField(4)
  final String? comment;

  /// Whether the printer is default.
  @HiveField(5)
  final bool? isDefault;

  /// Whether the printer is available.
  @HiveField(6)
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

  @override
  int get hashCode =>
      url.hashCode ^
      name.hashCode ^
      model.hashCode ^
      location.hashCode ^
      comment.hashCode ^
      isDefault.hashCode ^
      isAvailable.hashCode;

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

  /// Create a [AppPrinter] from a Flutter Blue Plus [BluetoothDevice].
  factory AppPrinter.fromFlutterBluePlusDevice(fbp.BluetoothDevice device) {
    final String url =
        '${device.remoteId.str}#U#${device.platformName}#U#${PrinterModel.bluetoothDevice.name}';

    return AppPrinter(
      url: url,
      name: device.platformName.isNotEmpty
          ? device.platformName
          : device.remoteId.str,
      model: PrinterModel.bluetoothDevice.name,
      location: device.remoteId.str,
      comment: 'Flutter Blue Plus Device',
      isDefault: false,
    );
  }

  /// Create a Flutter Blue Plus [BluetoothDevice] from the [url].
  fbp.BluetoothDevice toFlutterBluePlusDevice() {
    final List<String> deviceUrl = url.split('#U#');

    // deviceUrl[0] = MAC address/remote ID
    // deviceUrl[1] = device name
    // deviceUrl[2] = printer model

    final String remoteId = deviceUrl[0];

    // Create BluetoothDevice from remote ID
    return fbp.BluetoothDevice.fromId(remoteId);
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

  @override
  String toString() {
    return 'AppPrinter(url: $url, name: $name, model: $model, '
        'location: $location, isDefault: $isDefault, isAvailable: $isAvailable)';
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

/// Extension to get the name of the printer model.
extension PrinterModelExtension on PrinterModel {
  String get name {
    switch (this) {
      case PrinterModel.bluetoothDevice:
        return 'bluetooth-device';
      case PrinterModel.networkDevice:
        return 'network-device';
      case PrinterModel.sunmiDevice:
        return 'sunmi-device';
    }
  }
}
