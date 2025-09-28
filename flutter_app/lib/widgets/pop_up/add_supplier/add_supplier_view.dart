import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import 'add_supplier_controller.dart';
import 'add_supplier_view_model.dart';
import 'components/supplier_action_buttons.dart';
import 'components/supplier_address_field.dart';
import 'components/supplier_contact_fields.dart';
import 'components/supplier_form_header.dart';
import 'components/supplier_info_card.dart';
import 'components/supplier_name_status_fields.dart';
import 'components/supplier_notes_field.dart';

/// Shows supplier form dialog for editing.
void showAddSupplierDialog(BuildContext context, {Supplier? supplier}) {
  showDialog<bool>(
    context: context,
    builder: (context) => SupplierFormDialog(supplier: supplier),
  );
}

/// Modal for viewing and modifying user permissions.
class SupplierFormDialog extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Constructs a new UserPermissionsModal.
  const SupplierFormDialog({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddSupplierController(
        intl: AppInternationalizationService.to,
        viewModel: AddSupplierViewModel(),
        supplier: supplier,
      ),
      child: _SupplierFormDialogContent(supplier: supplier),
    );
  }
}

/// Supplier form dialog widget.ee
class _SupplierFormDialogContent extends StatelessWidget {
  /// The supplier.
  final Supplier? supplier;

  /// Creates a new [SupplierFormDialog].
  const _SupplierFormDialogContent({this.supplier});

  /// Handles the save operation for the supplier form.
  Future<void> _saveSupplier(
    BuildContext context,
    AddSupplierController controller,
  ) async {
    final validation = controller.validateForm();

    if (!validation) {
      return;
    }

    final saveSuccess = await controller.saveSupplier();
    final _intl = AppInternationalizationService.to;

    // Handle successful save operation
    if (saveSuccess && context.mounted) {
      Navigator.of(context).pop(true);
      if (supplier == null) {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.supplierAddedSuccessfully,
        );
      } else {
        showSuccessToast(
          context: context,
          title: _intl.successText,
          message: _intl.supplierUpdatedSuccessfully,
        );
      }
    }
    // Handle failed save operation
    else if (!saveSuccess && context.mounted) {
      showErrorToast(
        context: context,
        title: _intl.errorText,
        message: controller.errorMessage,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<AddSupplierController>(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return ShadDialog(
          title: Text(
            supplier == null
                ? AppInternationalizationService.to.addNewSupplier
                : AppInternationalizationService.to.updateSupplier,
          ),

          child: SizedBox(
            width: 500,

            child: ShadForm(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SupplierFormHeader(supplier: supplier),
                  const SizedBox(height: 20),

                  SupplierNameStatusFields(supplier: supplier),
                  const SizedBox(height: 16),

                  SupplierContactFields(supplier: supplier),
                  const SizedBox(height: 16),

                  SupplierAddressField(supplier: supplier),
                  const SizedBox(height: 16),

                  SupplierNotesField(supplier: supplier),
                  const SizedBox(height: 24),

                  const SupplierInfoCard(),
                  const SizedBox(height: 24),
                  SupplierActionButtons(
                    supplier: supplier,
                    onSave: () => _saveSupplier(context, controller),
                    onCancel: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
