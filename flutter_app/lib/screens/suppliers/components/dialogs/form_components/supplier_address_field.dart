import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/form/validation.dart';
import '../../../../../widgets/input/form_fields.dart';
import '../suppliers_add/suppliers_add_controller.dart';

/// Address field widget for supplier form.
class SupplierAddressField extends StatelessWidget {
  /// The supplier being edited, null for new supplier creation.
  final Supplier? supplier;

  /// Creates a new [SupplierAddressField] widget.
  const SupplierAddressField({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<SuppliersAddController>(context);

    return InputField(
      id: intl.address,
      label: '${intl.address} *',
      controller: controller.addressController,
      placeholder: intl.enterCompleteAddress,
      maxLines: 3,
      validator: ValidationFormUtils.validateAddress,
    );
  }
}
