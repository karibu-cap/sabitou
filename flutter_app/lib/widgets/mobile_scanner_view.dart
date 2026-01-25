import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../services/internationalization/internationalization.dart';
import '../themes/app_colors.dart';

/// The mobile scanner widget.
class MobileScannerView extends StatelessWidget {
  /// Constructor of new [MobileScanner].
  MobileScannerView({super.key, required this.onResult});

  /// The result of the scanner.
  final Function(String) onResult;

  Future<PermissionStatus> _requestCameraPermission() async {
    return await Permission.camera.request();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: const Icon(LucideIcons.scanQrCode400, size: 16),
      onTap: () async {
        if (Platform.isWindows) {
          final String? res = await SimpleBarcodeScanner.scanBarcode(
            context,
            barcodeAppBar: const BarcodeAppBar(
              centerTitle: false,
              enableBackButton: true,
              backButtonIcon: Icon(Icons.arrow_back_ios),
            ),
            isShowFlashIcon: true,
            delayMillis: 500,
            scanFormat: ScanFormat.ONLY_BARCODE,
          );
          if (res != null) {
            onResult.call(res);
          }

          return;
        }

        // Request camera permission before opening scanner
        final status = await _requestCameraPermission();
        if (status.isGranted) {
          showShadDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => _MobileScannerDialog(
              onResult: onResult,
              cameraResolution: Size(MediaQuery.sizeOf(context).width, 100),
            ),
          );
        } else {
          // Show snackbar if permission denied
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Camera permission is required to scan barcodes. Please enable it in settings.',
              ),
              duration: Duration(seconds: 5),
            ),
          );
        }
      },
    );
  }
}

/// Stateful dialog widget that properly manages MobileScannerController lifecycle
class _MobileScannerDialog extends StatefulWidget {
  const _MobileScannerDialog({
    required this.onResult,
    required this.cameraResolution,
  });

  final Function(String) onResult;
  final Size cameraResolution;

  @override
  State<_MobileScannerDialog> createState() => _MobileScannerDialogState();
}

class _MobileScannerDialogState extends State<_MobileScannerDialog> {
  late MobileScannerController _controller;
  bool _isControllerReady = false;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController(
      cameraResolution: widget.cameraResolution,
      formats: [BarcodeFormat.all],
    );
  }

  Future<void> _ensureControllerStarted() async {
    if (!_isControllerReady) {
      await _controller.start();
      _isControllerReady = true;
    }
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(Intls.to.scanBarcode),
      child: Container(
        color: ShadTheme.of(context).colorScheme.background,
        height: 160,
        width: 350,
        child: Column(
          children: [
            Expanded(
              child: MobileScanner(
                onDetect: (barcodes) {
                  for (Barcode element in barcodes.barcodes) {
                    final String result = element.rawValue ?? '';
                    if (result.isNotEmpty) {
                      widget.onResult.call(result);
                      Navigator.of(context).pop();
                    }
                  }
                },
                errorBuilder: (p0, p1) {
                  return Text(
                    p1.errorDetails?.message ?? '',
                    style: const TextStyle(color: AppColors.error500),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
