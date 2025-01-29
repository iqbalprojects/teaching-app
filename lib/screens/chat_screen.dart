import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachingapp2/providers/chat_provider.dart';
import 'package:teachingapp2/screens/bookmarks_screen.dart';
import 'package:teachingapp2/screens/categories_screen.dart';
import 'package:teachingapp2/screens/history_screen.dart';
import 'package:teachingapp2/theme/app_theme.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final chatProvider = Provider.of<ChatProvider>(context);

    return Scaffold(
      appBar: AppBar(
        actions: chatProvider.messages.length > 0
            ? [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    chatProvider.clearChat();
                  },
                ),
              ]
            : null,
        title: const Row(
          children: [
            Text(
              'TeachAI',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        backgroundColor: AppTheme.darkBackground,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => CategoriesScreen()));
                    },
                    icon: Icon(Icons.category, color: Colors.white),
                    label: const Text('Categories',
                        style: TextStyle(color: Colors.white))),
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => BookmarksScreen()));
                    },
                    icon: Icon(Icons.bookmark, color: Colors.white),
                    label: const Text('Bookmarks',
                        style: TextStyle(color: Colors.white))),
                TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => HistoryScreen()));
                    },
                    icon: Icon(Icons.history, color: Colors.white),
                    label: const Text(
                      'History',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          chatProvider.messages.length == 0
              ? const Expanded(
                  child: Center(
                  child: Text(
                      'Welcome to AI teaching assistant. How can I help you?'),
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: chatProvider.messages.length,
                    itemBuilder: (context, index) {
                      final message = chatProvider.messages[index];
                      if (message['role'] == 'system') {
                        return SizedBox.shrink();
                      }
                      return ListTile(
                        title: Text(message['content']!),
                        subtitle: Text(message['role']!),
                        leading: CircleAvatar(
                          child: Icon(message['role'] == 'user'
                              ? Icons.person
                              : Icons.android),
                        ),
                      );
                    },
                  ),
                ),
          if (chatProvider.isLoading) const LinearProgressIndicator(),
          SizedBox(height: 8),
          chatProvider.messages.length == 0
              ? SizedBox(
                  height: 38,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        onTap: () {
                          chatProvider.sendMessage('Buat Soal Matematika');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 8), // Memberi jarak antar item
                          decoration: BoxDecoration(
                            color: AppTheme.darkSurface,
                            borderRadius: BorderRadius.circular(
                                12), // Opsional, untuk tampilan lebih baik
                          ),
                          child: const Text(
                            'Buat Soal Matematika',
                            style: TextStyle(
                                color: Colors.white), // Sesuaikan dengan tema
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          chatProvider.sendMessage('Buat Soal Bahasa Inggris');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.darkSurface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Buat Soal Bahasa Inggris',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          chatProvider.sendMessage('Buat Soal IPA');
                        },
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: AppTheme.darkSurface,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            'Buat Soal IPA',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : SizedBox.shrink(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppTheme.messageGrey,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.white,
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      chatProvider.sendMessage(_messageController.text);
                      _messageController.clear();
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
