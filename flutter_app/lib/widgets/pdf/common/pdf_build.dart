import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart';

import '../../../services/internationalization/internationalization.dart';

/// Shared PDF build.
class PdfBuildShared {
  /// Build a simple PDF.
  static Future<Uint8List> buildSimplePdf({
    required PdfPageFormat pageFormat,
    required String titleDoc,
    required List<Widget> children,
    required String source,
  }) async {
    final doc =
        Document(
          pageMode: PdfPageMode.outlines,
          author: source,
          creator: Intls.to.sabitu,
          title: titleDoc,
        )..addPage(
          MultiPage(
            maxPages: 5000,
            build: (context) => children,
            pageFormat: pageFormat,
          ),
        );

    return doc.save();
  }
}
