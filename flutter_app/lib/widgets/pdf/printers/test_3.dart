import 'package:flutter/material.dart';

import '../../../services/printer/printer_service.dart';
import 'custom_receipt_widget.dart';

class PrinterHomePage extends StatefulWidget {
  const PrinterHomePage({super.key});

  @override
  _PrinterHomePageState createState() => _PrinterHomePageState();
}

class _PrinterHomePageState extends State<PrinterHomePage> {
  final PrinterService _printerService = PrinterService();
  List<PrinterDevice> _printers = [];
  bool _isScanning = false;
  String _connectionType = 'Bluetooth';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thermal Printer'),
        actions: [
          IconButton(
            icon: const Icon(Icons.print),
            onPressed: _printerService.isConnected ? _showPrintOptions : null,
          ),
        ],
      ),
      body: Column(
        children: [
          // Connection type selector
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const Text('Connection: '),
                const SizedBox(width: 16),
                DropdownButton<String>(
                  value: _connectionType,
                  items: ['Bluetooth', 'USB', 'Network']
                      .map(
                        (type) =>
                            DropdownMenuItem(value: type, child: Text(type)),
                      )
                      .toList(),
                  onChanged: (value) {
                    if (value == null) {
                      return;
                    }
                    setState(() {
                      _connectionType = value;
                      _printers = [];
                    });
                  },
                ),
              ],
            ),
          ),

          // Scan button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: Icon(_isScanning ? Icons.hourglass_empty : Icons.search),
                label: Text(_isScanning ? 'Scanning...' : 'Scan for Printers'),
                onPressed: _isScanning ? null : _scanForPrinters,
              ),
            ),
          ),

          // Connected printer info
          if (_printerService.isConnected)
            Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: const Border.fromBorderSide(
                  BorderSide(color: Colors.green),
                ),
              ),
              child: Row(
                children: [
                  const Icon(Icons.check_circle, color: Colors.green),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      'Connected: ${_printerService.connectedPrinter?.name ?? "Unknown"}',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: _disconnect,
                  ),
                ],
              ),
            ),

          // Printer list
          Expanded(
            child: _printers.isEmpty
                ? const Center(
                    child: Text(
                      'No printers found.\nTap "Scan for Printers" to search.',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: _printers.length,
                    itemBuilder: (context, index) {
                      final printer = _printers[index];
                      final isConnected =
                          printer == _printerService.connectedPrinter;

                      return ListTile(
                        leading: Icon(
                          _getIconForConnectionType(),
                          color: isConnected ? Colors.green : null,
                        ),
                        title: Text(printer.name ?? 'Unknown Printer'),
                        subtitle: Text(printer.address ?? 'No address'),
                        trailing: isConnected
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : null,
                        onTap: () => _connectToPrinter(printer),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  IconData _getIconForConnectionType() {
    switch (_connectionType) {
      case 'Bluetooth':
        return Icons.bluetooth;
      case 'USB':
        return Icons.usb;
      case 'Network':
        return Icons.wifi;
      default:
        return Icons.print;
    }
  }

  Future<void> _scanForPrinters() async {
    setState(() => _isScanning = true);

    List<PrinterDevice> printers = [];
    switch (_connectionType) {
      case 'Bluetooth':
        printers = await _printerService.scanBluetoothPrinters();
        break;
    }

    setState(() {
      _printers = printers;
      _isScanning = false;
    });

    if (printers.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('No printers found')));
    }
  }

  Future<void> _connectToPrinter(PrinterDevice printer) async {
    final success = await _printerService.connectToPrinter(printer);

    if (success) {
      setState(() {});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Connected to ${printer.name}'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Failed to connect'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<void> _disconnect() async {
    // await _printerService.disconnect();
    // setState(() {});
    // ScaffoldMessenger.of(
    //   context,
    // ).showSnackBar(const SnackBar(content: Text('Disconnected')));
  }

  void _showPrintOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.image),
              title: const Text('Print Test Image'),
              onTap: () {
                Navigator.pop(context);
                _printTestImage();
              },
            ),
            ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Print Custom Widget'),
              onTap: () {
                Navigator.pop(context);
                _printCustomWidget(_printerService, context);
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _printTestImage() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Image printing requires an image file')),
    );
    // Implement actual image printing here
  }

  Future<void> _printCustomWidget(
    PrinterService _printerService,
    BuildContext context,
  ) async {
    final widgetPrinter = WidgetPrinter(_printerService);
    await widgetPrinter.printWidget(const CustomReceiptWidget());

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Widget sent to printer')));
  }
}
