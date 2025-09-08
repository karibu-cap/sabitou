import 'package:flutter/material.dart';

import '../../../../services/internationalization/internationalization.dart';

/// Header widget for suppliers list.
class SupplierListHeader extends StatelessWidget {
  /// Creates a new [SupplierListHeader].
  const SupplierListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          intl.suppliersTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
