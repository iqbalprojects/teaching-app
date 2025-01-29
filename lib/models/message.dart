class Message {
  final String content;
  final bool isUser;
  final DateTime timestamp;
  bool isBookmarked;

  Message({
    required this.content,
    required this.isUser,
    required this.timestamp,
    this.isBookmarked = false,
  });

  String get timeString {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 1) {
      return 'Now';
    } else if (difference.inHours < 1) {
      return '${difference.inMinutes}m';
    } else if (difference.inDays < 1) {
      return '${difference.inHours}h';
    } else {
      return '${difference.inDays}d';
    }
  }
}
