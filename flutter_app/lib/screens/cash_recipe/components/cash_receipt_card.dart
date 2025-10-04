import 'package:flutter/material.dart';
import 'package:printing/printing.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/pdf/template/pos_template.dart';

/// A beautiful card widget to display cash receipt information in a grid layout
class CashReceiptCard extends StatelessWidget {
  /// The cash receipt to display
  final CashReceipt cashReceipt;

  /// Callback when card is tapped
  final VoidCallback? onTap;

  /// Constructor for CashReceiptCard
  const CashReceiptCard({super.key, required this.cashReceipt, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cashReceipt.documentId,
                                style: ShadTheme.of(context).textTheme.p
                                    .copyWith(fontWeight: FontWeight.bold),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                _formatDate(
                                  cashReceipt.transactionTime.toDateTime(),
                                ),
                                style: ShadTheme.of(
                                  context,
                                ).textTheme.muted.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        ShadBadge(
                          backgroundColor: _getStatusColor().withValues(
                            alpha: 0.1,
                          ),
                          child: Text(
                            AppInternationalizationService.to.total,
                            style: TextStyle(
                              color: _getStatusColor(),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Icon(
                                LucideIcons.user,
                                size: 14,
                                color: ShadTheme.of(
                                  context,
                                ).colorScheme.mutedForeground,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                cashReceipt.hasCashierUserId()
                                    ? 'Cashier: ${cashReceipt.cashierUserId}'
                                    : 'System',
                                style: ShadTheme.of(
                                  context,
                                ).textTheme.muted.copyWith(fontSize: 11),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        if (cashReceipt.hasCustomerId()) ...[
                          const SizedBox(width: 8),
                          Expanded(
                            child: Row(
                              children: [
                                Icon(
                                  LucideIcons.userCheck,
                                  size: 14,
                                  color: ShadTheme.of(
                                    context,
                                  ).colorScheme.mutedForeground,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  cashReceipt.customerId,
                                  style: ShadTheme.of(
                                    context,
                                  ).textTheme.muted.copyWith(fontSize: 11),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: ShadTheme.of(
                          context,
                        ).colorScheme.secondary.withValues(alpha: 0.1),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(6),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                LucideIcons.package,
                                size: 14,
                                color: ShadTheme.of(
                                  context,
                                ).colorScheme.mutedForeground,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${cashReceipt.items.length} ${AppInternationalizationService.to.items}',
                                style: ShadTheme.of(context).textTheme.muted
                                    .copyWith(
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          ...cashReceipt.items
                              .take(2)
                              .map(
                                (item) => Padding(
                                  padding: const EdgeInsets.only(bottom: 2),
                                  child: Text(
                                    '• ${item.label} (${item.quantity})',
                                    style: ShadTheme.of(
                                      context,
                                    ).textTheme.muted.copyWith(fontSize: 10),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                          if (cashReceipt.items.length > 2) ...[
                            Text(
                              '+${cashReceipt.items.length - 2} more items',
                              style: ShadTheme.of(context).textTheme.muted
                                  .copyWith(
                                    fontSize: 10,
                                    fontStyle: FontStyle.italic,
                                  ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppInternationalizationService.to.subtotal,
                              style: ShadTheme.of(
                                context,
                              ).textTheme.muted.copyWith(fontSize: 12),
                            ),
                            Text(
                              Formatters.formatCurrency(cashReceipt.subtotal),
                              style: ShadTheme.of(
                                context,
                              ).textTheme.p.copyWith(fontSize: 12),
                            ),
                          ],
                        ),
                        if (cashReceipt.hasTaxAmount() &&
                            cashReceipt.taxAmount > 0) ...[
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${AppInternationalizationService.to.totalVat}:',
                                style: ShadTheme.of(
                                  context,
                                ).textTheme.muted.copyWith(fontSize: 12),
                              ),
                              Text(
                                Formatters.formatCurrency(
                                  cashReceipt.taxAmount,
                                ),
                                style: ShadTheme.of(
                                  context,
                                ).textTheme.p.copyWith(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 6,
                            horizontal: 8,
                          ),
                          decoration: BoxDecoration(
                            color: _getStatusColor().withValues(alpha: 0.1),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                AppInternationalizationService.to.total
                                    .toUpperCase(),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: _getStatusColor(),
                                ),
                              ),
                              Text(
                                Formatters.formatCurrency(
                                  cashReceipt.totalAmount,
                                ),
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: _getStatusColor(),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: ShadButton.outline(
                    size: ShadButtonSize.sm,
                    onPressed: () => _showReceiptPreview(context),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(LucideIcons.eye, size: 14),
                        const SizedBox(width: 4),
                        Text(AppInternationalizationService.to.preview),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ShadButton(
                    size: ShadButtonSize.sm,
                    onPressed: () => _printReceipt(context),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(LucideIcons.printer, size: 14),
                        SizedBox(width: 4),
                        Text('Print'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showReceiptPreview(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: PdfPreview(
            build: (format) async {
              final store = UserPreferences.instance.store;
              if (store == null) {
                throw Exception('Store information not available');
              }
              final posTemplate = PosTemplate(
                cashReceipt: cashReceipt,
                store: store,
              );

              return posTemplate.buildPdfInvoiceMini(format);
            },
          ),
        ),
      ),
    );
  }

  void _printReceipt(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Print functionality will be implemented')),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm', Intl.getCurrentLocale()).format(date);
  }

  Color _getStatusColor() {
    if (cashReceipt.hasOwedToCustomer() && cashReceipt.owedToCustomer > 0) {
      return Colors.orange;
    }
    if (cashReceipt.hasAmountPaid() && cashReceipt.amountPaid > 0) {
      return Colors.green;
    }

    return Colors.blue;
  }
}
