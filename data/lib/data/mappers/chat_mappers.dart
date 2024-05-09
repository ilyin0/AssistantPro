import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';

@injectable
final class ChatMapper {
  const ChatMapper();

  Chat transform(DataChat dataChat) {
    return Chat(id: dataChat.key, title: dataChat.title);
  }
}

@injectable
final class ChatsListMapper {
  const ChatsListMapper(this._chatMapper);

  final ChatMapper _chatMapper;

  List<Chat> transform(List<DataChat> dataChats) {
    return dataChats.map(_chatMapper.transform).toList();
  }
}
