import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
  });

  /// The bill ref id.
  final String billRefId;

  /// Callback to be called when the bill is deleted.
  final VoidCallback? onDeleted;

  /// Callback to be called when the bill is marked as paid.
  final VoidCallback? onMarkedPaid;

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
            body: FutureBuilder<bool>(
              future: controller.completer.future,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return const Loading();
                }

                return StreamBuilder(
                  stream: controller.billItemStream.stream,
                  builder: (context, asyncSnapshot) {
                    final bill = asyncSnapshot.data;

                    if (bill == null) {
                      return const EmptyDetailState();
                    }

                    return BillDetail(
                      bill: bill,
                      onDeleted: () => onDeleted == null
                          ? AppRouter.go(context, PagesRoutes.bills.pattern)
                          : onDeleted?.call(),
                      onMarkedPaid: onMarkedPaid,
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
