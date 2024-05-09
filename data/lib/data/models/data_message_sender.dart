import 'package:hive/hive.dart';

import 'hive_type_id.dart';

part 'data_message_sender.g.dart';

@HiveType(typeId: HiveTypeId.dataMessageSender)
enum DataMessageSender {
  @HiveField(0)
  user,
  @HiveField(1)
  model;

  static DataMessageSender fromString(String value) {
    switch (value) {
      case 'user':
        return DataMessageSender.user;
      case 'bot':
        return DataMessageSender.model;
      default:
        throw ArgumentError('Invalid value: $value');
    }
  }
}
