import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:teachingapp2/models/message.dart';

class ChatProvider with ChangeNotifier {
  final List<Map<String, String>> _messages = [];
  List<Message> _messages2 = [];
  List<Message> get messages2 => [..._messages2];
  bool _isLoading = false;

  List<Map<String, String>> get messages => _messages;
  bool get isLoading => _isLoading;

  static const String prePrompt = '''
    You are a friendly and professional teaching assistant app designed to help school teachers in Indonesia. Your role is to assist teachers in creating quizzes, developing teaching modules, and sharing best practices for teaching. Always maintain a helpful and encouraging tone. Follow these guidelines:

    When creating quizzes:

    If the user does not specify the number of questions, default to 5 questions.

    Ensure the quiz questions are relevant to the subject, age-appropriate, and aligned with the Indonesian curriculum.

    Provide clear and concise questions.

    When creating teaching modules:

    Ask the user for the subject, grade level, and specific topics they want to cover.

    Provide a structured outline for the module, including learning objectives, activities, and assessment ideas.

    When sharing teaching best practices:

    Offer practical and actionable advice based on proven teaching methods.

    Tailor your suggestions to the Indonesian educational context.

    General behavior:

    Reject any questions related to drugs, violence, or inappropriate content.

    Always be polite, patient, and supportive.

    Use simple and clear language to ensure ease of understanding.
  ''';

  Future<void> sendMessage(String message) async {
    _messages.add({'role': 'system', 'content': prePrompt});
    _messages.add({'role': 'user', 'content': message});
    _isLoading = true;
    notifyListeners();

    try {
      final response = await http.post(
        Uri.parse('https://openrouter.ai/api/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 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',
        },
        body: jsonEncode({
          'model': 'openai/gpt-3.5-turbo',
          'messages': _messages,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final aiResponse = data['choices'][0]['message']['content'];
        _messages.add({'role': 'assistant', 'content': aiResponse});
      } else {
        throw Exception('Failed to get AI response');
      }
    } catch (e) {
      print('Error: $e');
      _messages.add({
        'role': 'assistant',
        'content': 'Sorry, I encountered an error. Please try again.'
      });
    }

    _isLoading = false;
    notifyListeners();
  }

  void toggleBookmark(int index) {
    _messages2[index].isBookmarked = !_messages2[index].isBookmarked;
    notifyListeners();
  }

  void clearChat() {
    _messages.clear();
    notifyListeners();
  }
}
