// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_chat.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataChatAdapter extends TypeAdapter<DataChat> {
  @override
  final int typeId = 2;

  @override
  DataChat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataChat(
      title: fields[0] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, DataChat obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.title);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
