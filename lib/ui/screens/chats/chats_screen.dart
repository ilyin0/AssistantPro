import 'package:assistant_pro/navigation/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:presentation/presentation.dart';

import '../../../di/di.dart';
import '../../../localizations/localizations.dart';
import '../../../navigation/navigation.dart';
import '../../widgets/widgets.dart';

part 'create_chat_name_dialog.dart';
part 'delete_chat_dialog.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  final ChatsCubit _cubit = getIt.get();

  @override
  void initState() {
    super.initState();
    _cubit.init();
  }

  @override
  void dispose() {
    _cubit.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newChatDefaultName = context.localizations.newChat;
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localizations.assistantPro),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final chatName = await _showCreateChatNameDialog(context);
          if (chatName != null) {
            _cubit.createChat(
              title: chatName.isNotEmpty ? chatName : newChatDefaultName,
            );
          }
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<ChatsCubit, HomeState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is HomeChatCreatedState) {
            _openChat(chatId: state.createdChatId.toString());
          }
        },
        builder: (context, state) {
          final chats = state.chats;
          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, index) {
              final chat = chats[index];
              final chatTitle = chat.title;
              final displayChatTitle = chatTitle != null && chatTitle.isNotEmpty
                  ? chatTitle
                  : context.localizations.chat;
              return Dismissible(
                key: ValueKey(chat.id),
                confirmDismiss: (_) => _deleteChatDialog(
                  context,
                  chatTitle: displayChatTitle,
                ),
                onDismissed: (_) => _cubit.deleteChat(chat.id),
                direction: DismissDirection.endToStart,
                background: const ColoredBox(color: Colors.red),
                child: ListTile(
                  title: Text(displayChatTitle),
                  onTap: () {
                    context.goNamed(
                      AppRoutes.chat,
                      pathParameters: {
                        AppRoutes.chatParameters.chatId: chat.id.toString(),
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  void _openChat({required String chatId}) {
    if (mounted) {
      context.goNamed(
        AppRoutes.chat,
        pathParameters: {AppRoutes.chatParameters.chatId: chatId},
      );
    }
  }
}
