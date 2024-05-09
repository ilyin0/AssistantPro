import 'package:async/async.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

@Injectable(as: ChatRepository)
class ChatRepositoryImpl implements ChatRepository {
  const ChatRepositoryImpl(
    this._chatsDataSource,
    this._messagesDataSource,
    this._chatMapper,
    this._chatsListMapper,
  );

  final ChatsDataSource _chatsDataSource;
  final MessagesDataSource _messagesDataSource;
  final ChatMapper _chatMapper;
  final ChatsListMapper _chatsListMapper;

  @override
  bool existsChat(int chatId) {
    return _chatsDataSource.existsChat(chatId);
  }

  @override
  Future<Result<List<Chat>>> getChats() {
    return _chatsDataSource.getChats().map(_chatsListMapper.transform);
  }

  @override
  Future<Result<Stream<List<Chat>>>> getChatsStream() {
    return _chatsDataSource.getChatsStream().map((chats) {
      return chats.map(_chatsListMapper.transform);
    });
  }

  @override
  Future<Result<Chat>> getChat(int chatId) {
    return _chatsDataSource.getChat(chatId).map(_chatMapper.transform);
  }

  @override
  Future<Result<int>> createChat({required String title}) {
    return _chatsDataSource.writeChat(DataChat(title: title));
  }

  @override
  Future<Result<void>> updateChatTitle({
    required int chatId,
    required String newTitle,
  }) async {
    return _chatsDataSource.getChat(chatId).flatMapFuture((chat) {
      chat.title = newTitle;
      return _chatsDataSource.updateChat(chat);
    });
  }

  @override
  Future<Result<void>> deleteChat(int chatId) {
    return _chatsDataSource.deleteChat(chatId).flatMapFuture((_) {
      return _messagesDataSource.deleteMessages(chatId);
    });
  }
}
