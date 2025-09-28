import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/form/validation.dart';
import '../../../input/form_fields.dart';
import '../add_supplier_controller.dart';

/// Contact fields widget for supplier form.
class SupplierContactFields extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Creates a new [SupplierContactFields] widget.
  const SupplierContactFields({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<AddSupplierController>(context);

    return Row(
      children: [
        Expanded(
          child: InputField(
            id: intl.phoneNumber,
            label: '${intl.phoneNumber} *',
            controller: controller.phoneController,
            placeholder: intl.enterPhoneNumber,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.phone,
            validator: ValidationFormUtils.validatePhoneNumber,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: InputField(
            id: intl.email,
            label: intl.email,
            controller: controller.emailController,
            placeholder: intl.enterEmailAddress,
            keyboardType: TextInputType.emailAddress,
            validator: ValidationFormUtils.validateEmailV2,
          ),
        ),
      ],
    );
  }
}
