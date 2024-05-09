import 'package:async/async.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetChatMessagesUseCase implements UseCase<int, List<Message>> {
  const GetChatMessagesUseCase(this._messagesRepository);

  final MessagesRepository _messagesRepository;

  @override
  Future<Result<List<Message>>> execute(int input) async {
    return _messagesRepository.getMessages(input);
  }
}

@injectable
class GetChatUseCase implements UseCase<int, Chat> {
  const GetChatUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<Chat>> execute(int input) {
    return _chatRepository.getChat(input);
  }
}

@injectable
class SendMessageUseCase
    implements UseCase<({int chatId, String message}), String> {
  const SendMessageUseCase(this._messagesRepository);

  final MessagesRepository _messagesRepository;

  @override
  Future<Result<String>> execute(({int chatId, String message}) input) {
    return _messagesRepository.sendMessage(
      chatId: input.chatId,
      message: input.message,
    );
  }
}

@injectable
class UpdateChatTitleUseCase
    implements UseCase<({int chatId, String newTitle}), void> {
  const UpdateChatTitleUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<void>> execute(({int chatId, String newTitle}) input) {
    return _chatRepository
        .updateChatTitle(chatId: input.chatId, newTitle: input.newTitle)
        .mapToResult();
  }
}
