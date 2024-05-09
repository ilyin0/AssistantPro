part of 'chat_screen.dart';

class _MessagesList extends StatelessWidget {
  const _MessagesList({required this.messages});

  final List<Message> messages;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      reverse: true,
      itemCount: messages.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, item) {
        final message = messages[messages.length - item - 1];
        final messageAlignment = switch (message) {
          SentMessage() => Alignment.centerRight,
          ReceivedMessage() => Alignment.centerLeft,
        };
        return Align(
          alignment: messageAlignment,
          child: LayoutBuilder(
            builder: (_, constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: constraints.maxWidth * 0.8,
                ),
                child: _MessageItem(message: message),
              );
            },
          ),
        );
      },
    );
  }
}
