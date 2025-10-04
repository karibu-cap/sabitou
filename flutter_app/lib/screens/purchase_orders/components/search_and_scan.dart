import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/responsive_utils.dart';
import '../purchase_orders_controller.dart';

/// The search and filter view.
class SearchAndFilterCard extends StatelessWidget {
  /// Constructs of new [SearchAndFilterCard].
  const SearchAndFilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return ShadCard(
      padding: const EdgeInsets.all(24),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        spacing: 12,
        children: [
          Expanded(flex: isMobile ? 0 : 2, child: _SearchInput()),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: const Row(
              spacing: 12,
              children: [
                Expanded(child: _StatusFilter()),
                Expanded(child: _SupplierFilter()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  final TextEditingController searchQueryController = TextEditingController();
  _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PurchaseOrdersController>();

    return ShadInput(
      controller: searchQueryController,
      placeholder: Text(Intls.to.searchForOrder),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: (value) => controller.searchQuery.add(value),
    );
  }
}

class _SupplierFilter extends StatelessWidget {
  const _SupplierFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PurchaseOrdersController>();

    return ShadSelect<String>(
      placeholder: Text(Intls.to.supplier),
      options: (controller.suppliersSubject.valueOrNull ?? <Supplier>[]).map(
        (supplier) =>
            ShadOption(value: supplier.refId, child: Text(supplier.name)),
      ),

      selectedOptionBuilder: (context, value) => Text(value),
      allowDeselection: true,
      onChanged: (value) {
        controller.selectedSupplierFilter.add(value ?? '');
      },
    );
  }
}

class _StatusFilter extends StatelessWidget {
  const _StatusFilter();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<PurchaseOrdersController>();

    return ShadSelect<PurchaseOrderStatus?>(
      placeholder: Text(Intls.to.status),
      options: [
        ...[
          PurchaseOrderStatus.PO_STATUS_PENDING,
          PurchaseOrderStatus.PO_STATUS_RECEIVED,
          PurchaseOrderStatus.PO_STATUS_CANCELLED,
        ].map(
          (status) => ShadOption<PurchaseOrderStatus?>(
            value: status,
            child: Text(status.label ?? Intls.to.status),
          ),
        ),
      ],
      selectedOptionBuilder: (context, value) =>
          Text(value?.label ?? Intls.to.status),
      allowDeselection: true,
      onChanged: controller.selectedStatusFilter.add,
    );
  }
}
