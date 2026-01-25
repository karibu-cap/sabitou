import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

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
    return Padding(
      padding: const EdgeInsets.all(AppConstants.spacingM),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: AppConstants.spacingL,
          children: [
            // Primary Details Section
            _BuildSection(
              title: Intls.to.primaryDetails,
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
              ],
            ),

            // Stock Summary Section
            _BuildSection(
              title: Intls.to.accountingStock,
              children: [
                _BuildDetailRow(
                  label: Intls.to.stockOnHand,
                  value: item.level.quantityOnHand.toString(),
                ),
                _BuildDetailRow(
                  label: Intls.to.committedStock,
                  value: item.level.quantityCommitted.toString(),
                ),
                _BuildDetailRow(
                  label: Intls.to.availableForSale,
                  value: item.level.quantityAvailable.toString(),
                ),
              ],
            ),

            // Purchase Information Section
            if (item.level.batches.isNotEmpty)
              _BuildSection(
                title: Intls.to.purchaseInformation,
                children: [
                  // Show cost prices from batches
                  ...item.level.batches
                      .where(
                        (batch) =>
                            batch.status == BatchStatus.BATCH_STATUS_ACTIVE,
                      )
                      .map(
                        (batch) => _BuildDetailRow(
                          label: '${Intls.to.costPrice} (${batch.documentId})',
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
                ],
              ),

            // Opening Stock
            _BuildSection(
              title: Intls.to.openingStock,
              children: [
                _BuildDetailRow(
                  label: '',
                  value: item.level.quantityOnHand.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildSection extends StatelessWidget {
  const _BuildSection({required this.title, required this.children});

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: AppConstants.spacingS,
      children: [
        Text(
          title,
          style: theme.textTheme.table.copyWith(fontWeight: FontWeight.bold),
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
