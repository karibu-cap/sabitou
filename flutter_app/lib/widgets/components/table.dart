import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The row table.
final class RowTable {
  /// Whether the row is selected or not.
  bool selected = false;

  /// The list of row data.
  List<dynamic> data;

  /// Constructs of [RowTable].
  RowTable(this.data);
}

/// The table header.
final class TableHeader {
  /// The title of the header.
  final String title;

  /// Whether the header is filtrable or not.
  final bool isFiltrable;

  /// Constructs of [TableHeader].
  TableHeader(this.title, {this.isFiltrable = false});
}

/// The table component.
class CPTable extends StatelessWidget {
  /// The table headers.
  final List<TableHeader> tableHeaders;

  /// The table rows.
  final List<RowTable> tableRows;

  /// The rows per page.
  final int rowsPerPage;

  /// The table header.
  final Widget? header;

  /// Whether the table is selectable or not.
  final bool isSelectable;

  /// The action widget.
  final List<Widget>? actions;

  /// Constructs of [CPTable].
  const CPTable({
    super.key,
    required this.tableHeaders,
    this.rowsPerPage = 4,
    this.header,
    required this.tableRows,
    this.isSelectable = false,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    final RxString sortColumn = ''.obs;
    final RxBool sortAscending = true.obs;

    void sort<T>(
      Comparable<T> Function(RowTable) getField,
      String columnName,
      bool ascending,
    ) {
      tableRows.sort((a, b) {
        final aValue = getField(a);
        final bValue = getField(b);

        return ascending
            ? Comparable.compare(aValue, bValue)
            : Comparable.compare(bValue, aValue);
      });
      sortColumn.value = columnName;
      sortAscending.value = ascending;
    }

    return Expanded(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Obx(
            () => Theme(
              data: Theme.of(context).copyWith(
                dataTableTheme: DataTableThemeData(
                  dividerThickness: 0.5,
                  headingRowColor: WidgetStateProperty.all(
                    Theme.of(context).secondaryHeaderColor,
                  ),
                  dataRowColor: WidgetStateProperty.resolveWith<Color?>(
                    (states) {
                      if (states.contains(WidgetState.selected)) {
                        return Theme.of(context).secondaryHeaderColor;
                      }
                      if (states.contains(WidgetState.hovered)) {
                        return Theme.of(context).colorScheme.tertiary;
                      }

                      return null;
                    },
                  ),
                ),
              ),
              child: PaginatedDataTable(
                header: header,
                rowsPerPage: rowsPerPage,
                sortColumnIndex: sortColumn.value.isNotEmpty
                    ? tableHeaders
                        .map((e) => e.title)
                        .toList()
                        .indexOf(sortColumn.value)
                    : null,
                sortAscending: sortAscending.value,
                columns: tableHeaders
                    .map(
                      (e) => DataColumn(
                        label: Text(e.title),
                        tooltip: e.title,
                        onSort: !e.isFiltrable
                            ? null
                            : (columnIndex, ascending) => sort(
                                  (d) => d.data[columnIndex] as String,
                                  e.title,
                                  ascending,
                                ),
                      ),
                    )
                    .toList(),
                source: _DataSource(tableRows, isSelectable),
                actions: actions,
                showFirstLastButtons: true,
                primary: false,
                showEmptyRows: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DataSource extends DataTableSource {
  final List<RowTable> tableRows;
  final bool isSelectable;

  int _selectedCount = 0;

  @override
  int get rowCount => tableRows.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => _selectedCount;

  _DataSource(this.tableRows, this.isSelectable);

  @override
  DataRow? getRow(int index) {
    assert(index >= 0);
    if (index >= tableRows.length) return null;
    final row = tableRows[index];

    return DataRow.byIndex(
      index: index,
      selected: row.selected,
      onSelectChanged: !isSelectable
          ? null
          : (value) {
              if (row.selected != value) {
                _selectedCount += value == true ? 1 : -1;
                assert(_selectedCount >= 0);
                row.selected = value ?? false;
                notifyListeners();
              }
            },
      cells: row.data
          .map(
            (e) => DataCell(
              switch (e) {
                final Widget widget => widget,
                _ => Text(e.toString())
              },
            ),
          )
          .toList(),
    );
  }
}
