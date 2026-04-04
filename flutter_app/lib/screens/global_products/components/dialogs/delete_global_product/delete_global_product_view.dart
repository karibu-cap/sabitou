import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../../services/internationalization/internationalization.dart';
import '../../../../../themes/app_theme.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../widgets/loading.dart';
import '../../../global_products_controller.dart';
import 'delete_global_product_controller.dart';

/// Modal for viewing and modifying user permissions.
class DeleteGlobalProductDialog extends StatelessWidget {
  /// The global product.
  final GlobalProduct globalProduct;

  /// The global products controller.
  final GlobalProductsController globalProductsController;

  /// Constructs a new CategoryFormDialog.
  DeleteGlobalProductDialog({
    super.key,
    required this.globalProductsController,
    required this.globalProduct,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeleteGlobalProductController(
        intl: AppInternationalizationService.to,
        globalProductsController: globalProductsController,
        globalProduct: globalProduct,
      ),
      child: _DeleteGlobalProductDialogContent(globalProduct: globalProduct),
    );
  }
}

/// Content widget for the user deletion modal
class _DeleteGlobalProductDialogContent extends StatelessWidget {
  const _DeleteGlobalProductDialogContent({required this.globalProduct});

  final GlobalProduct globalProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteGlobalProductController>(
      builder: (context, controller, _) {
        final theme = ShadTheme.of(context);

        return Material(
          color: theme.colorScheme.background,
          child: Container(
            width: 500,
            constraints: const BoxConstraints(maxHeight: 600),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),

                  // Error message
                  if (controller.errorMessage.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: SabitouColors.danger.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: SabitouColors.danger.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: SabitouColors.danger,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              controller.errorMessage,
                              style: theme.textTheme.p.copyWith(
                                color: SabitouColors.danger,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: controller.clearError,
                            icon: const Icon(LucideIcons.x, size: 16),
                          ),
                        ],
                      ),
                    ),

                  if (controller.errorMessage.isNotEmpty)
                    const SizedBox(height: 8),

                  // Warning section
                  _WarningSection(),

                  const SizedBox(height: 8),

                  // Confirmation section
                  _ConfirmationSection(controller: controller),

                  const SizedBox(height: 8),

                  // Action buttons
                  _ActionButtons(controller: controller),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

/// Warning section
class _WarningSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.warning_amber),
            const SizedBox(width: 8),
            Text(AppInternationalizationService.to.confirmationRequired),
          ],
        ),
        Text(AppInternationalizationService.to.productWillBeRemovedPermanently),
        const SizedBox(height: 8),
      ],
    );
  }
}

/// Confirmation section
class _ConfirmationSection extends StatelessWidget {
  final DeleteGlobalProductController controller;

  const _ConfirmationSection({required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      backgroundColor: SabitouColors.dangerSoft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            children: [
              const Icon(
                LucideIcons.circleAlert,
                color: SabitouColors.danger,
                size: 16,
              ),
              Text(
                AppInternationalizationService.to.confirmationRequired,
                style: theme.textTheme.p.copyWith(
                  color: SabitouColors.danger,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          SelectableText(
            AppInternationalizationService.to.typeToConfirmDeletion.replaceAll(
              '{text}',
              controller.expectedConfirmationText,
            ),
            style: theme.textTheme.p.copyWith(
              color: SabitouColors.danger,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),
          ShadInput(
            placeholder: Text(controller.expectedConfirmationText),
            onChanged: controller.updateConfirmationText,
            enabled: !controller.isLoading,
          ),
        ],
      ),
    );
  }
}

/// Action buttons section
class _ActionButtons extends StatelessWidget {
  final DeleteGlobalProductController controller;

  const _ActionButtons({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(
          onPressed: controller.isLoading
              ? null
              : () => Navigator.of(context).pop(),
          child: Text(AppInternationalizationService.to.cancel),
        ),
        const SizedBox(width: 12),
        ShadButton(
          trailing: controller.isLoading ? const Loading.button() : null,

          enabled: controller.canDelete && !controller.isLoading,
          onPressed: () async {
            final success = await controller.deleteGlobalProduct();
            if (success && context.mounted) {
              showSuccessToast(
                context: context,
                message: AppInternationalizationService
                    .to
                    .productDeletedSuccessfully,
              );
              Navigator.of(context).pop(true);
            }
          },
          backgroundColor: SabitouColors.danger,
          child: Text(
            AppInternationalizationService.to.deletePermanently,
            style: const TextStyle(color: SabitouColors.accentSoft),
          ),
        ),
      ],
    );
  }
}
