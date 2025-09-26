import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';

/// Header widget for supplier form dialog.
class SupplierFormHeader extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Creates a new [SupplierFormHeader] widget.
  const SupplierFormHeader({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return Text(
      supplier == null ? intl.enterDetailsNewSupplier : intl.updateSupplierInfo,
      style: const TextStyle(color: Colors.grey, fontSize: 12),
    );
  }
}
