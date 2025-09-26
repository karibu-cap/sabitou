import 'package:hive_ce/hive.dart';
import 'package:sabitou_rpc/models.dart';
import '../../hive_database.dart';

/// Fake hive database implementation for testing.
class FakeHiveDatabase implements HiveDatabase {
  /// Constructs a new [FakeDatabase].
  FakeHiveDatabase();

  @override
  Box<StoreProduct> get storeProducts =>
      throw UnimplementedError('Fake implementation - use for testing only');

  @override
  Box<GlobalProduct> get globalProducts =>
      throw UnimplementedError('Fake implementation - use for testing only');

  @override
  Box<Category> get categories =>
      throw UnimplementedError('Fake implementation - use for testing only');

  @override
  Box<Order> get orders =>
      throw UnimplementedError('Fake implementation - use for testing only');

  @override
  Box<SyncOperation> get syncOperations =>
      throw UnimplementedError('Fake implementation - use for testing only');

  @override
  Future<void> initBoxes() async {}

  @override
  Future<void> closeBoxes() async {}
}
