// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import 'purchase_orders_controller.dart';
// import 'purchase_orders_view_model.dart';

// /// Standalone purchase order detail screen for mobile navigation.
// ///
// /// On desktop the detail is shown inline in the master-detail split view.
// /// On mobile, navigating to a purchase order pushes this screen.
// final class PurchaseOrderDetailScreen extends StatelessWidget {
//   /// The purchase order ID to display.
//   final String purchaseOrderId;

//   /// Constructs a new [PurchaseOrderDetailScreen].
//   const PurchaseOrderDetailScreen({
//     super.key,
//     required this.purchaseOrderId,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (_) => PurchaseOrdersController(
//         PurchaseOrdersViewModel(),
//       ),
//       child: _PurchaseOrderDetailBody(purchaseOrderId: purchaseOrderId),
//     );
//   }
// }

// class _PurchaseOrderDetailBody extends StatefulWidget {
//   final String purchaseOrderId;

//   const _PurchaseOrderDetailBody({required this.purchaseOrderId});

//   @override
//   State<_PurchaseOrderDetailBody> createState() =>
//       _PurchaseOrderDetailBodyState();
// }

// class _PurchaseOrderDetailBodyState extends State<_PurchaseOrderDetailBody> {
//   @override
//   void initState() {
//     super.initState();
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       context
//           .read<PurchaseOrdersController>()
//           .loadOrderDetail(widget.purchaseOrderId);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // TODO(human): implement UI
//     return const SizedBox.shrink();
//   }
// }
