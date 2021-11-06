// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HourDaoAdapter extends TypeAdapter<HourDao> {
  @override
  final int typeId = 3;

  @override
  HourDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HourDao(
      time: fields[0] as String,
      tempC: fields[1] as double,
      tempF: fields[2] as double,
      isDay: fields[3] as int,
      windMph: fields[4] as double,
      windKph: fields[5] as double,
      humidity: fields[6] as int,
      cloud: fields[7] as int,
      feelslikeC: fields[8] as double,
      windchillC: fields[9] as double,
      heatindexC: fields[10] as double,
      heatindexF: fields[11] as double,
      dewpointC: fields[12] as double,
      willItRain: fields[13] as int,
      willItSnow: fields[14] as int,
      condition: fields[15] as ConditionDao,
    );
  }

  @override
  void write(BinaryWriter writer, HourDao obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.tempC)
      ..writeByte(2)
      ..write(obj.tempF)
      ..writeByte(3)
      ..write(obj.isDay)
      ..writeByte(4)
      ..write(obj.windMph)
      ..writeByte(5)
      ..write(obj.windKph)
      ..writeByte(6)
      ..write(obj.humidity)
      ..writeByte(7)
      ..write(obj.cloud)
      ..writeByte(8)
      ..write(obj.feelslikeC)
      ..writeByte(9)
      ..write(obj.windchillC)
      ..writeByte(10)
      ..write(obj.heatindexC)
      ..writeByte(11)
      ..write(obj.heatindexF)
      ..writeByte(12)
      ..write(obj.dewpointC)
      ..writeByte(13)
      ..write(obj.willItRain)
      ..writeByte(14)
      ..write(obj.willItSnow)
      ..writeByte(15)
      ..write(obj.condition);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
