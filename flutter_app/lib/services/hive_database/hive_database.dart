import 'package:hive_ce_flutter/adapters.dart';
import 'package:sabitou_rpc/models.dart';

import 'protobuf_adapters.dart';
import 'src/implementations/fake_hive_database.dart';
import 'src/implementations/real_hive_database.dart';

/// Enum to choose the Hive implementation.
enum HiveDatabaseType {
  /// The real implementation.
  real,

  /// The fake implementation.
  fake,
}

/// Abstract database hive.
abstract class HiveDatabase {
  /// Store products box.
  Box<StoreProduct> get storeProducts;

  /// Global products box.
  Box<GlobalProduct> get globalProducts;

  /// Product categories box.
  Box<ProductCategory> get productCategories;

  /// Orders box.
  Box<Order> get orders;

  /// Order items box.
  Box<OrderItem> get orderItems;

  /// Sync operations box.
  Box<SyncOperation> get syncOperations;

  /// Initializes all Hive boxes.
  Future<void> initBoxes();

  /// Closes all Hive boxes.
  Future<void> closeBoxes();

  /// Creates a new hive database.
  static Future<HiveDatabase> create(HiveDatabaseType type) async {
    switch (type) {
      case HiveDatabaseType.real:
        try {
          // Initialize Hive
          await Hive.initFlutter();

          // Register protobuf adapters
          registerProtobufAdapters();

          return RealHiveDatabase();
        } on Exception catch (e) {
          print('Failed to open Hive database: $e');

          return FakeHiveDatabase();
        }

      case HiveDatabaseType.fake:
        return FakeHiveDatabase();
    }
  }
}
