// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataMessageAdapter extends TypeAdapter<DataMessage> {
  @override
  final int typeId = 1;

  @override
  DataMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DataMessage(
      text: fields[0] as String,
      sender: fields[1] as DataMessageSender,
      chatId: fields[2] as int,
      timestamp: fields[3] as DateTime?,
    );
  }

  @override
  void write(BinaryWriter writer, DataMessage obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.text)
      ..writeByte(1)
      ..write(obj.sender)
      ..writeByte(2)
      ..write(obj.chatId)
      ..writeByte(3)
      ..write(obj.timestamp);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
