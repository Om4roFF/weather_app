// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayDaoAdapter extends TypeAdapter<DayDao> {
  @override
  final int typeId = 2;

  @override
  DayDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayDao(
      maxtempC: fields[0] as double,
      mintempC: fields[1] as double,
      avgtempC: fields[2] as double,
      maxwindKph: fields[3] as double,
      dailyWillItRain: fields[4] as int,
      dailyChanceOfRain: fields[5] as int,
      dailyWillItSnow: fields[6] as int,
      dailyChanceOfSnow: fields[7] as int,
      condition: fields[8] as ConditionDao,
    );
  }

  @override
  void write(BinaryWriter writer, DayDao obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.maxtempC)
      ..writeByte(1)
      ..write(obj.mintempC)
      ..writeByte(2)
      ..write(obj.avgtempC)
      ..writeByte(3)
      ..write(obj.maxwindKph)
      ..writeByte(4)
      ..write(obj.dailyWillItRain)
      ..writeByte(5)
      ..write(obj.dailyChanceOfRain)
      ..writeByte(6)
      ..write(obj.dailyWillItSnow)
      ..writeByte(7)
      ..write(obj.dailyChanceOfSnow)
      ..writeByte(8)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
