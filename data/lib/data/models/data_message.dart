import 'package:hive/hive.dart';

import 'data_message_sender.dart';
import 'hive_type_id.dart';

part 'data_message.g.dart';

@HiveType(typeId: HiveTypeId.dataMessage)
class DataMessage extends HiveObject {
  DataMessage({
    required this.text,
    required this.sender,
    required this.chatId,
    this.timestamp,
  });

  @HiveField(0)
  final String text;
  @HiveField(1)
  final DataMessageSender sender;
  @HiveField(2)
  final int chatId;
  @HiveField(3)
  final DateTime? timestamp;
}
