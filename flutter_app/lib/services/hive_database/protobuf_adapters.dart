import 'package:hive_ce/hive.dart';
import 'package:sabitou_rpc/models.dart';

/// Hive TypeAdapter for StoreProduct protobuf
class StoreProductAdapter extends TypeAdapter<StoreProduct> {
  @override
  final int typeId = 0;

  @override
  StoreProduct read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return StoreProduct.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, StoreProduct obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for GlobalProduct protobuf
class GlobalProductAdapter extends TypeAdapter<GlobalProduct> {
  @override
  final int typeId = 1;

  @override
  GlobalProduct read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return GlobalProduct.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, GlobalProduct obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for Category protobuf
class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 2;

  @override
  Category read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return Category.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for Order protobuf
class SalesOrderAdapter extends TypeAdapter<SalesOrder> {
  @override
  final int typeId = 3;

  @override
  SalesOrder read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return SalesOrder.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, SalesOrder obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for SyncOperation protobuf
class SyncOperationAdapter extends TypeAdapter<SyncOperation> {
  @override
  final int typeId = 4;

  @override
  SyncOperation read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return SyncOperation.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, SyncOperation obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Registers all protobuf Hive adapters
void registerProtobufAdapters() {
  if (!Hive.isAdapterRegistered(0)) {
    Hive.registerAdapter(StoreProductAdapter());
  }
  if (!Hive.isAdapterRegistered(1)) {
    Hive.registerAdapter(GlobalProductAdapter());
  }
  if (!Hive.isAdapterRegistered(2)) {
    Hive.registerAdapter(CategoryAdapter());
  }
  if (!Hive.isAdapterRegistered(3)) {
    Hive.registerAdapter(SalesOrderAdapter());
  }
  if (!Hive.isAdapterRegistered(4)) {
    Hive.registerAdapter(SyncOperationAdapter());
  }
}
