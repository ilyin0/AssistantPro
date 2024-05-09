part of 'chat_screen.dart';

Future<String?> _showUpdateChatTitleDialog(
  BuildContext context, {
  required String currentChatName,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return _UpdateChatTitleDialog(currentChatName: currentChatName);
    },
  );
}

class _UpdateChatTitleDialog extends StatelessWidget {
  const _UpdateChatTitleDialog({
    required this.currentChatName,
  });

  final String currentChatName;

  @override
  Widget build(BuildContext context) {
    return TextInputAlertDialog(
      title: context.localizations.typeNewChatName,
      inputHintText: context.localizations.newChatName,
      cancelButtonText: context.localizations.cancel,
      confirmButtonText: context.localizations.rename,
      initialText: currentChatName,
    );
  }
}
