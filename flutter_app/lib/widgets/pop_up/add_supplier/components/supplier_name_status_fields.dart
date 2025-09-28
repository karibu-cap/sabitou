import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/form/validation.dart';
import '../../../input/form_fields.dart';
import '../add_supplier_controller.dart';

/// Name and status fields widget for supplier form.
class SupplierNameStatusFields extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Creates a new [SupplierNameStatusFields] widget.
  const SupplierNameStatusFields({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<AddSupplierController>(context);

    return Row(
      children: [
        Expanded(
          flex: 3,
          child: InputField(
            id: intl.companyName,
            label: '${intl.companyName} *',
            controller: controller.nameController,
            placeholder: intl.enterCompanyName,
            validator: ValidationFormUtils.validateCompanyName,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                intl.isActive,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ShadSwitch(
                    value:
                        controller.supplierStatus ==
                        SupplierStatus.SUPPLIER_STATUS_ACTIVE,
                    onChanged: controller.setSupplierStatus,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    controller.supplierStatus ==
                            SupplierStatus.SUPPLIER_STATUS_ACTIVE
                        ? intl.active
                        : intl.inactive,
                    style: TextStyle(
                      fontSize: 12,
                      color:
                          controller.supplierStatus ==
                              SupplierStatus.SUPPLIER_STATUS_ACTIVE
                          ? Colors.green.shade700
                          : Colors.red.shade700,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
