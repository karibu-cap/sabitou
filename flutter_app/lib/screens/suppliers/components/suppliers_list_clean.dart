import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../suppliers_controller.dart';
import 'list_components/supplier_data_table.dart';
import 'list_components/supplier_empty_state.dart';
import 'list_components/supplier_list_header.dart';

/// Widget for displaying the list of suppliers.
///
/// This is the main suppliers list widget that orchestrates the display
/// of suppliers using modular components for better maintainability.
class SuppliersList extends StatelessWidget {
  /// Creates a new [SuppliersList].
  const SuppliersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);

    return StreamBuilder<List<StoreProduct>>(
      stream: controller.productsStream,
      builder: (context, productsSnapshot) {
        final products = productsSnapshot.data ?? [];

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with title
            const SupplierListHeader(),
            const SizedBox(height: 16),

            // Suppliers content
            StreamBuilder<List<Supplier>>(
              stream: controller.suppliersStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Error: ${snapshot.error}',
                      style: const TextStyle(color: Colors.red),
                    ),
                  );
                }

                final suppliers = snapshot.data ?? [];

                if (suppliers.isEmpty) {
                  return const SupplierEmptyState();
                }

                return SupplierDataTable(
                  suppliers: suppliers,
                  products: products,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
