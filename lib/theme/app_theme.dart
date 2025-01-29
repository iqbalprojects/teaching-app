import 'package:flutter/material.dart';

class AppTheme {
  static const primaryColor = Color(0xFF0066FF);
  static const darkBackground = Color(0xFF1A1D21);
  static const darkSurface = Color(0xFF2A2D31);
  static const messageGrey = Color(0xFF383B3F);

  static ThemeData darkTheme() {
    return ThemeData.dark().copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: darkBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: darkBackground,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: darkBackground,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
