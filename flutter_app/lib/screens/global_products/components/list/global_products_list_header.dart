import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Header widget for categories list.
class GlobalProductsListHeader extends StatelessWidget {
  /// Creates a new [GlobalProductsListHeader].
  const GlobalProductsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          intl.products,
          style: theme.textTheme.h4.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
