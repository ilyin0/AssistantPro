import 'package:async/async.dart';

import '../models/models.dart';

abstract interface class MessagesRepository {
  Future<Result<List<Message>>> getMessages(int chatId);

  Future<Result<String>> sendMessage({
    required int chatId,
    required String message,
  });
}
