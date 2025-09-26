import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/common_functions.dart';
import '../../../../../utils/extensions/category_extension.dart';
import '../../../categories_controller.dart';
import 'delete_category_controller.dart';

/// Modal for viewing and modifying user permissions.
class DeleteCategoryDialog extends StatelessWidget {
  /// The category.
  final Category category;

  /// The categories controller.
  final CategoriesController categoriesController;

  /// Constructs a new CategoryFormDialog.
  DeleteCategoryDialog({
    super.key,
    required this.categoriesController,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DeleteCategoryController(
        intl: AppInternationalizationService.to,
        categoriesController: categoriesController,
        category: category,
      ),
      child: _DeleteCategoryDialogContent(category: category),
    );
  }
}

/// Content widget for the user deletion modal
class _DeleteCategoryDialogContent extends StatelessWidget {
  const _DeleteCategoryDialogContent({required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Consumer<DeleteCategoryController>(
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
                              AppInternationalizationService.to.deleteCategory,
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
                  _CategoryInfoSection(controller: controller),

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

/// Category information section
class _CategoryInfoSection extends StatelessWidget {
  final DeleteCategoryController controller;

  const _CategoryInfoSection({required this.controller});

  IconData _getStatusIcon(CategoryStatus status) {
    switch (status) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return Icons.category;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return LucideIcons.pause400;
      default:
        return LucideIcons.triangleAlert;
    }
  }

  Color _getStatusColor(CategoryStatus status) {
    switch (status) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return Colors.green;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return Colors.grey;
      default:
        return Colors.grey;
    }
  }

  String _getStatusLabel(CategoryStatus status) {
    switch (status) {
      case CategoryStatus.CATEGORY_STATUS_ACTIVE:
        return AppInternationalizationService.to.active;
      case CategoryStatus.CATEGORY_STATUS_INACTIVE:
        return AppInternationalizationService.to.inactive;
      default:
        return AppInternationalizationService.to.inactive;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final category = controller.category;

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
              const Icon(Icons.person_outline, color: Colors.grey, size: 16),
              const SizedBox(width: 8),
              Text(
                AppInternationalizationService.to.deleteCategory,
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
                  Icons.category,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),

              // User details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${category.label}',
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(
                          _getStatusIcon(category.status),
                          size: 12,
                          color: _getStatusColor(category.status),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _getStatusLabel(category.status),
                          style: theme.textTheme.small.copyWith(
                            color: _getStatusColor(category.status),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
            AppInternationalizationService.to.categoryWillBeRemovedPermanently,
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
  final DeleteCategoryController controller;

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
  final DeleteCategoryController controller;

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
            final success = await controller.deleteUser();
            if (success && context.mounted) {
              showSuccessToast(
                context: context,
                message: AppInternationalizationService
                    .to
                    .categoryDeletedSuccessfully,
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
