import 'package:async/async.dart';
import 'package:domain/domain.dart';

import '../models/models.dart';
import 'hive_data_source.dart';

class MessagesDataSource extends HiveDataSource<DataMessage> {
  const MessagesDataSource() : super('MessagesDataSource');

  Future<Result<List<DataMessage>>> getMessages(int chatId) async {
    return getValues()
        .where((message) => message.chatId == chatId)
        .toList()
        .toSuccessfulResult();
  }

  Future<Result<int>> writeMessage(DataMessage message) {
    return box.add(message).mapToResult();
  }

  Future<Result<void>> deleteMessages(int chatId) {
    final keys = getValues()
        .where((message) => message.chatId == chatId)
        .map((message) => message.key);
    return box.deleteAll(keys).mapToResult();
  }
}
