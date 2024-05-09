part of 'chat_screen.dart';

class _MessageInput extends StatelessWidget {
  const _MessageInput({
    required this.focusNode,
    required this.controller,
    required this.onSubmitted,
  });

  final FocusNode focusNode;
  final TextEditingController controller;
  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: controller,
      maxLines: 10,
      minLines: 1,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: IconButton(
          icon: const Icon(Icons.send),
          onPressed: () => onSubmitted(controller.text),
        ),
      ),
      onTapOutside: (_) => focusNode.unfocus(),
      onSubmitted: onSubmitted,
    );
  }
}
