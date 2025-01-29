import 'package:flutter/material.dart';
import 'package:teachingapp2/models/message.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: message.isUser ? Colors.blue[100] : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment:
            message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message.isUser ? 'You' : 'AI Assistant',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: message.isUser ? Colors.blue[800] : Colors.grey[800],
            ),
          ),
          const SizedBox(height: 4),
          Text(message.content),
          const SizedBox(height: 4),
          Text(
            message.timestamp.toString(),
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
