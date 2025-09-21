import 'package:isar_community/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../../entities/global_product_isar.dart';
import '../../entities/order_isar.dart';
import '../../entities/product_category_isar.dart';
import '../../entities/store_product_isar.dart';
import '../../entities/sync_operation_isar.dart';
import 'src/implementations/fake_isar_database.dart';
import 'src/implementations/real_isar_database.dart';

/// Enum to choose the Isar implementation.
enum IsarDatabaseType {
  /// The real implementation.
  real,

  /// The fake implementation.
  fake,
}

///Abstract database isar.
abstract class IsarDatabase {
  /// Store products collection.
  IsarCollection<StoreProductIsar> get storeProductIsars;

  /// Global products collection.
  IsarCollection<GlobalProductIsar> get globalProductIsars;

  /// Product categories collection.
  IsarCollection<ProductCategoryIsar> get productCategoryIsars;

  /// Orders collection.
  IsarCollection<OrderIsar> get orderIsars;

  /// Sync operations collection.
  IsarCollection<SyncOperationIsar> get syncOperationsIsars;

  /// Write transaction.
  Future<T> writeTxn<T>(Future<T> Function() callback);

  /// Creates a new isar database.
  static Future<IsarDatabase> create(IsarDatabaseType type) async {
    switch (type) {
      case IsarDatabaseType.real:
        final dir = await getApplicationDocumentsDirectory();
        final isar = await Isar.open(
          [
            StoreProductIsarSchema,
            GlobalProductIsarSchema,
            ProductCategoryIsarSchema,
            OrderIsarSchema,
            SyncOperationIsarSchema,
          ],

          /// source directory.
          directory: dir.path,
        );
        return RealIsarDatabase(isar);

      case IsarDatabaseType.fake:
        return FakeIsarDatabase();
    }
  }
}
