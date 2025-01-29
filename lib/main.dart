import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teachingapp2/providers/auth_provider.dart';
import 'package:teachingapp2/providers/chat_provider.dart';
import 'package:teachingapp2/screens/home_screen.dart';
import 'package:teachingapp2/theme/app_theme.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Teaching Assistant',
      theme: AppTheme.darkTheme(),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
