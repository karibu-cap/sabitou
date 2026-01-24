import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_clients/screens/inventory/dialogs/inventory_adjustment_dialog.dart';
import 'package:sabitou_clients/screens/inventory/inventory_controller.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

// Mock InventoryController
class MockInventoryController extends Mock implements InventoryController {
  @override
  Future<bool> adjustInventory(
    String? storeId,
    String? productId,
    int? quantityChange,
    String? reason,
    String? notes,
  ) {
    return super.noSuchMethod(
          Invocation.method(#adjustInventory, [
            storeId,
            productId,
            quantityChange,
            reason,
            notes,
          ]),
          returnValue: Future.value(true),
          returnValueForMissingStub: Future.value(true),
        )
        as Future<bool>;
  }
}

void main() {
  testWidgets(
    'InventoryAdjustmentDialog allows entering quantity and submitting',
    (WidgetTester tester) async {
      final mockController = MockInventoryController();

      // Setup mockup data
      final inventory = InventoryLevelWithProduct(
        level: InventoryLevel(
          storeProductId: 'prod-1',
          storeId: 'store-1',
          quantityAvailable: 10,
        ),
        globalProduct: GlobalProduct(label: 'Test Product'),
        product: StoreProduct(salePrice: 100),
      );

      // Provide the mock controller
      await tester.pumpWidget(
        MaterialApp(
          home: ChangeNotifierProvider<InventoryController>.value(
            value: mockController,
            child: ShadApp(
              home: Scaffold(
                body: Builder(
                  builder: (context) => ShadButton(
                    onPressed: () => showShadDialog(
                      context: context,
                      builder: (context) =>
                          InventoryAdjustmentDialog(inventory: inventory),
                    ),
                    child: const Text('Open Dialog'),
                  ),
                ),
              ),
            ),
          ),
        ),
      );

      // Open dialog
      await tester.tap(find.text('Open Dialog'));
      await tester.pumpAndSettle();

      // Verify dialog content
      expect(find.text('Adjust Inventory'), findsOneWidget);
      expect(find.text('Test Product'), findsOneWidget);
      expect(find.text('Current Stock: 10'), findsOneWidget);

      // Enter quantity
      await tester.enterText(find.byType(ShadInputFormField).at(0), '5');

      // Enter reason
      await tester.enterText(find.byType(ShadInputFormField).at(1), 'Restock');

      // Tap save
      await tester.tap(find.text('Save'));
      await tester.pumpAndSettle();

      // Verify controller called
      verify(
        mockController.adjustInventory('store-1', 'prod-1', 5, 'Restock', ''),
      ).called(1);
    },
  );
}
