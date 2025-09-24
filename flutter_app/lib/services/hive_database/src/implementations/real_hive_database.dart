import 'dart:async';

import 'package:hive_ce/hive.dart';
import 'package:sabitou_rpc/models.dart';

import '../../hive_database.dart';
import '../../protobuf_adapters.dart';

/// Real hive database implementation.
class RealHiveDatabase implements HiveDatabase {
  /// Constructs a new [RealHiveDatabase].
  RealHiveDatabase();

  @override
  Box<StoreProduct> get storeProducts =>
      Hive.box<StoreProduct>('storeProducts');

  @override
  Box<GlobalProduct> get globalProducts =>
      Hive.box<GlobalProduct>('globalProducts');

  @override
  Box<ProductCategory> get productCategories =>
      Hive.box<ProductCategory>('productCategories');

  @override
  Box<Order> get orders => Hive.box<Order>('orders');

  @override
  Box<SyncOperation> get syncOperations =>
      Hive.box<SyncOperation>('syncOperations');

  @override
  Future<void> initBoxes() async {
    // Register protobuf adapters
    registerProtobufAdapters();

    // Open all boxes
    await Hive.openBox<StoreProduct>('storeProducts');
    await Hive.openBox<GlobalProduct>('globalProducts');
    await Hive.openBox<ProductCategory>('productCategories');
    await Hive.openBox<Order>('orders');
    await Hive.openBox<OrderItem>('orderItems');
    await Hive.openBox<SyncOperation>('syncOperations');
  }

  @override
  Future<void> closeBoxes() async {
    // close all boxes
    await Hive.box<StoreProduct>('storeProducts').close();
    await Hive.box<GlobalProduct>('globalProducts').close();
    await Hive.box<ProductCategory>('productCategories').close();
    await Hive.box<Order>('orders').close();
    await Hive.box<OrderItem>('orderItems').close();
    await Hive.box<SyncOperation>('syncOperations').close();
  }
}
