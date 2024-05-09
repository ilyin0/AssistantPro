import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/presentation.dart';

import '../../../di/di.dart';
import '../../../localizations/localizations.dart';
import '../../widgets/widgets.dart';

part 'message_input.dart';
part 'message_item.dart';
part 'message_widget.dart';
part 'messages_list.dart';
part 'update_chat_title_dialog.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({
    required this.chatId,
    super.key,
  });

  final int chatId;

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ChatCubit _cubit = getIt.get();

  final FocusNode _messageInputFocusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _cubit.init(widget.chatId);
  }

  @override
  void dispose() {
    _messageInputFocusNode.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: buildChatTitle(),
        actions: [_buildEditTitleButton()],
      ),
      body: SafeArea(
        minimum: const EdgeInsets.only(bottom: 8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<ChatCubit, ChatState>(
                  bloc: _cubit,
                  builder: (_, state) {
                    return _MessagesList(messages: state.messages);
                  },
                ),
              ),
              const SizedBox(height: 8),
              _MessageInput(
                focusNode: _messageInputFocusNode,
                controller: _messageController,
                onSubmitted: (message) {
                  _cubit.sendMessage(message);
                  _messageInputFocusNode.unfocus();
                  _messageController.clear();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildChatTitle() {
    return BlocBuilder<ChatCubit, ChatState>(
      bloc: _cubit,
      builder: (_, state) {
        return Text(state.chat?.title ?? '');
      },
    );
  }

  Widget _buildEditTitleButton() {
    return BlocBuilder<ChatCubit, ChatState>(
      bloc: _cubit,
      builder: (context, state) {
        return IconButton(
          onPressed: () async {
            final newChatTitle = await _showUpdateChatTitleDialog(
              context,
              currentChatName: state.chat?.title ?? '',
            );

            if (newChatTitle != null) {
              _cubit.updateChatTitle(newChatTitle);
            }
          },
          icon: const Icon(Icons.edit),
        );
      },
    );
  }
}
