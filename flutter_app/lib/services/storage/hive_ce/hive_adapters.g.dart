// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class AppPrinterAdapter extends TypeAdapter<AppPrinter> {
  @override
  final typeId = 12;

  @override
  AppPrinter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AppPrinter(
      url: fields[0] as String,
      name: fields[1] as String?,
      model: fields[2] as String?,
      location: fields[3] as String?,
      comment: fields[4] as String?,
      isDefault: fields[5] as bool?,
      isAvailable: fields[6] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AppPrinter obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.url)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.model)
      ..writeByte(3)
      ..write(obj.location)
      ..writeByte(4)
      ..write(obj.comment)
      ..writeByte(5)
      ..write(obj.isDefault)
      ..writeByte(6)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppPrinterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
