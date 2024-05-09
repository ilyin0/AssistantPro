part of 'di.dart';

Future<void> _injectHive() async {
  final directory = await getApplicationDocumentsDirectory();
  Hive
    ..init(directory.path)
    ..registerAdapter(DataChatAdapter())
    ..registerAdapter(DataMessageSenderAdapter())
    ..registerAdapter(DataMessageAdapter());
}
