class Chat {
  const Chat({
    required this.id,
    this.title,
  });

  final int id;
  final String? title;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Chat &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          title == other.title;

  @override
  int get hashCode => id.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'Chat{id: $id, title: $title}';
  }
}
