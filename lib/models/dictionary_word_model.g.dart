// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_word_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DictionaryModelAdapter extends TypeAdapter<DictionaryModel> {
  @override
  final int typeId = 0;

  @override
  DictionaryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DictionaryModel(
      kelime: fields[0] as String,
      ek: fields[1] as String,
      kok: fields[2] as String,
      tur: fields[3] as String,
      fav: fields[4] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, DictionaryModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.kelime)
      ..writeByte(1)
      ..write(obj.ek)
      ..writeByte(2)
      ..write(obj.kok)
      ..writeByte(3)
      ..write(obj.tur)
      ..writeByte(4)
      ..write(obj.fav);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DictionaryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
