// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:domain/domain.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data.dart' as _i10;
import '../clients/gemini-client.dart' as _i5;
import '../data_sources/data_sources.dart' as _i6;
import '../mappers/chat_mappers.dart' as _i3;
import '../mappers/message_mappers.dart' as _i4;
import '../repositories/chat_repository.dart' as _i9;
import '../repositories/messages_repository.dart' as _i11;
import '../repositories/user_repository.dart' as _i8;
import 'di.dart' as _i12;

// initializes the registration of main-scope dependencies inside of GetIt
Future<_i1.GetIt> $injectDependencies(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) async {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  final dataSourcesModule = _$DataSourcesModule();
  gh.factory<_i3.ChatMapper>(() => const _i3.ChatMapper());
  gh.factory<_i4.MessageMapper>(() => const _i4.MessageMapper());
  gh.singleton<_i5.GeminiClient>(() => const _i5.GeminiClient());
  await gh.singletonAsync<_i6.ChatsDataSource>(
    () => dataSourcesModule.getChatsDataSource(),
    preResolve: true,
  );
  await gh.singletonAsync<_i6.MessagesDataSource>(
    () => dataSourcesModule.getMessagesDataSource(),
    preResolve: true,
  );
  gh.factory<_i7.UserRepository>(() => _i8.UserRepositoryImpl());
  gh.factory<_i3.ChatsListMapper>(
      () => _i3.ChatsListMapper(gh<_i3.ChatMapper>()));
  gh.factory<_i4.MessagesListMapper>(
      () => _i4.MessagesListMapper(gh<_i4.MessageMapper>()));
  gh.factory<_i7.ChatRepository>(() => _i9.ChatRepositoryImpl(
        gh<_i10.ChatsDataSource>(),
        gh<_i10.MessagesDataSource>(),
        gh<_i10.ChatMapper>(),
        gh<_i10.ChatsListMapper>(),
      ));
  gh.factory<_i7.MessagesRepository>(() => _i11.MessagesRepositoryImpl(
        gh<_i10.GeminiClient>(),
        gh<_i10.MessagesDataSource>(),
        gh<_i10.MessagesListMapper>(),
      ));
  return getIt;
}

class _$DataSourcesModule extends _i12.DataSourcesModule {}
