import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

@injectable
final class MessageMapper {
  const MessageMapper();

  Message transform(DataMessage dataMessage) {
    final messageText = dataMessage.text;
    return switch (dataMessage.sender) {
      DataMessageSender.user => SentMessage(text: messageText),
      DataMessageSender.model => ReceivedMessage(text: messageText),
    };
  }
}

@injectable
final class MessagesListMapper {
  const MessagesListMapper(this._messageMapper);

  final MessageMapper _messageMapper;

  List<Message> transform(List<DataMessage> dataMessages) {
    return dataMessages.map(_messageMapper.transform).toList();
  }
}
