import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import 'purchase_receives_controller.dart';
import 'purchase_receives_view_model.dart';

/// Read-only purchase receives list screen, accessible from the dashboard navigation.
/// Creation of receiving notes is handled from the Purchase Order detail screen.
final class PurchaseReceivesScreen extends StatelessWidget {
  /// Constructs a new [PurchaseReceivesScreen].
  const PurchaseReceivesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel =
        GetIt.I.registerSingletonIfAbsent<PurchaseReceivesViewModel>(
      PurchaseReceivesViewModel.new,
    );

    return ChangeNotifierProvider(
      create: (_) => PurchaseReceivesController(viewModel),
      child: const _PurchaseReceivesBody(),
    );
  }
}

class _PurchaseReceivesBody extends StatelessWidget {
  const _PurchaseReceivesBody();

  @override
  Widget build(BuildContext context) {
    // TODO(human): implement UI
    return const SizedBox.shrink();
  }
}
