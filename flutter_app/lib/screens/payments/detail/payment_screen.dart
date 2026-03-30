import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../../router/app_router.dart';
import '../../../../router/page_routes.dart';
import '../../../../widgets/loading.dart';
import '../../../../widgets/shad_scaffold.dart';
import 'payment_detail.dart';
import 'payment_detail_controller.dart';
import 'payment_detail_view_model.dart';

/// A screen that displays details of a [Payment].
class PaymentDetailScreen extends StatelessWidget {
  /// Creates a [PaymentDetailScreen].
  ///
  /// The [paymentRefId] parameter must not be null.
  const PaymentDetailScreen({
    super.key,
    required this.paymentRefId,
    this.onDeleted,
  });

  /// The reference ID of the [Payment] to display.
  final String paymentRefId;

  /// Callback to be called when the bill is deleted.
  final VoidCallback? onDeleted;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PaymentDetailController(
        viewModel: PaymentDetailViewModel(paymentId: paymentRefId),
      ),
      child: Consumer<PaymentDetailController>(
        builder: (context, controller, child) {
          return ShadScaffold(
            title: Text(paymentRefId),
            body: FutureBuilder<Payment?>(
              future: controller.paymentFuture,
              builder: (context, snapshot) {
                final payment = snapshot.data;

                if (snapshot.connectionState != ConnectionState.done ||
                    payment == null) {
                  return const Loading();
                }

                return PaymentDetail(
                  payment: payment,
                  onDeleted: () => onDeleted == null
                      ? AppRouter.go(context, PagesRoutes.payments.pattern)
                      : onDeleted?.call(),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
