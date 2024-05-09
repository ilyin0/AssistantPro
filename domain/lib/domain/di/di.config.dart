// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain.dart' as _i6;
import '../repositories/repositories.dart' as _i4;
import '../use_cases/chat_use_cases.dart' as _i5;
import '../use_cases/chats_use_cases.dart' as _i3;

// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $injectDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.GetChatsUseCase>(
      () => _i3.GetChatsUseCase(gh<_i4.ChatRepository>()));
  gh.factory<_i3.GetChatsStreamUseCase>(
      () => _i3.GetChatsStreamUseCase(gh<_i4.ChatRepository>()));
  gh.factory<_i3.CreateChatUseCase>(
      () => _i3.CreateChatUseCase(gh<_i4.ChatRepository>()));
  gh.factory<_i3.DeleteChatUseCase>(
      () => _i3.DeleteChatUseCase(gh<_i4.ChatRepository>()));
  gh.factory<_i5.GetChatMessagesUseCase>(
      () => _i5.GetChatMessagesUseCase(gh<_i6.MessagesRepository>()));
  gh.factory<_i5.SendMessageUseCase>(
      () => _i5.SendMessageUseCase(gh<_i6.MessagesRepository>()));
  gh.factory<_i5.GetChatUseCase>(
      () => _i5.GetChatUseCase(gh<_i6.ChatRepository>()));
  gh.factory<_i5.UpdateChatTitleUseCase>(
      () => _i5.UpdateChatTitleUseCase(gh<_i6.ChatRepository>()));
  return getIt;
}
