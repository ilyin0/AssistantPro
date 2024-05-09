import 'package:async/async.dart';
import 'package:domain/domain.dart';

import '../models/models.dart';
import 'hive_data_source.dart';

enum ChatsDataSourceError { chatNotFound }

class ChatsDataSource extends HiveDataSource<DataChat> {
  const ChatsDataSource() : super('ChatsDataSource');

  bool existsChat(int chatId) {
    return box.containsKey(chatId);
  }

  Future<Result<List<DataChat>>> getChats() async {
    return getValues().toList().toSuccessfulResult();
  }

  Future<Result<Stream<List<DataChat>>>> getChatsStream() async {
    return getValuesStream().toSuccessfulResult();
  }

  Future<Result<DataChat>> getChat(int chatId) async {
    final chat = box.get(chatId);
    return chat != null
        ? Result.value(chat)
        : Result.error(ChatsDataSourceError.chatNotFound);
  }

  Future<Result<int>> writeChat(DataChat chat) {
    return box.add(chat).mapToResult();
  }

  Future<Result<void>> updateChat(DataChat chat) {
    return chat.save().mapToResult();
  }

  Future<Result<void>> deleteChat(int chatId) {
    return box.delete(chatId).mapToResult();
  }
}
