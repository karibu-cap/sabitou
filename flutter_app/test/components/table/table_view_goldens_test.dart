import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/themes/app_colors.dart';
import 'package:sabitou_clients/widgets/atoms/table.dart';

import '../../goldens.dart';

class CreateTableComponentWidget extends StatelessWidget {
  final bool isSelectable;
  const CreateTableComponentWidget({super.key, this.isSelectable = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            CPTable(
              header: const Text('Products'),
              isSelectable: isSelectable,
              rowsPerPage: 5,
              tableHeaders: [
                TableHeader('Name', isFiltrable: true),
                TableHeader('Code', isFiltrable: true),
                TableHeader('Type', isFiltrable: true),
                TableHeader('Price', isFiltrable: true),
                TableHeader('Quantity'),
              ],
              tableRows: [
                RowTable([
                  'Mac book',
                  '#123',
                  'Laptop',
                  20000,
                  const Text(
                    'In-stock',
                    style: TextStyle(color: AppColors.success500),
                  ),
                ]),
                RowTable([
                  'Iphone',
                  '#123',
                  'Phone',
                  10000,
                  const Text(
                    'Out of stock',
                    style: TextStyle(color: AppColors.error500),
                  ),
                ]),
                RowTable([
                  'AirPods',
                  '#123',
                  'Headphone',
                  5000,
                  const Text(
                    'In-stock',
                    style: TextStyle(color: AppColors.success500),
                  ),
                ]),
                RowTable([
                  'Samsung',
                  '#123',
                  'Phone',
                  10000,
                  const Text(
                    'In-stock',
                    style: TextStyle(color: AppColors.success500),
                  ),
                ]),
                RowTable([
                  'Ferari',
                  '#123',
                  'Car',
                  100000,
                  const Text(
                    'In-stock',
                    style: TextStyle(color: AppColors.error500),
                  ),
                ]),
                RowTable([
                  'Hair',
                  '#123',
                  'Cosmetics',
                  1000,
                  const Text(
                    'In-stock',
                    style: TextStyle(color: AppColors.success500),
                  ),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  group('Goldens', () {
    testGoldens('Table component', (tester) async {
      await multiScreenMultiLocaleGolden(
        tester,
        const CreateTableComponentWidget(),
        'table_component',
      );
    });
    testGoldens('Unselected table', (tester) async {
      await multiScreenMultiLocaleGolden(
        tester,
        const CreateTableComponentWidget(
          isSelectable: false,
        ),
        'unselected_table',
      );
    });
  });
}
