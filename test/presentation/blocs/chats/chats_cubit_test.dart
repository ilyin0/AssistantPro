import 'package:async/async.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:presentation/presentation.dart';

class MockGetChatsUseCase extends Mock implements GetChatsUseCase {}

class MockGetChatsStreamUseCase extends Mock implements GetChatsStreamUseCase {}

class MockCreateChatUseCase extends Mock implements CreateChatUseCase {}

class MockDeleteChatUseCase extends Mock implements DeleteChatUseCase {}

void main() {
  group('Chats Cubit', () {
    const chat0 = Chat(id: 0, title: 'Chat 0');
    const chat1 = Chat(id: 1, title: 'Chat 1');
    const initialChats = [chat0, chat1];

    final GetChatsUseCase getChatsUseCase = MockGetChatsUseCase();
    when(() => getChatsUseCase.execute(null)).thenAnswer(
      (_) => Future.value(Result.value(initialChats)),
    );

    final GetChatsStreamUseCase getChatsStreamUseCase =
        MockGetChatsStreamUseCase();
    when(() => getChatsStreamUseCase.execute(null)).thenAnswer(
      (_) => Future.value(Result.value(Stream.value(initialChats))),
    );

    final DeleteChatUseCase deleteChatUseCase = MockDeleteChatUseCase();
    when(() => deleteChatUseCase.execute(0)).thenAnswer(
      (_) => Future.value(Result.value(null)),
    );

    const chat2Title = 'Chat 2';
    const chat2Id = 2;
    const chat2 = Chat(id: chat2Id, title: chat2Title);
    final CreateChatUseCase createChatUseCase = MockCreateChatUseCase();
    when(() => createChatUseCase.execute(chat2Title)).thenAnswer(
      (_) => Future.value(Result.value(chat2Id)),
    );

    ChatsCubit buildHomeCubit() {
      return ChatsCubit(
        getChatsUseCase,
        getChatsStreamUseCase,
        createChatUseCase,
        deleteChatUseCase,
      );
    }

    late ChatsCubit homeCubit;

    void setUpHomeCubit() {
      homeCubit = buildHomeCubit();
    }

    blocTest(
      'Pure cubit',
      setUp: setUpHomeCubit,
      build: () => homeCubit,
      expect: () => [],
    );

    blocTest(
      'Load chats',
      setUp: setUpHomeCubit,
      build: () => homeCubit,
      act: (cubit) => cubit.init(),
      expect: () => [const HomeState(chats: initialChats)],
      verify: (_) {
        verify(() => getChatsUseCase.execute(null)).called(1);
      },
    );

    blocTest(
      'Add chat',
      setUp: () async {
        setUpHomeCubit();
        await homeCubit.init();
      },
      build: () => homeCubit,
      act: (cubit) => cubit.createChat(title: chat2Title),
      verify: (_) {
        verify(() => createChatUseCase.execute(chat2Title)).called(1);
      },
    );
  });
}
