import 'package:flutter/material.dart';

class TextInputAlertDialog extends StatefulWidget {
  const TextInputAlertDialog({
    required this.title,
    required this.inputHintText,
    required this.cancelButtonText,
    required this.confirmButtonText,
    this.initialText = '',
    super.key,
  });

  final String title;
  final String inputHintText;
  final String cancelButtonText;
  final String confirmButtonText;
  final String initialText;

  @override
  State<TextInputAlertDialog> createState() => _TextInputAlertDialogState();
}

class _TextInputAlertDialogState extends State<TextInputAlertDialog> {
  late final _textController = TextEditingController(text: widget.initialText);

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: TextField(
        controller: _textController,
        autofocus: true,
        decoration: InputDecoration(hintText: widget.inputHintText),
        onSubmitted: (chatName) {
          Navigator.of(context).pop(chatName);
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(widget.cancelButtonText),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(_textController.text),
          child: Text(widget.confirmButtonText),
        ),
      ],
    );
  }
}
