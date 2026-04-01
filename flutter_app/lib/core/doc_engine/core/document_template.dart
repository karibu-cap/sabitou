import 'dart:typed_data';

import 'package:pdf/pdf.dart';
import 'package:sabitou_rpc/models.dart';

import 'doc_format.dart';

/// Abstract contract for every document template in [SabitouDocEngine].
/// ```
abstract class DocumentTemplate<T> {
  const DocumentTemplate();

  /// The suggested paper format for this template type.
  /// The engine uses this when no explicit format is provided.
  SabitouDocFormat get defaultFormat;

  /// Generates the PDF as raw bytes.
  ///
  /// - [data] — the domain object to render.
  /// - [company] — branding/legal info from the current [Store].
  /// - [format] — resolved [PdfPageFormat]; falls back to [defaultFormat]
  ///   when not overridden by the caller.
  Future<Uint8List> build(T data, Store company, PdfPageFormat format);

  /// Convenience: build with the template's own [defaultFormat].
  Future<Uint8List> buildWithDefaultFormat(T data, Store company) {
    return build(data, company, defaultFormat.toPdfPageFormat());
  }
}
