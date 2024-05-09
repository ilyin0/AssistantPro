part of 'chat_screen.dart';

class _MessageWidget extends StatelessWidget {
  const _MessageWidget({
    required this.text,
    required this.textColor,
    required this.color,
  });

  final String text;
  final Color textColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: SelectableText(
        text,
        style: TextStyle(color: textColor),
      ),
    );
  }
}
