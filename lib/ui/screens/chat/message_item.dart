part of 'chat_screen.dart';

class _MessageItem extends StatelessWidget {
  const _MessageItem({required this.message});

  final Message message;

  @override
  Widget build(BuildContext context) {
    return switch (message) {
      SentMessage() => _MessageWidget(
          text: message.text,
          textColor: Theme.of(context).colorScheme.onSecondary,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ReceivedMessage() => _MessageWidget(
          text: message.text,
          textColor: Theme.of(context).colorScheme.onTertiary,
          color: Theme.of(context).colorScheme.tertiary,
        ),
    };
  }
}
