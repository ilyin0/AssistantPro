part of 'chats_cubit.dart';

class HomeState {
  const HomeState({
    this.chats = const [],
  });

  final List<Chat> chats;

  HomeState.fromState(HomeState state) : chats = state.chats;

  HomeState copyWith({
    List<Chat>? chats,
  }) {
    return HomeState(
      chats: chats ?? this.chats,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is HomeState &&
            runtimeType == other.runtimeType &&
            DeepCollectionEquality().equals(chats, other.chats);
  }

  @override
  int get hashCode => chats.hashCode;

  @override
  String toString() {
    return 'HomeState{chats: $chats}';
  }
}

class HomeChatCreatedState extends HomeState {
  const HomeChatCreatedState({
    required this.createdChatId,
    super.chats,
  });

  HomeChatCreatedState.fromState(
    HomeState state, {
    required this.createdChatId,
  }) : super.fromState(state);

  final int createdChatId;

  @override
  bool operator ==(Object other) {
    return super == other &&
        other is HomeChatCreatedState &&
        createdChatId == other.createdChatId;
  }

  @override
  int get hashCode => super.hashCode ^ createdChatId.hashCode;

  @override
  String toString() {
    return 'HomeChatCreatedState{createdChatId: $createdChatId, chats: $chats}';
  }
}
