import 'dart:async';

import 'package:async/async.dart';

import '../models/models.dart';

abstract interface class ChatRepository {
  FutureOr<bool> existsChat(int chatId);

  Future<Result<List<Chat>>> getChats();

  Future<Result<Stream<List<Chat>>>> getChatsStream();

  Future<Result<Chat>> getChat(int chatId);

  Future<Result<int>> createChat({required String title});

  Future<Result<void>> updateChatTitle({
    required int chatId,
    required String newTitle,
  });

  Future<Result<void>> deleteChat(int chatId);
}
