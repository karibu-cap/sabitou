import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import 'detail_tabs/history_tab.dart';
import 'detail_tabs/overview_tab.dart';
import 'detail_tabs/transactions_tab.dart';

/// Detail view for an inventory item showing overview, transactions, and history.
class InventoryDetailView extends StatelessWidget {
  /// The inventory item to display details for.
  final InventoryLevelWithProduct item;

  /// Callback when adjust stock button is pressed.
  final VoidCallback? onAdjustStock;

  /// Callback when close button is pressed.
  final VoidCallback? onClose;

  /// List of transactions for this item.
  final List<InventoryTransaction> transactions;

  /// Stream of selected transaction filter.
  final Stream<TransactionType?> transactionFilterStream;

  /// Updates the transaction filter.
  final void Function(TransactionType) updateTransactionFilter;

  /// Tabs controller — owns the selected-tab state so it survives rebuilds.
  final ShadTabsController<String> tabsController;

  /// Constructs a new [InventoryDetailView].
  const InventoryDetailView({
    required this.item,
    required this.transactions,
    required this.transactionFilterStream,
    required this.updateTransactionFilter,
    required this.tabsController,
    this.onAdjustStock,
    this.onClose,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final imageUrl = item.product.imagesLinksIds.isNotEmpty
        ? item.product.imagesLinksIds.first
        : item.globalProduct.imagesLinksIds.firstOrNull;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(AppConstants.spacingM),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      item.globalProduct.label,
                      style: theme.textTheme.h1,
                      maxFontSize: 18,
                    ),
                  ),
                  if (onAdjustStock != null)
                    ShadButton(
                      onPressed: onAdjustStock,
                      child: Text(Intls.to.adjustStock),
                    ),
                  const SizedBox(width: AppConstants.spacingS),
                  if (onClose != null)
                    IconButton(
                      icon: const Icon(LucideIcons.x400),
                      onPressed: onClose,
                      tooltip: Intls.to.close,
                    ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      spacing: 8,
                      children: [
                        ListTile(
                          title: Text(Intls.to.sellingPrince),
                          contentPadding: EdgeInsets.zero,
                          subtitle: Text(
                            Formatters.formatCurrency(
                              item.product.salePrice.toDouble(),
                            ),
                            style: theme.textTheme.h3,
                          ),
                        ),
                        if (item.product.hasDefaultPurchasePrice())
                          ListTile(
                            title: Text(Intls.to.pruchaseCost),
                            contentPadding: EdgeInsets.zero,
                            subtitle: Text(
                              Formatters.formatCurrency(
                                item.product.defaultPurchasePrice.toDouble(),
                              ),
                              style: theme.textTheme.h3,
                            ),
                          ),
                      ],
                    ),
                  ),
                  if (imageUrl != null)
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                        color: ShadTheme.of(context).colorScheme.accent,
                      ),
                      child: FutureBuilder<ResourceLink?>(
                        future: ResourceLinkRepository.instance.getResourceLink(
                          imageUrl,
                        ),
                        builder: (context, snapshot) {
                          final data = snapshot.data?.targetUri;
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.hasData &&
                              data != null) {
                            return ClipRRect(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(8),
                              ),
                              child: FadeInImage.assetNetwork(
                                placeholder: StaticImages.placeholder,
                                image: data,
                                placeholderCacheHeight: 30,
                                placeholderCacheWidth: 30,
                                fit: BoxFit.cover,
                                width: 70,
                                imageErrorBuilder:
                                    (context, error, stackTrace) {
                                      return const Icon(
                                        LucideIcons.package,
                                        size: 20,
                                      );
                                    },
                                placeholderErrorBuilder:
                                    (context, error, stackTrace) {
                                      return const Icon(
                                        LucideIcons.package,
                                        size: 20,
                                      );
                                    },
                              ),
                            );
                          }

                          return const SizedBox.shrink();
                        },
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
        const Divider(),
        Expanded(
          child: ShadTabs<String>(
            controller: tabsController,
            tabs: [
              ShadTab(
                value: Intls.to.overview,
                expandContent: true,
                content: ShadCard(child: OverviewTab(item: item)),
                child: Text(Intls.to.overview),
              ),
              ShadTab(
                value: Intls.to.transactions,
                expandContent: true,
                content: ShadCard(
                  child: TransactionsTab(
                    item: item,
                    transactions: transactions,
                    transactionFilterStream: transactionFilterStream,
                    updateTransactionFilter: updateTransactionFilter,
                  ),
                ),
                child: Text(Intls.to.transactions),
              ),
              ShadTab(
                value: Intls.to.history,
                expandContent: true,
                content: ShadCard(child: HistoryTab(item: item)),
                child: Text(Intls.to.history),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
