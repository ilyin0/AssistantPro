import 'package:async/async.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

@Injectable(as: MessagesRepository)
class MessagesRepositoryImpl implements MessagesRepository {
  const MessagesRepositoryImpl(
    this._geminiClient,
    this._messagesDataSource,
    this._messagesListMapper,
  );

  final GeminiClient _geminiClient;
  final MessagesDataSource _messagesDataSource;
  final MessagesListMapper _messagesListMapper;

  @override
  Future<Result<List<Message>>> getMessages(int chatId) {
    return _messagesDataSource
        .getMessages(chatId)
        .map(_messagesListMapper.transform);
  }

  @override
  Future<Result<String>> sendMessage({
    required int chatId,
    required String message,
  }) async {
    var dataMessage = DataMessage(
      text: message,
      sender: DataMessageSender.user,
      chatId: chatId,
    );
    return _messagesDataSource.writeMessage(dataMessage).flatMapFuture((_) {
      return _geminiClient.sendMessage(message).flatMapFuture((responseText) {
        var messageToWrite = DataMessage(
          text: responseText,
          sender: DataMessageSender.model,
          chatId: chatId,
        );
        return _messagesDataSource
            .writeMessage(messageToWrite)
            .map((_) => responseText);
      });
    });
  }
}
