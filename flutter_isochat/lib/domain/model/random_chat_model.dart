class RandomChatModel {
  final String? chat;
  final String? author;

  RandomChatModel(this.chat, this.author);

  static RandomChatModel empty = RandomChatModel(null, null);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomChatModel &&
          runtimeType == other.runtimeType &&
          chat == other.chat &&
          author == other.author;

  @override
  int get hashCode => chat.hashCode ^ author.hashCode;

  @override
  String toString() {
    return 'RandomChatModel{chat: $chat, author: $author}';
  }
}
