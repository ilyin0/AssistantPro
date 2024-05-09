// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../presentation/blocs/chat/chat_cubit.dart' as _i5;
import '../presentation/blocs/chats/chats_cubit.dart' as _i3;

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
  gh.factory<_i3.ChatsCubit>(() => _i3.ChatsCubit(
        gh<_i4.GetChatsUseCase>(),
        gh<_i4.GetChatsStreamUseCase>(),
        gh<_i4.CreateChatUseCase>(),
        gh<_i4.DeleteChatUseCase>(),
      ));
  gh.factory<_i5.ChatCubit>(() => _i5.ChatCubit(
        gh<_i4.GetChatUseCase>(),
        gh<_i4.GetChatMessagesUseCase>(),
        gh<_i4.UpdateChatTitleUseCase>(),
        gh<_i4.SendMessageUseCase>(),
      ));
  return getIt;
}
