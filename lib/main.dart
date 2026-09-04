import 'package:flutter/material.dart';

import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const GoodFoodApp());
}

class GoodFoodApp extends StatelessWidget {
  const GoodFoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'GoodFood Restaurant',

      theme: AppTheme.lightTheme,

      home: const WelcomeScreen(),
    );
  }
}