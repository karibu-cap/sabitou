import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../widgets/mobile_scanner_view.dart';
import '../inventory_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<InventoryController>();
    final categories =
        controller.invLevelSubject.valueOrNull
            ?.map((p) => p.globalProduct.categories)
            .expand((c) => c)
            .map((c) => c.label)
            .toSet()
            .toList() ??
        [];

    final hasFilters =
        controller.searchQueryController.text.isNotEmpty ||
        controller.selectedCategory.value.isNotEmpty ||
        (controller.selectedStatus.value.isNotEmpty &&
            controller.selectedStatus.value.last != null);

    return ShadCard(
      padding: const EdgeInsets.all(24),
      child: LayoutBuilder(
        builder: (context, value) {
          final isMobile = value.maxWidth < 768;

          return Flex(
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
                    if (hasFilters)
                      ShadButton.outline(
                        onPressed: controller.clearFilters,
                        height: 32,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(LucideIcons.x, size: 12),
                            if (!isMobile) ...[
                              const SizedBox(width: 8),
                              Text(Intls.to.clear),
                            ],
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<InventoryController>();

    return ShadInput(
      controller: controller.searchQueryController,
      placeholder: Text(Intls.to.searchForProduct),
      leading: const Icon(LucideIcons.search, size: 16),
      trailing: kIsWeb
          ? null
          : MobileScannerView(
              onResult: (result) {
                controller.searchQueryController.text = result;
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
    final controller = context.watch<InventoryController>();
    final selectedValue = controller.selectedCategory;

    return ShadSelect<String>(
      key: ValueKey('category_$selectedValue'),
      placeholder: AutoSizeText(
        Intls.to.categories,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      options: [
        ...categories.map(
          (category) => ShadOption(value: category, child: Text(category)),
        ),
      ],
      selectedOptionBuilder: (context, value) =>
          AutoSizeText(value, maxLines: 1, overflow: TextOverflow.ellipsis),
      allowDeselection: true,
      controller: controller.selectedCategory,
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<InventoryController>();

    return ShadSelect<StockStatus?>(
      key: ValueKey('status_${controller.selectedStatus.value}'),
      placeholder: Text(Intls.to.status),
      options: [
        ...[
          StockStatus.STOCK_STATUS_OK,
          StockStatus.STOCK_STATUS_OUT_OF_STOCK,
          StockStatus.STOCK_STATUS_LOW,
        ].map(
          (status) => ShadOption<StockStatus?>(
            value: status,
            child: Text(status.label ?? Intls.to.status, maxLines: 1),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) => AutoSizeText(
        value?.label ?? Intls.to.status,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      allowDeselection: true,
      controller: controller.selectedStatus,
    );
  }
}
