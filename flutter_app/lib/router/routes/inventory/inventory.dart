import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../screens/inventory/inventory_screen.dart';

/// The title of the current route.
const inventoryRouteTitle = 'Inventory';

/// The business list page.
final inventoryPage = BeamPage(
  key: const ValueKey('inventory'),
  title: inventoryRouteTitle,
  child: InventoryScreen(),
  type: BeamPageType.fadeTransition,
);

/// The name of the current route.
const inventoryRoutePath = '/inventory';
