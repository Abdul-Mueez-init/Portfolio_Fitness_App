class ChatMessage {
  final String id;
  final String text;
  final bool isUser;
  final bool isTyping;
  final DateTime timestamp;

  const ChatMessage({
    required this.id,
    required this.text,
    required this.isUser,
    this.isTyping = false,
    required this.timestamp,
  });
}
