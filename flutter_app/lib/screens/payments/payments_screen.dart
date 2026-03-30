import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../../widgets/payments/form/payment_form.dart';
import '../../../widgets/payments/payment_card.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../themes/app_theme.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_business_view.dart';
import 'detail/payment_screen.dart';
import 'payments_controller.dart';
import 'payments_view_model.dart';

const double _kDesktopBreakpoint = 800;

/// The payment list screen.
class PaymentsScreen extends StatelessWidget {
  /// Constructor of new [PaymentsScreen].
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final store = userPreferences.store;

    if (store == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider<PaymentsController>(
      create: (_) =>
          PaymentsController(PaymentsViewModel(storeId: store.refId)),
      child: const _PaymentsAdaptiveLayout(),
    );
  }
}

class _PaymentsAdaptiveLayout extends StatelessWidget {
  const _PaymentsAdaptiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= _kDesktopBreakpoint;

        return isDesktop ? const _DesktopSplitView() : const _MobileListView();
      },
    );
  }
}

class _DesktopSplitView extends StatelessWidget {
  const _DesktopSplitView();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: cs.card,
              border: Border(right: BorderSide(color: cs.border)),
            ),
            child: const Column(
              children: [
                _PaymentsListHeader(showNewButton: true),
                _SearchAndFilters(),
                Expanded(child: _PaymentsList(isDesktop: true)),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Consumer<PaymentsController>(
            builder: (context, controller, child) {
              if (controller.selectedPayment != null) {
                return Stack(
                  children: [
                    Positioned.fill(
                      child: PaymentDetailScreen(
                        key: Key(controller.selectedPayment ?? ''),
                        paymentRefId: controller.selectedPayment ?? '',
                        onDeleted: () => controller.selectPayment(null),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(LucideIcons.x400),
                        onPressed: () => controller.selectPayment(null),
                      ),
                    ),
                  ],
                );
              }

              return const _EmptySelectionState();
            },
          ),
        ),
      ],
    );
  }
}

class _EmptySelectionState extends StatelessWidget {
  const _EmptySelectionState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(LucideIcons.banknote, size: 64, color: cs.muted),
          const SizedBox(height: 16),
          Text(Intls.to.paymentMade, style: theme.textTheme.large),
          const SizedBox(height: 8),
          Text(Intls.to.selectPaymentToSeeDetail, style: theme.textTheme.muted),
        ],
      ),
    );
  }
}

class _MobileListView extends StatelessWidget {
  const _MobileListView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _PaymentsListHeader(showNewButton: true),
        _SearchAndFilters(),
        Expanded(child: _PaymentsList(isDesktop: false)),
      ],
    );
  }
}

class _PaymentsListHeader extends StatelessWidget {
  const _PaymentsListHeader({required this.showNewButton});
  final bool showNewButton;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PaymentsController>(context, listen: false);
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: StreamBuilder<List<Payment>>(
        stream: controller.filteredPaymentsStream,
        builder: (context, snapshot) {
          final count = snapshot.data?.length ?? 0;

          return Row(
            children: [
              Container(
                width: 3,
                height: 28,
                decoration: const BoxDecoration(
                  color: SabitouColors.accent,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      Intls.to.paymentMade,
                      style: theme.textTheme.h4.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (count > 0) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: const BoxDecoration(
                          color: SabitouColors.accentSoft,
                          border: Border.fromBorderSide(
                            BorderSide(color: SabitouColors.accent),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Text(
                          '$count',
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w500,
                            color: SabitouColors.accentForeground,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              if (showNewButton)
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () => showPaymentForm(context),
                  leading: const Icon(LucideIcons.plus, size: 14),
                  child: Text(Intls.to.newText),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _SearchAndFilters extends StatelessWidget {
  const _SearchAndFilters();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PaymentsController>(context, listen: false);

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: ShadInput(
        placeholder: Text(Intls.to.search),
        leading: const Icon(LucideIcons.search, size: 16),
        onChanged: controller.searchQuery.add,
      ),
    );
  }
}

class _PaymentsList extends StatelessWidget {
  const _PaymentsList({required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PaymentsController>(context);

    return StreamBuilder<List<Payment>>(
      stream: controller.filteredPaymentsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Loading());
        }
        if (snapshot.hasError) {
          return LoadingFailedWidget(
            error: snapshot.error ?? Intls.to.unknownError,
          );
        }
        final payments = snapshot.data ?? [];
        if (payments.isEmpty) {
          return const _PaymentsEmptyState();
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
          itemCount: payments.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final payment = payments[i];
            final isSelected =
                isDesktop && controller.selectedPayment == payment.refId;

            return PaymentCard(
              payment: payment,
              isSelected: isSelected,
              onTap: () {
                if (isDesktop) {
                  controller.selectPayment(payment.refId);
                } else {
                  AppRouter.push(
                    context,
                    PagesRoutes.paymentDetail.create(
                      PaymentDetailParameters(paymentId: payment.refId),
                    ),
                  );
                }
              },
              onDelete: () => controller.deletePayment(payment.refId),
            );
          },
        );
      },
    );
  }
}

class _PaymentsEmptyState extends StatelessWidget {
  const _PaymentsEmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.banknote,
              size: 40,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 14),
            Text(
              Intls.to.noPayment,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              Intls.to.noPaymentDescription,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
