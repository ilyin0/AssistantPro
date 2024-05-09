part of 'chats_screen.dart';

Future<String?> _showCreateChatNameDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const _CreateChatNameDialog(),
  );
}

class _CreateChatNameDialog extends StatelessWidget {
  const _CreateChatNameDialog();

  @override
  Widget build(BuildContext context) {
    return TextInputAlertDialog(
      title: context.localizations.typeChatName,
      inputHintText: context.localizations.chatName,
      cancelButtonText: context.localizations.cancel,
      confirmButtonText: context.localizations.create,
    );
  }
}
