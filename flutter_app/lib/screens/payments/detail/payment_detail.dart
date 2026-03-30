import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/formatters.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../widgets/custom_grid.dart';
import 'payment_detail_controller.dart';

/// A screen that displays details of a [Payment].
class PaymentDetail extends StatelessWidget {
  /// Creates a new [PaymentDetail] widget.
  const PaymentDetail({Key? key, required this.payment, this.onDeleted})
    : super(key: key);

  /// The payment to display.
  final VoidCallback? onDeleted;

  /// The current payment.
  final Payment payment;

  void _confirmDelete(BuildContext context) async {
    final result = await showShadDialog<bool>(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: Text(
          Intls.to.deleteConfirmation.trParams({'item': payment.refId}),
        ),
        description: Text(Intls.to.deleteConfirmationDescription),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.pop(context, false),
            child: Text(Intls.to.cancel),
          ),
          ShadButton.destructive(
            onPressed: () => Navigator.pop(context, true),
            child: Text(Intls.to.delete),
          ),
        ],
      ),
    );

    if (result == true && context.mounted) {
      await context.read<PaymentDetailController>().deletePayment();
      onDeleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    payment.refId,
                    style: theme.textTheme.h3.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      letterSpacing: -0.4,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    Intls.to.paymentMade,
                    style: theme.textTheme.muted.copyWith(fontSize: 13),
                  ),
                ],
              ),
              ShadButton.outline(
                size: ShadButtonSize.sm,
                onPressed: () => _confirmDelete(context),
                leading: Icon(
                  LucideIcons.trash2,
                  size: 13,
                  color: cs.destructive,
                ),
                decoration: ShadDecoration(
                  border: ShadBorder.all(
                    color: cs.destructive.withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  Intls.to.delete,
                  style: TextStyle(color: cs.destructive, fontSize: 12.5),
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),

          ShadCard(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${Intls.to.totalAmount}',
                  style: theme.textTheme.muted.copyWith(
                    fontSize: 11,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  Formatters.formatCurrency(payment.amount),
                  style: theme.textTheme.h2.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.7,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 14),

          ShadCard(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: CustomGrid(
                minItemWidth: 200,
                mainAxisExtent: 100,
                mainAxisSpacing: 16,
                crossSpacing: 16,
                children: [
                  _MetaTile(
                    label: Intls.to.date,
                    value: Formatters.fmtDate(payment.paymentDate.toDateTime()),
                  ),
                  _MetaTile(
                    label: Intls.to.paymentMethod,
                    value: payment.paymentMethod.label,
                  ),
                  _MetaTile(
                    label: Intls.to.supplier,
                    value: payment.receiverRef,
                  ),
                  _MetaTile(
                    label: Intls.to.referenceNumber,
                    value: payment.referenceNumber.isNotEmpty
                        ? payment.referenceNumber
                        : '-',
                  ),
                ],
              ),
            ),
          ),

          if (payment.notes.isNotEmpty) ...[
            const SizedBox(height: 14),
            ShadCard(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intls.to.notes,
                      style: theme.textTheme.muted.copyWith(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    Text(payment.notes, style: theme.textTheme.p),
                  ],
                ),
              ),
            ),
          ],
          if (payment.relatedDocs.isNotEmpty) ...[
            const SizedBox(height: 14),
            Text(Intls.to.bills, style: theme.textTheme.h4),
            const SizedBox(height: 8),
            ShadCard(
              padding: EdgeInsets.zero,
              child: Column(
                children: payment.relatedDocs
                    .map<Widget>(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              e.docId,
                              style: theme.textTheme.small.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              Formatters.formatCurrency(e.amount),
                              style: theme.textTheme.p,
                            ),
                          ],
                        ),
                      ),
                    )
                    .expand((e) => [e, const Divider(height: 1)])
                    .toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _MetaTile extends StatelessWidget {
  const _MetaTile({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: theme.textTheme.muted.copyWith(fontSize: 12)),
          const SizedBox(height: 3),
          Text(
            value,
            style: theme.textTheme.small.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
