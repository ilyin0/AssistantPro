sealed class Message {
  const Message({
    required this.text,
  });

  final String text;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Message &&
          runtimeType == other.runtimeType &&
          text == other.text;

  @override
  int get hashCode => text.hashCode;
}

class SentMessage extends Message {
  const SentMessage({
    required super.text,
  });
}

class ReceivedMessage extends Message {
  const ReceivedMessage({
    required super.text,
  });
}
