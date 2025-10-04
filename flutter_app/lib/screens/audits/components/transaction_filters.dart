import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../audits_controller.dart';

/// Search and filter widget for transactions
class TransactionFilters extends StatefulWidget {
  /// Constructs a new [TransactionFilters]
  const TransactionFilters({super.key});

  @override
  State<TransactionFilters> createState() => _TransactionFiltersState();
}

class _TransactionFiltersState extends State<TransactionFilters> {
  late TextEditingController _searchController;
  String _selectedDateFilter = '';

  bool get _isTodaySelected => _selectedDateFilter == 'today';
  bool get _isThisWeekSelected => _selectedDateFilter == 'week';
  bool get _isThisMonthSelected => _selectedDateFilter == 'month';

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    final controller = context.read<AuditsController>();
    controller.updateSearchQuery(_searchController.text);
  }

  void _clearSearch() {
    _searchController.clear();
    final controller = context.read<AuditsController>();
    controller.clearSearch();
  }

  void _onDateFilterSelected(String filter) {
    setState(() {
      if (_selectedDateFilter == filter) {
        _selectedDateFilter = ''; // Deselect if already selected
      } else {
        _selectedDateFilter = filter; // Select new filter
      }
    });

    final controller = context.read<AuditsController>();
    controller.updateDateFilter(_selectedDateFilter);
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AuditsController>();

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.searchAndFilter,
            style: ShadTheme.of(context).textTheme.h4,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ShadInput(
                  controller: _searchController,
                  placeholder: Text(Intls.to.searchTransactions),
                ),
              ),
              const SizedBox(width: 16),
              ShadButton.outline(
                onPressed: _clearSearch,
                child: Text(Intls.to.clear),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FilterChip(
                label: const Text('Today'),
                backgroundColor: ShadTheme.of(
                  context,
                ).secondaryButtonTheme.backgroundColor,
                selected: _isTodaySelected,
                onSelected: (selected) => _onDateFilterSelected('today'),
              ),
              FilterChip(
                label: const Text('This Week'),
                backgroundColor: ShadTheme.of(
                  context,
                ).secondaryButtonTheme.backgroundColor,
                selected: _isThisWeekSelected,
                onSelected: (selected) => _onDateFilterSelected('week'),
              ),
              FilterChip(
                label: const Text('This Month'),
                backgroundColor: ShadTheme.of(
                  context,
                ).secondaryButtonTheme.backgroundColor,
                selected: _isThisMonthSelected,
                onSelected: (selected) => _onDateFilterSelected('month'),
              ),
              FilterChip(
                label: const Text('Inventory Only'),
                backgroundColor: ShadTheme.of(
                  context,
                ).secondaryButtonTheme.backgroundColor,

                onSelected: (selected) {
                  if (selected) {
                    controller.switchToInventoryTab();
                  }
                },
              ),
              FilterChip(
                label: const Text('Vouchers Only'),
                backgroundColor: ShadTheme.of(
                  context,
                ).secondaryButtonTheme.backgroundColor,

                onSelected: (selected) {
                  if (selected) {
                    controller.switchToVoucherTab();
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
