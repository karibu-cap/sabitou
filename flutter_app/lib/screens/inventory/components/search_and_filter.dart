import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../inventory_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.read<InventoryController>();
    final categories =
        controller.invLevelSubject.valueOrNull
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
    final controller = context.read<InventoryController>();

    return ShadInput(
      controller: searchQueryController,
      placeholder: Text(Intls.to.searchForProduct),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: (value) => controller.searchQuery.add(value),
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
    final controller = context.read<InventoryController>();

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
    final controller = context.read<InventoryController>();

    return ShadSelect<StockStatus?>(
      placeholder: Text(Intls.to.status),
      options: [
        ...[
          StockStatus.STOCK_STATUS_OK,
          StockStatus.STOCK_STATUS_OUT_OF_STOCK,
          StockStatus.STOCK_STATUS_LOW,
        ].map(
          (status) => ShadOption<StockStatus?>(
            value: status,
            child: Text(status.label ?? Intls.to.status),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) =>
          Text(value?.label ?? Intls.to.status),
      allowDeselection: true,
      onChanged: (value) {
        controller.selectedStatus.add(value);
      },
    );
  }
}
