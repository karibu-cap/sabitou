import 'package:isar_community/isar.dart';

import '../../../../entities/global_product_isar.dart';
import '../../../../entities/order_isar.dart';
import '../../../../entities/product_category_isar.dart';
import '../../../../entities/store_product_isar.dart';
import '../../../../entities/sync_operation_isar.dart';
import '../../isar_database.dart';

/// Real isar database implementation.
class RealIsarDatabase implements IsarDatabase {
  final Isar _isar;

  /// Constructs a new [RealIsarDatabase].
  RealIsarDatabase(this._isar);

  @override
  IsarCollection<StoreProductIsar> get storeProductIsars =>
      _isar.storeProductIsars;

  @override
  IsarCollection<GlobalProductIsar> get globalProductIsars =>
      _isar.globalProductIsars;

  @override
  IsarCollection<ProductCategoryIsar> get productCategoryIsars =>
      _isar.productCategoryIsars;

  @override
  IsarCollection<OrderIsar> get orderIsars => _isar.orderIsars;

  @override
  IsarCollection<SyncOperationIsar> get syncOperationsIsars =>
      _isar.syncOperationIsars;

  @override
  Future<T> writeTxn<T>(Future<T> Function() callback) {
    return _isar.writeTxn(callback);
  }
}
