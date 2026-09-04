import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepOrange,
    ),

    scaffoldBackgroundColor: const Color(0xFFFFF8F3),

    appBarTheme: const AppBarTheme(
      centerTitle: true,
      elevation: 0,
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}