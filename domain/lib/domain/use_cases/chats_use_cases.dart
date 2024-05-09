import 'dart:async';

import 'package:async/src/result/result.dart';
import 'package:injectable/injectable.dart';

import '../models/models.dart';
import '../repositories/repositories.dart';
import '../utils/utils.dart';
import 'use_case.dart';

@injectable
class GetChatsUseCase implements UseCase<void, List<Chat>> {
  const GetChatsUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<List<Chat>>> execute(void _) {
    return _chatRepository.getChats();
  }
}

@injectable
class GetChatsStreamUseCase implements UseCase<void, Stream<List<Chat>>> {
  const GetChatsStreamUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<Stream<List<Chat>>>> execute(void _) {
    return _chatRepository.getChatsStream();
  }
}

@injectable
class CreateChatUseCase implements UseCase<String, int> {
  const CreateChatUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<int>> execute(String input) {
    return _chatRepository.createChat(title: input);
  }
}

@injectable
class DeleteChatUseCase implements UseCase<int, void> {
  const DeleteChatUseCase(this._chatRepository);

  final ChatRepository _chatRepository;

  @override
  Future<Result<void>> execute(int input) {
    return _chatRepository.deleteChat(input).mapToResult();
  }
}
