// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_message_sender.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DataMessageSenderAdapter extends TypeAdapter<DataMessageSender> {
  @override
  final int typeId = 3;

  @override
  DataMessageSender read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return DataMessageSender.user;
      case 1:
        return DataMessageSender.model;
      default:
        return DataMessageSender.user;
    }
  }

  @override
  void write(BinaryWriter writer, DataMessageSender obj) {
    switch (obj) {
      case DataMessageSender.user:
        writer.writeByte(0);
        break;
      case DataMessageSender.model:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DataMessageSenderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
