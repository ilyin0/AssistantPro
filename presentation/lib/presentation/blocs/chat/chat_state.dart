part of 'chat_cubit.dart';

class ChatState {
  const ChatState({
    this.chat,
    this.messages = const [],
  });

  final Chat? chat;
  final List<Message> messages;

  ChatState.fromState(ChatState state)
      : chat = state.chat,
        messages = state.messages;

  ChatState copyWith({
    Chat? chat,
    List<Message>? messages,
  }) {
    return ChatState(
      chat: chat ?? this.chat,
      messages: messages ?? this.messages,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatState &&
          runtimeType == other.runtimeType &&
          chat == other.chat &&
          const DeepCollectionEquality().equals(messages, other.messages);

  @override
  int get hashCode {
    return chat.hashCode ^ messages.hashCode;
  }

  @override
  String toString() {
    return 'Chat: $chat, messages: ${messages.map((e) => e.text).toList()}';
  }
}
