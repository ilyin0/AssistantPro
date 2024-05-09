part of 'chats_screen.dart';

Future<bool?> _deleteChatDialog(
  BuildContext context, {
  required String chatTitle,
}) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => _DeleteChatDialog(chatTitle: chatTitle),
  );
}

class _DeleteChatDialog extends StatelessWidget {
  const _DeleteChatDialog({
    required this.chatTitle,
  });

  final String chatTitle;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text(context.localizations.deleteChatQuestion(chatTitle)),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(context.localizations.no),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(context.localizations.yesDelete),
        ),
      ],
    );
  }
}
