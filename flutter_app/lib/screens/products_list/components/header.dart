import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';
import '../products_list_controller.dart';
import 'form/create_edit_product_form_view.dart';

/// The products list header.
class ProductsListHeader extends StatelessWidget {
  /// Constructs of new [ProductsListHeader].
  const ProductsListHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    void _showProductDialog(
      BuildContext context,
      StoreProductWithGlobalProduct? product,
    ) async {
      final controller = context.read<ProductsListController>();

      await showShadDialog<bool?>(
        context: context,
        builder: (context) => CreateEditProductFormView(
          product: product?.globalProduct,
          productsListController: controller,
        ),
      );
    }

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Intls.to.productsListManagement, style: theme.textTheme.h4),
            const SizedBox(height: 4),
          ],
        ),
        if (!isDesktop) const SizedBox(height: 16),
        ShadButton(
          onPressed: () => _showProductDialog(context, null),
          leading: const Icon(LucideIcons.plus, size: 16),
          child: Text(Intls.to.addProduct),
        ),
      ],
    );
  }
}
