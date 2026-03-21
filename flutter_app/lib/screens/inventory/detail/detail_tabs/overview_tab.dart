import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../repositories/inventory_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/app_constants.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/formatters.dart';

/// Overview tab showing primary details, stock summary, and purchase information.
class OverviewTab extends StatelessWidget {
  /// The inventory item to display.
  final InventoryLevelWithProduct item;

  /// Constructs a new [OverviewTab].
  const OverviewTab({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: InventoryRepository.instance.watchProductInventory(
        item.product.refId,
        item.level.storeId,
      ),
      builder: (context, asyncSnapshot) {
        final inventory = asyncSnapshot.data;
        final level = inventory ?? item.level;

        return Padding(
          padding: const EdgeInsets.all(AppConstants.spacingM),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: AppConstants.spacingL,
              children: [
                // Stock Summary Section
                _BuildSection(
                  icon: LucideIcons.blocks400,
                  title: Intls.to.stockSummary,
                  children: [
                    _BuildDetailRow(
                      label: Intls.to.stockOnHand,
                      value: level.quantityOnHand.toString(),
                    ),
                    _BuildDetailRow(
                      label: Intls.to.committedStock,
                      value: level.quantityCommitted.toString(),
                    ),
                    _BuildDetailRow(
                      label: Intls.to.availableForSale,
                      value: level.quantityAvailable.toString(),
                    ),
                  ],
                ),

                _BuildSection(
                  title: Intls.to.salesAndPurchaseInformation,
                  icon: LucideIcons.trendingUp400,
                  children: [
                    _BuildDetailRow(
                      label: Intls.to.salePrice,
                      value: Formatters.formatCurrency(
                        item.product.salePrice.toDouble(),
                      ),
                    ),
                    if (item.level.batches.isNotEmpty)
                      ...item.level.batches
                          .where(
                            (batch) =>
                                batch.status == BatchStatus.BATCH_STATUS_ACTIVE,
                          )
                          .map(
                            (batch) => _BuildDetailRow(
                              label: '${Intls.to.costPrice} (${batch.refId})',
                              value: Formatters.formatCurrency(
                                batch.purchasePrice.toDouble(),
                              ),
                            ),
                          ),
                    if (item.level.batches.any((b) => b.supplierId.isNotEmpty))
                      _BuildDetailRow(
                        label: Intls.to.supplier,
                        value: item.level.batches
                            .where((b) => b.supplierId.isNotEmpty)
                            .map((b) => b.supplierId)
                            .toSet()
                            .join(', '),
                      ),

                    if (item.product.hasDefaultPurchasePrice())
                      _BuildDetailRow(
                        label: Intls.to.pruchaseCost,
                        value: Formatters.formatCurrency(
                          item.product.defaultPurchasePrice.toDouble(),
                        ),
                      ),
                  ],
                ),

                _BuildSection(
                  icon: LucideIcons.layoutGrid400,
                  title: Intls.to.moreInformation,
                  children: [
                    _BuildDetailRow(
                      label: Intls.to.productName,
                      value: item.globalProduct.label,
                    ),
                    _BuildDetailRow(
                      label: Intls.to.sku,
                      value: item.product.sku.isNotEmpty
                          ? item.product.sku
                          : Intls.to.notAvailable,
                    ),
                    _BuildDetailRow(
                      label: Intls.to.codeBar,
                      value: item.globalProduct.barCodeValue.isNotEmpty
                          ? item.globalProduct.barCodeValue
                          : Intls.to.notAvailable,
                    ),
                    _BuildDetailRow(
                      label: Intls.to.openingStock,
                      value: item.product.openingStock.toString(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _BuildSection extends StatelessWidget {
  const _BuildSection({
    required this.title,
    required this.children,
    required this.icon,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstants.spacingS,
      children: [
        Row(
          spacing: 8,
          children: [
            Icon(icon, color: theme.colorScheme.mutedForeground),
            Text(
              title,
              style: theme.textTheme.table.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        ShadCard(child: Column(children: children)),
      ],
    );
  }
}

class _BuildDetailRow extends StatelessWidget {
  const _BuildDetailRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM,
        vertical: AppConstants.spacingS,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.border.withValues(alpha: 0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          if (label.isNotEmpty)
            Expanded(
              child: Text(
                label,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.ring,
                ),
              ),
            ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: label.isEmpty ? TextAlign.left : TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
