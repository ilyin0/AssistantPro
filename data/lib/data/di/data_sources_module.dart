part of 'di.dart';

@module
abstract class DataSourcesModule {
  @singleton
  @preResolve
  Future<ChatsDataSource> getChatsDataSource() async {
    return _injectHiveDataSource(() => ChatsDataSource());
  }

  @singleton
  @preResolve
  Future<MessagesDataSource> getMessagesDataSource() async {
    return _injectHiveDataSource(() => MessagesDataSource());
  }

  Future<T> _injectHiveDataSource<T extends HiveDataSource>(
    T Function() dataSource,
  ) async {
    final localDataSource = dataSource();
    await localDataSource.init();
    return localDataSource;
  }
}
