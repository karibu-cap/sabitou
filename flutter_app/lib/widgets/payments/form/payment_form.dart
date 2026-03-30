import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../utils/user_preference.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/responsive_utils.dart';
import '../../loading.dart';
import '../../shad_scaffold.dart';
import 'payment_form_controller.dart';
import 'payment_form_sections.dart';

/// Opens the payment form in the appropriate presentation for the screen size.
/// * [bill] — opens in the context of a specific bill.
///
/// Returns `true` on a successful save, or `false`/`null` if cancelled.
Future<bool?> showPaymentForm(BuildContext context, {Bill? bill}) {
  final prefs = context.read<UserPreferences>();
  final storeId = prefs.store?.refId ?? '';
  final userId = prefs.user?.refId ?? '';

  final isMobile = ResponsiveUtils.isMobile(context);

  if (isMobile) {
    return Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) =>
            PaymentFormPage(storeId: storeId, userId: userId, bill: bill),
      ),
    );
  }

  return showShadDialog<bool>(
    context: context,
    builder: (context) =>
        PaymentFormDialog(storeId: storeId, userId: userId, bill: bill),
  );
}

/// Mobile full-page wrapper for the payment form.
class PaymentFormPage extends StatelessWidget {
  /// [PaymentFormPage].
  const PaymentFormPage({
    super.key,
    required this.storeId,
    required this.userId,
    this.bill,
  });

  final String storeId;
  final String userId;
  final Bill? bill;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ChangeNotifierProvider<PaymentFormController>(
      create: (_) =>
          PaymentFormController(storeId: storeId, userId: userId, bill: bill),
      child: Builder(
        builder: (context) => ShadScaffold(
          backgroundColor: cs.background,
          title: Text(
            Intls.to.newPayment,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          body: PaymentFormBody(
            onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
            onCancelled: () => Navigator.pop(context),
          ),
        ),
      ),
    );
  }
}

/// Desktop dialog wrapper for the payment form.
class PaymentFormDialog extends StatelessWidget {
  const PaymentFormDialog({
    super.key,
    required this.storeId,
    required this.userId,
    this.bill,
  });

  final String storeId;
  final String userId;
  final Bill? bill;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PaymentFormController>(
      create: (_) =>
          PaymentFormController(storeId: storeId, userId: userId, bill: bill),
      child: ShadDialog(
        constraints: const BoxConstraints(maxWidth: 500, maxHeight: 700),
        title: Text(Intls.to.newPayment),
        scrollable: false,
        description: bill != null
            ? Text(
                '${Intls.to.balanceDue}: ${bill?.balanceDue.toStringAsFixed(0)} XAF',
              )
            : null,
        child: PaymentFormBody(
          onSaved: (isSuccess) => Navigator.pop(context, isSuccess),
          onCancelled: () => Navigator.pop(context),
        ),
      ),
    );
  }
}

/// The scrollable form content shared between [PaymentFormPage] and [PaymentFormDialog].
class PaymentFormBody extends StatelessWidget {
  const PaymentFormBody({
    super.key,
    required this.onSaved,
    required this.onCancelled,
  });

  final ValueChanged<bool> onSaved;
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentFormSection1(),
                SizedBox(height: 16),
                PaymentFormSection2(),
                SizedBox(height: 16),
                PaymentFormSection4(),
                SizedBox(height: 16),
                PaymentFormNotesSection(),
                SizedBox(height: 8),
              ],
            ),
          ),
        ),
        _PaymentFormFooter(onSaved: onSaved, onCancelled: onCancelled),
      ],
    );
  }
}

/// Sticky footer containing the validation error banner and action buttons.
class _PaymentFormFooter extends StatelessWidget {
  const _PaymentFormFooter({required this.onSaved, required this.onCancelled});

  final ValueChanged<bool> onSaved;
  final VoidCallback onCancelled;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PaymentFormController>();
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Container(
      decoration: BoxDecoration(
        color: cs.card,
        border: Border(top: BorderSide(color: cs.border)),
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (ctrl.errorMessage.isNotEmpty) ...[
            _ValidationBanner(message: ctrl.errorMessage, theme: theme),
            const SizedBox(height: 10),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.outline(
                onPressed: ctrl.isLoading ? null : onCancelled,
                child: Text(Intls.to.cancel),
              ),
              const SizedBox(width: 10),
              ShadButton(
                onPressed: ctrl.isLoading ? null : () => _save(context),
                leading: ctrl.isLoading
                    ? const Loading.button()
                    : const Icon(LucideIcons.fileText, size: 14),
                child: Text(Intls.to.createPayment),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _save(BuildContext context) async {
    final ctrl = context.read<PaymentFormController>();
    final isSuccess = await ctrl.save();
    if (isSuccess != null && context.mounted) {
      onSaved(isSuccess);
    }
  }
}

/// Red banner displaying a validation or save error.
class _ValidationBanner extends StatelessWidget {
  const _ValidationBanner({required this.message, required this.theme});

  final String message;
  final ShadThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: SabitouColors.dangerSoft,
        borderRadius: BorderRadius.all(Radius.circular(8)),
        border: Border.fromBorderSide(BorderSide(color: SabitouColors.danger)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            LucideIcons.circleAlert,
            size: 14,
            color: SabitouColors.danger,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              message,
              style: theme.textTheme.p.copyWith(
                fontSize: 12.5,
                color: SabitouColors.dangerForeground,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => context.read<PaymentFormController>().clearError(),
            child: const Icon(
              LucideIcons.x,
              size: 13,
              color: SabitouColors.dangerForeground,
            ),
          ),
        ],
      ),
    );
  }
}
