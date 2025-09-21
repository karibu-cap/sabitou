import '../../../../entities/global_product_isar.dart';
import '../../../../entities/order_isar.dart';
import '../../../../entities/product_category_isar.dart';
import '../../../../entities/store_product_isar.dart';
import '../../../../entities/sync_operation_isar.dart';
import '../../isar_database.dart';
import '../utils/fake_isar_collection.dart';

/// Fake Isar database implementation.
class FakeIsarDatabase implements IsarDatabase {
  /// Fake store products collection.
  final storeProducts = FakeIsarCollection<StoreProductIsar>();

  /// Fake global products collection.
  final globalProducts = FakeIsarCollection<GlobalProductIsar>();

  /// Fake product categories collection.
  final categories = FakeIsarCollection<ProductCategoryIsar>();

  @override
  FakeIsarCollection<StoreProductIsar> get storeProductIsars => storeProducts;

  @override
  FakeIsarCollection<GlobalProductIsar> get globalProductIsars =>
      globalProducts;

  @override
  FakeIsarCollection<ProductCategoryIsar> get productCategoryIsars =>
      categories;

  @override
  FakeIsarCollection<OrderIsar> get orderIsars =>
      FakeIsarCollection<OrderIsar>();

  @override
  FakeIsarCollection<SyncOperationIsar> get syncOperationsIsars =>
      FakeIsarCollection<SyncOperationIsar>();

  @override
  Future<T> writeTxn<T>(Future<T> Function() callback) {
    return callback();
  }
}
