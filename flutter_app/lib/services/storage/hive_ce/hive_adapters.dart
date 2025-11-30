import 'package:hive_ce/hive.dart';
import 'package:sabitou_rpc/models.dart';

import '../app_storage.dart';

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

/// Hive TypeAdapter for User protobuf
class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 5;

  @override
  User read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return User.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for Business protobuf
class BusinessAdapter extends TypeAdapter<Business> {
  @override
  final int typeId = 6;

  @override
  Business read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return Business.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, Business obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for Store protobuf
class StoreAdapter extends TypeAdapter<Store> {
  @override
  final int typeId = 7;

  @override
  Store read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return Store.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, Store obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for StoreMembers protobuf
class StoreMemberAdapter extends TypeAdapter<StoreMember> {
  @override
  final int typeId = 8;

  @override
  StoreMember read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return StoreMember.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, StoreMember obj) {
    writer.writeByteList(obj.writeToBuffer());
  }
}

/// Hive TypeAdapter for BusinessMembers protobuf
class BusinessMemberAdapter extends TypeAdapter<BusinessMember> {
  @override
  final int typeId = 9;

  @override
  BusinessMember read(BinaryReader reader) {
    final bytes = reader.readByteList();

    return BusinessMember.fromBuffer(bytes);
  }

  @override
  void write(BinaryWriter writer, BusinessMember obj) {
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
  if (!Hive.isAdapterRegistered(5)) {
    Hive.registerAdapter(UserAdapter());
  }
  if (!Hive.isAdapterRegistered(6)) {
    Hive.registerAdapter(BusinessAdapter());
  }
  if (!Hive.isAdapterRegistered(7)) {
    Hive.registerAdapter(StoreAdapter());
  }
  if (!Hive.isAdapterRegistered(8)) {
    Hive.registerAdapter(StoreMemberAdapter());
  }
  if (!Hive.isAdapterRegistered(9)) {
    Hive.registerAdapter(BusinessMemberAdapter());
  }
}

/// Initializes all boxes.
void initStorageBoxes() {
  AppStorage.of<StoreProduct>();
  AppStorage.of<GlobalProduct>();
  AppStorage.of<Category>();
  AppStorage.of<SalesOrder>();
  AppStorage.of<SyncOperation>();
  AppStorage.of<User>();
  AppStorage.of<Business>();
  AppStorage.of<Store>();
  AppStorage.of<StoreMember>();
  AppStorage.of<BusinessMember>();
}
