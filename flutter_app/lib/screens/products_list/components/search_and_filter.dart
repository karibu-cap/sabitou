import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/store_extenxion.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../products_list_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.read<ProductsListController>();
    final categories =
        controller.productsSubject.valueOrNull
            ?.map((p) => p.globalProduct.categories)
            .expand((c) => c)
            .map((c) => c.label)
            .toSet()
            .toList() ??
        [];

    return ShadCard(
      padding: const EdgeInsets.all(24),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        spacing: 12,
        children: [
          Expanded(flex: isMobile ? 0 : 2, child: _SearchInput()),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Row(
              spacing: 12,
              children: [
                if (categories.isNotEmpty)
                  Expanded(child: _CategoryFilter(categories: categories)),
                const Expanded(child: _StatusFilter()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  final TextEditingController searchQueryController = TextEditingController();
  _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductsListController>();

    return ShadInput(
      controller: searchQueryController,
      placeholder: Text(Intls.to.searchForProduct),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: controller.searchQuery.add,
      trailing: kIsWeb
          ? null
          : MobileScannerView(
              onResult: (result) {
                searchQueryController.text = result;
                controller.searchQuery.add(result);
              },
            ),
    );
  }
}

class _CategoryFilter extends StatelessWidget {
  const _CategoryFilter({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductsListController>();

    return ShadSelect<String>(
      placeholder: Text(Intls.to.allCategories),
      options: [
        ...categories.map(
          (category) => ShadOption(value: category, child: Text(category)),
        ),
      ],
      selectedOptionBuilder: (context, value) => Text(value),
      allowDeselection: true,
      onChanged: (value) {
        controller.selectedCategory.add(value ?? '');
      },
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<ProductsListController>();

    return ShadSelect<ProductStatus?>(
      placeholder: Text(Intls.to.status),
      options: [
        ...[
          ProductStatus.PRODUCT_STATUS_ACTIVE,
          ProductStatus.PRODUCT_STATUS_INACTIVE,
        ].map(
          (status) => ShadOption<ProductStatus?>(
            value: status,
            child: Text(status.label),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) =>
          Text(value?.label ?? Intls.to.status),
      allowDeselection: true,
      onChanged: controller.selectedStatus.add,
    );
  }
}
