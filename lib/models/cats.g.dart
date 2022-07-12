// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cats.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CatsAdapter extends TypeAdapter<Cats> {
  @override
  final int typeId = 0;

  @override
  Cats read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Cats(
      id: fields[0] as int,
      name: fields[1] as String,
      yeast: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Cats obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.yeast);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CatsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

Cats _$CatsFromJson(Map<String, dynamic> json) => Cats(
  id: json['id'] as int,
  name: json['name'] as String,
  yeast: json['yeast'] as String,
);