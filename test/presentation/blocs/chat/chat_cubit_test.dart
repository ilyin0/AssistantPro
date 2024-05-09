import 'package:async/async.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/presentation.dart';

class MockGetChatUseCase extends Mock implements GetChatUseCase {}

class MockGetChatMessagesUseCase extends Mock
    implements GetChatMessagesUseCase {}

class MockUpdateChatTitleUseCase extends Mock
    implements UpdateChatTitleUseCase {}

class MockSendMessageUseCase extends Mock implements SendMessageUseCase {}

void main() {
  group('ChatState', () {
    test('ChatState.fromState constructor', () {
      const state = ChatState(messages: [SentMessage(text: 'test')]);
      final newState = ChatState.fromState(state);
      expect(newState, state);
    });
  });

  group('ChatCubit', () {
    const chatId = 0;
    const defaultChatTitle = 'chatTitle';
    const defaultChat = Chat(id: chatId, title: defaultChatTitle);
    final GetChatUseCase getChatUseCase = MockGetChatUseCase();
    when(() => getChatUseCase.execute(chatId)).thenAnswer(
      (_) => Future.value(Result.value(defaultChat)),
    );
    final GetChatMessagesUseCase getChatMessagesUseCase =
        MockGetChatMessagesUseCase();
    when(() => getChatMessagesUseCase.execute(chatId))
        .thenAnswer((_) => Future.value(Result.value(const [])));

    const newChatTitle = 'newChatTitle';
    final UpdateChatTitleUseCase updateChatTitleUseCase =
        MockUpdateChatTitleUseCase();
    when(
      () => updateChatTitleUseCase.execute(
        (chatId: chatId, newTitle: newChatTitle),
      ),
    ).thenAnswer((_) => Future.value(Result.value(null)));

    const testMessageText = 'test';
    const testMessageResponseText = 'response';
    final SendMessageUseCase sendMessageUseCase = MockSendMessageUseCase();
    when(
      () => sendMessageUseCase.execute((chatId: 0, message: testMessageText)),
    ).thenAnswer(
      (_) => Future.value(Result.value(testMessageResponseText)),
    );

    late ChatCubit chatCubit;

    Future<void> setupCubit() async {
      chatCubit = ChatCubit(
        getChatUseCase,
        getChatMessagesUseCase,
        updateChatTitleUseCase,
        sendMessageUseCase,
      );
      await chatCubit.init(chatId);
    }

    blocTest(
      'Pure cubit',
      setUp: setupCubit,
      build: () => chatCubit,
      expect: () => [],
      verify: (cubit) {
        expect(cubit.state.messages, [ChatCubit.initialChatMessage]);
      },
    );

    blocTest(
      'Send message',
      setUp: setupCubit,
      build: () => chatCubit,
      act: (cubit) => cubit.sendMessage(testMessageText),
      expect: () => [
        const ChatState(
          chat: defaultChat,
          messages: [
            ChatCubit.initialChatMessage,
            SentMessage(text: testMessageText),
          ],
        ),
        const ChatState(
          chat: defaultChat,
          messages: [
            ChatCubit.initialChatMessage,
            SentMessage(text: testMessageText),
            ReceivedMessage(text: testMessageResponseText),
          ],
        ),
      ],
    );

    blocTest(
      'Update chat title',
      setUp: setupCubit,
      build: () => chatCubit,
      act: (cubit) => cubit.updateChatTitle(newChatTitle),
      expect: () => [
        const ChatState(
          chat: Chat(id: chatId, title: newChatTitle),
          messages: [ChatCubit.initialChatMessage],
        ),
      ],
    );
  });
}
