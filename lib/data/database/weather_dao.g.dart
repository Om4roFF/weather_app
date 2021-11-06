// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_dao.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WeatherDaoAdapter extends TypeAdapter<WeatherDao> {
  @override
  final int typeId = 0;

  @override
  WeatherDao read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return WeatherDao(
      (fields[0] as List).cast<ForecastDayDao>(),
    );
  }

  @override
  void write(BinaryWriter writer, WeatherDao obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.forecastday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDaoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
