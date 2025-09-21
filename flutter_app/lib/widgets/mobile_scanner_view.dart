import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../services/internationalization/internationalization.dart';
import '../themes/app_colors.dart';

/// The mobile scanner widget.
class MobileScannerView extends StatelessWidget {
  /// Constructor of new [MobileScanner].
  MobileScannerView({super.key, required this.onResult});

  /// The result of the scanner.
  final Function(String) onResult;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(LucideIcons.scanQrCode400),
      padding: EdgeInsets.zero,
      onPressed: () {
        final MobileScannerController mobileScannerController =
            MobileScannerController(
              cameraResolution: Size(MediaQuery.sizeOf(context).width, 100),
              detectionSpeed: DetectionSpeed.noDuplicates,
              formats: [BarcodeFormat.all],
            );
        showShadDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) {
            return ShadDialog(
              title: Text(Intls.to.scanBarcode),
              child: Container(
                color: ShadTheme.of(context).colorScheme.background,
                height: 160,
                child: Column(
                  children: [
                    Expanded(
                      child: MobileScanner(
                        controller: mobileScannerController,
                        onDetect: (barcodes) {
                          for (Barcode element in barcodes.barcodes) {
                            final String result = element.rawValue ?? '';
                            if (result.isNotEmpty) {
                              onResult.call(result);
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
          },
        );
      },
    );
  }
}
