import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../widgets/error/loading_failed.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_data_table.dart';
import 'list_components/supplier_empty_state.dart';
import 'list_components/supplier_list_header.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Widget for displaying the list of suppliers.
///
/// This is the main suppliers list widget that orchestrates the display
/// of suppliers using modular components for better maintainability.
class SuppliersList extends StatelessWidget {
  /// Creates a new [SuppliersList].
  const SuppliersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);

    return StreamBuilder<List<StoreProduct>>(
      stream: controller.productsStream,
      builder: (context, productsSnapshot) {
        final products = productsSnapshot.data ?? [];

        return ShadCard(
          padding: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: SupplierListHeader(),
              ),
              const SizedBox(height: 16),

              StreamBuilder<List<Supplier>>(
                stream: controller.filteredSuppliersStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SupplierShimmerWidgets.buildTableShimmer();
                  }
                  final error = snapshot.error;
                  if (snapshot.hasError && error != null) {
                    return LoadingFailedWidget(error: error);
                  }
                  final suppliers = snapshot.data ?? [];
                  if (suppliers.isEmpty) {
                    return const SuppliersEmptyState();
                  }

                  return SupplierDataTable(
                    suppliers: suppliers,
                    products: products,
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
