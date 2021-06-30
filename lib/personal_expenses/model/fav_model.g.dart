// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fav_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FavModelAdapter extends TypeAdapter<FavModel> {
  @override
  final int typeId = 1;

  @override
  FavModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FavModel(
      content: fields[1] as String,
      isFavorite: fields[2] as bool,
      title: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FavModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.content)
      ..writeByte(2)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FavModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
