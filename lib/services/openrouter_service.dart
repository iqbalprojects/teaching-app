import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenRouterService {
  final String apiKey =
      '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';
  final String apiUrl = 'https://openrouter.ai/api/v1/chat/completions';

  Future<String> getAIResponse(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'openai/gpt-3.5-turbo',
          'messages': [
            {
              'role': 'system',
              'content':
                  'You are an AI teaching assistant for primary school senior teachers.'
            },
            {'role': 'user', 'content': message},
          ],
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['choices'][0]['message']['content'];
      } else {
        throw Exception('Failed to get AI response');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
