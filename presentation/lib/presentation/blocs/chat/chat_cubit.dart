import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'chat_state.dart';

@injectable
class ChatCubit extends Cubit<ChatState> {
  ChatCubit(
    this._getChatUseCase,
    this._getChatMessagesUseCase,
    this._updateChatTitleUseCase,
    this._sendMessageUseCase,
  ) : super(const ChatState(messages: [initialChatMessage]));

  static const initialChatMessage = ReceivedMessage(
    text: 'How can I help you today?',
  );

  final GetChatUseCase _getChatUseCase;
  final GetChatMessagesUseCase _getChatMessagesUseCase;
  final UpdateChatTitleUseCase _updateChatTitleUseCase;
  final SendMessageUseCase _sendMessageUseCase;

  Future<void> init(int chatId) {
    return _getChatUseCase.execute(chatId).map((chat) {
      emit(state.copyWith(chat: chat));
      return _getChatMessagesUseCase.execute(chatId).map((messages) {
        emit(
          state.copyWith(
            messages: [...state.messages, ...messages],
          ),
        );
      });
    });
  }

  void updateChatTitle(String newTitle) {
    final chat = state.chat;
    if (chat != null) {
      _updateChatTitleUseCase
          .execute((chatId: chat.id, newTitle: newTitle)).map((_) {
        emit(state.copyWith(chat: Chat(id: chat.id, title: newTitle)));
      });
    }
  }

  void sendMessage(String text) {
    final messagesWithSentMessage = [
      ...state.messages,
      SentMessage(text: text)
    ];
    emit(state.copyWith(messages: messagesWithSentMessage));
    final chat = state.chat;
    if (chat != null) {
      _sendMessageUseCase
          .execute((chatId: chat.id, message: text)).map((responseText) {
        final messagesWithSentAndReceivedMessages = [
          ...messagesWithSentMessage,
          ReceivedMessage(text: responseText),
        ];
        emit(state.copyWith(messages: messagesWithSentAndReceivedMessages));
      });
    }
  }
}
