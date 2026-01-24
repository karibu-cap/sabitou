import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

/// ============================================================================
/// REUSABLE DATAGRID WIDGET
/// ============================================================================
class ShadDataGrid<T> extends StatefulWidget {
  /// Constructs a new [ShadDataGrid].
  const ShadDataGrid({
    super.key,
    required this.data,
    required this.columns,
    required this.rowBuilder,
    this.rowsPerPage = 10,
    this.rowHeight = 60,
    this.headerRowHeight = 44,
    this.showPagination = true,
    this.enableSorting = false,
    this.onRowTap,
    this.footerFrozenColumnsCount = 0,
    this.frozenColumnsCount = 0,
  });

  /// The data to display.
  final List<T> data;

  /// The columns configuration.
  final List<ShadDataGridColumn> columns;

  /// The row builder function.
  final List<Widget> Function(T item) rowBuilder;

  /// The number of rows per page.
  final int rowsPerPage;

  /// The height of each row.
  final double rowHeight;

  /// The height of the header row.
  final double headerRowHeight;

  /// Whether to show pagination controls.
  final bool showPagination;

  /// Whether to enable sorting.
  final bool enableSorting;

  /// Callback when a row is tapped.
  final void Function(T item)? onRowTap;

  /// The number of frozen columns in the footer.
  final int footerFrozenColumnsCount;

  /// The number of frozen columns.
  final int frozenColumnsCount;

  @override
  State<ShadDataGrid<T>> createState() => _ShadDataGridState<T>();
}

class _ShadDataGridState<T> extends State<ShadDataGrid<T>> {
  _GenericDataSource<T>? _dataSource;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _updateDataSource();
  }

  void _updateDataSource() {
    _dataSource = _GenericDataSource<T>(
      data: widget.showPagination ? _currentPageData : widget.data,
      columns: widget.columns,
      rowBuilder: widget.rowBuilder,
      onRowTap: widget.onRowTap,
      context: context,
    );
  }

  void _goToPage(int pageIndex) {
    if (pageIndex >= 0 && pageIndex < _totalPages) {
      setState(() {
        _currentPageIndex = pageIndex;
        _updateDataSource();
      });
    }
  }

  @override
  void didUpdateWidget(ShadDataGrid<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      _currentPageIndex = 0;
      _updateDataSource();
    }
  }

  int get _totalPages => widget.showPagination
      ? (widget.data.length / widget.rowsPerPage).ceil()
      : 1;

  List<T> get _currentPageData {
    if (!widget.showPagination) return widget.data;
    final startIndex = _currentPageIndex * widget.rowsPerPage;
    final endIndex = (startIndex + widget.rowsPerPage).clamp(
      0,
      widget.data.length,
    );

    return widget.data.sublist(startIndex, endIndex);
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          if (widget.showPagination) ...[
            _PaginationControls(
              currentPage: _currentPageIndex + 1,
              totalPages: _totalPages,
              totalItems: widget.data.length,
              itemsPerPage: widget.rowsPerPage,
              onPageChanged: _goToPage,
            ),
          ],
          SfDataGridTheme(
            data: SfDataGridThemeData(
              headerColor: theme.colorScheme.accent,
              rowHoverColor: theme.colorScheme.accent,
              gridLineColor: theme.colorScheme.border,
            ),
            child: SfDataGrid(
              source:
                  _dataSource ??
                  _GenericDataSource<T>(
                    data: [],
                    columns: widget.columns,
                    rowBuilder: widget.rowBuilder,
                    context: context,
                  ),
              isScrollbarAlwaysShown: true,
              shrinkWrapRows: true,
              footerFrozenColumnsCount: widget.footerFrozenColumnsCount,
              frozenColumnsCount: widget.frozenColumnsCount,
              headerGridLinesVisibility: GridLinesVisibility.none,
              rowHeight: widget.rowHeight,
              headerRowHeight: widget.headerRowHeight,
              selectionMode: SelectionMode.single,
              navigationMode: GridNavigationMode.cell,
              allowSorting: widget.enableSorting,
              columns: widget.columns.map((col) {
                return GridColumn(
                  columnName: col.label,
                  width: col.width,
                  label: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    alignment: col.alignment ?? Alignment.centerLeft,
                    child: Text(
                      col.label,
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// COLUMN CONFIGURATION
class ShadDataGridColumn {
  /// The Constructor of [ShadDataGridColumn].
  const ShadDataGridColumn({
    required this.label,
    this.width = double.nan,
    this.alignment,
    this.backgroundColor,
  });

  /// The column label.
  final String label;

  /// The column width.
  final double width;

  /// The column alignment.
  final Alignment? alignment;

  /// Whether the column has an accent background.
  final Color? backgroundColor;
}

// ============================================================================
// GENERIC DATA SOURCE
// ============================================================================

class _GenericDataSource<T> extends DataGridSource {
  _GenericDataSource({
    required this.data,
    required this.columns,
    required this.rowBuilder,
    required this.context,
    this.onRowTap,
  }) {
    _buildDataGridRows();
  }

  final List<T> data;
  final List<ShadDataGridColumn> columns;
  final List<Widget> Function(T item) rowBuilder;
  final void Function(T item)? onRowTap;
  final BuildContext context;

  List<DataGridRow> _dataGridRows = [];
  @override
  List<DataGridRow> get rows => _dataGridRows;

  void _buildDataGridRows() {
    _dataGridRows = data.map((item) {
      return DataGridRow(
        cells: columns.map((col) {
          return DataGridCell<T>(columnName: col.label, value: item);
        }).toList(),
      );
    }).toList();
  }

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    final item = row.getCells().first.value as T;
    final cells = rowBuilder(item);

    return DataGridRowAdapter(cells: cells);
  }
}

// ============================================================================
// PAGINATION CONTROLS
// ============================================================================

class _PaginationControls extends StatelessWidget {
  const _PaginationControls({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.itemsPerPage,
    required this.onPageChanged,
  });

  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int itemsPerPage;
  final Function(int) onPageChanged;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final startItem = ((currentPage - 1) * itemsPerPage) + 1;
    final endItem = (currentPage * itemsPerPage).clamp(0, totalItems);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: theme.colorScheme.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Showing $startItem-$endItem of $totalItems',
            style: theme.textTheme.small.copyWith(
              color: theme.colorScheme.mutedForeground,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.chevron_left, size: 20),
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 2)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.background,
                  foregroundColor: theme.colorScheme.foreground,
                  disabledBackgroundColor: theme.colorScheme.muted,
                  disabledForegroundColor: theme.colorScheme.mutedForeground,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    side: BorderSide(color: theme.colorScheme.border),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Page $currentPage of $totalPages',
                style: theme.textTheme.small.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(width: 8),
              IconButton(
                icon: const Icon(Icons.chevron_right, size: 20),
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage)
                    : null,
                style: IconButton.styleFrom(
                  backgroundColor: theme.colorScheme.background,
                  foregroundColor: theme.colorScheme.foreground,
                  disabledBackgroundColor: theme.colorScheme.muted,
                  disabledForegroundColor: theme.colorScheme.mutedForeground,
                  shape: RoundedRectangleBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(6)),
                    side: BorderSide(color: theme.colorScheme.border),
                  ),
                  padding: const EdgeInsets.all(8),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
