enum PrinterConnectionType { ble, network, usb }

class PrinterDevice {
  final String? name;
  final String? address;
  final PrinterConnectionType connectionType;
  // Store the original object for the mobile implementation to use if needed,
  // though cleaner is to just map back and forth or wrap it.
  // For simplicity, we will just keep data here.

  PrinterDevice({
    this.name,
    this.address,
    this.connectionType = PrinterConnectionType.ble,
  });
}
