import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_scaffold.dart';
import '../components/empty_detail.dart';
import 'bill_detail.dart';
import 'bill_detail_controller.dart';
import 'bill_detail_view_model.dart';

/// The [BillDetailScreen].
class BillDetailScreen extends StatelessWidget {
  /// Constructor of new [BillDetailScreen].
  const BillDetailScreen({
    super.key,
    required this.billRefId,
    this.onDeleted,
    this.onMarkedPaid,
    this.canSplitTheScreen = false,
  });

  /// The bill ref id.
  final String billRefId;

  /// Callback to be called when the bill is deleted.
  final VoidCallback? onDeleted;

  /// Callback to be called when the bill is marked as paid.
  final VoidCallback? onMarkedPaid;

  /// Can split the screen.
  final bool canSplitTheScreen;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => BillDetailController(
        viewModel: BillDetailViewModel(billId: billRefId),
        intl: AppInternationalizationService.to,
      ),
      child: Consumer<BillDetailController>(
        builder: (context, controller, child) {
          return ShadScaffold(
            title: Text(billRefId),
            body: StreamBuilder(
              stream: controller.detailStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting ||
                    controller.isLoading && !snapshot.hasData) {
                  return const Center(child: Loading());
                }

                if (controller.errorMessage.isNotEmpty && !snapshot.hasData) {
                  return _ErrorBody(message: controller.errorMessage);
                }

                final snapshot_ = snapshot.data;
                final bill = snapshot_?.bill;
                if (snapshot_ == null || bill == null) {
                  return const EmptyDetailState();
                }

                return BillDetail(
                  bill: bill,
                  payments: snapshot_.payments,
                  onDeleted: () => onDeleted == null
                      ? AppRouter.go(context, PagesRoutes.bills.pattern)
                      : onDeleted?.call(),
                  onMarkedPaid: onMarkedPaid,
                  canSplitTheScreen: canSplitTheScreen,
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ErrorBody extends StatelessWidget {
  const _ErrorBody({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(LucideIcons.circleAlert, size: 40, color: cs.mutedForeground),
            const SizedBox(height: 14),
            Text(
              message,
              style: theme.textTheme.p.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
