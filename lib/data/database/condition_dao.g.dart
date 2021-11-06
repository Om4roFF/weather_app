// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConditionDaoAdapter extends TypeAdapter<ConditionDao> {
  @override
  final int typeId = 4;

  @override
  ConditionDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ConditionDao(
      text: fields[0] as String,
      icon: fields[1] as String,
      code: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ConditionDao obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.icon)
      ..writeByte(2)
      ..write(obj.code);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConditionDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
