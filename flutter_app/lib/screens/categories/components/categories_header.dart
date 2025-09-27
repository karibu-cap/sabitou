import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/responsive_utils.dart';
import '../../../widgets/pop_up/add_category/add_category_view.dart';

/// Header widget for categories view.
class CategoriesHeader extends StatelessWidget {
  /// Construts a new CategoriesHeader.
  const CategoriesHeader({super.key});

  /// Show category dialog for adding or editing
  void _showCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => ShadDialog(child: CategoryFormDialog()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppInternationalizationService.to.categoryManagement,
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 4),
            Text(
              AppInternationalizationService.to.manageCategories,
              style: theme.textTheme.muted,
            ),
          ],
        ),
        ShadButton(
          onPressed: () => _showCategoryDialog(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add, size: 16),
              const SizedBox(width: 8),
              Text(AppInternationalizationService.to.addCategory),
            ],
          ),
        ),
      ],
    );
  }
}
