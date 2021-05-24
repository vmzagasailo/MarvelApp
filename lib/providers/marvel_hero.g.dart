// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_hero.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MarvelHeroAdapter extends TypeAdapter<MarvelHero> {
  @override
  final int typeId = 0;

  @override
  MarvelHero read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MarvelHero(
      id: fields[0] as int,
      name: fields[1] as String,
      imageUrl: fields[2] as String,
      description: fields[3] as String,
      isFavorite: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, MarvelHero obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.imageUrl)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MarvelHeroAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
