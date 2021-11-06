// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ForecastDayDaoAdapter extends TypeAdapter<ForecastDayDao> {
  @override
  final int typeId = 1;

  @override
  ForecastDayDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ForecastDayDao(
      fields[0] as DayDao,
      (fields[1] as List).cast<HourDao>(),
    );
  }

  @override
  void write(BinaryWriter writer, ForecastDayDao obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.day)
      ..writeByte(1)
      ..write(obj.hour);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ForecastDayDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
