import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/extensions/global_product_extension.dart';
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
                  // Header
                  Row(
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        child: const Icon(
                          Icons.warning,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppInternationalizationService.to.deleteProduct,
                              style: theme.textTheme.h3.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.red,
                              ),
                            ),
                            Text(
                              AppInternationalizationService
                                  .to
                                  .thisActionIsIrreversible,
                              style: theme.textTheme.muted.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Error message
                  if (controller.errorMessage.isNotEmpty)
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.red.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        border: Border.all(
                          color: Colors.red.withValues(alpha: 0.3),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            color: Colors.red,
                            size: 16,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              controller.errorMessage,
                              style: theme.textTheme.p.copyWith(
                                color: Colors.red,
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

                  // Category info section
                  _GlobalProductInfoSection(controller: controller),

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

/// Global product information section
class _GlobalProductInfoSection extends StatelessWidget {
  final DeleteGlobalProductController controller;

  const _GlobalProductInfoSection({required this.controller});

  IconData _getStatusIcon(GlobalProductStatus status) {
    switch (status) {
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE:
        return LucideIcons.package;
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE:
        return LucideIcons.pause400;
      default:
        return LucideIcons.triangleAlert;
    }
  }

  Color _getStatusColor(GlobalProductStatus status) {
    switch (status) {
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE:
        return Colors.green;
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  String _getStatusLabel(GlobalProductStatus status) {
    switch (status) {
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE:
        return AppInternationalizationService.to.active;
      case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE:
        return AppInternationalizationService.to.inactive;
      default:
        return AppInternationalizationService.to.inactive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final globalProduct = controller.globalProduct;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.package, color: Colors.grey, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.deleteProduct,
                style: theme.textTheme.p.copyWith(
                  color: Colors.grey.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Row(
            children: [
              // Avatar placeholder
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                ),
                child: Icon(
                  LucideIcons.package,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      globalProduct.label,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          _getStatusIcon(globalProduct.status),
                          size: 12,
                          color: _getStatusColor(globalProduct.status),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getStatusLabel(globalProduct.status),
                          style: theme.textTheme.small.copyWith(
                            color: _getStatusColor(globalProduct.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),

                    Text(
                      globalProduct.about,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// Warning section
class _WarningSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.red.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.red.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.warning_amber, color: Colors.red, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.confirmationRequired,
                style: theme.textTheme.p.copyWith(
                  color: Colors.red,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            AppInternationalizationService.to.productWillBeRemovedPermanently,
            style: theme.textTheme.p.copyWith(
              color: Colors.red.withValues(alpha: 0.8),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
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

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.05),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.edit_outlined, color: Colors.orange, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.confirmationRequired,
                style: theme.textTheme.p.copyWith(
                  color: Colors.orange.withValues(alpha: 0.8),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Text(
            AppInternationalizationService.to.typeToConfirmDeletion.replaceAll(
              '{text}',
              controller.expectedConfirmationText,
            ),
            style: theme.textTheme.p.copyWith(
              color: Colors.orange.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 12),

          TextFormField(
            decoration: InputDecoration(
              hintText: controller.expectedConfirmationText,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                borderSide: BorderSide(
                  color: controller.isConfirmationValid
                      ? Colors.green
                      : Colors.orange,
                  width: 2,
                ),
              ),
              suffixIcon: controller.isConfirmationValid
                  ? const Icon(Icons.check_circle, color: Colors.green)
                  : null,
            ),
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
          trailing: controller.isLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 2,
                  ),
                )
              : null,

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
          backgroundColor: Colors.red,
          child: Text(
            AppInternationalizationService.to.deletePermanently,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
