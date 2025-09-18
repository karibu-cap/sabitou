import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../widgets/input/form_fields.dart';
import '../suppliers_add/suppliers_add_controller.dart';

/// Notes field widget for supplier form.
class SupplierNotesField extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Creates a new [SupplierNotesField] widget.
  const SupplierNotesField({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<SuppliersAddController>(context);

    return InputField(
      id: intl.notes,
      label: intl.notes,
      controller: controller.notesController,
      placeholder: intl.additionalNotes,
      maxLines: 3,
    );
  }
}
