import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:collection/collection.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

part 'chats_state.dart';

@injectable
class ChatsCubit extends Cubit<HomeState> {
  ChatsCubit(
    this._getChatsUseCase,
    this._getChatsStreamUseCase,
    this._createChatUseCase,
    this._deleteChatUseCase,
  ) : super(const HomeState());

  final GetChatsUseCase _getChatsUseCase;
  final GetChatsStreamUseCase _getChatsStreamUseCase;
  final CreateChatUseCase _createChatUseCase;
  final DeleteChatUseCase _deleteChatUseCase;

  late final StreamSubscription<List<Chat>> _chatsStreamSubscription;

  Future<void> init() {
    return _getChatsUseCase.execute(null).map((chats) {
      emit(state.copyWith(chats: chats));
      return _getChatsStreamUseCase.execute(null).map((chatsStream) {
        _chatsStreamSubscription = chatsStream.listen((chats) {
          emit(state.copyWith(chats: chats));
        });
      });
    });
  }

  void dispose() {
    _chatsStreamSubscription.cancel();
  }

  Future<void> createChat({required String title}) {
    return _createChatUseCase.execute(title).map((chatId) {
      emit(HomeChatCreatedState.fromState(state, createdChatId: chatId));
    });
  }

  Future<void> deleteChat(int chatId) {
    return _deleteChatUseCase.execute(chatId);
  }
}
