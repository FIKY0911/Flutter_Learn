import 'package:flutter/material.dart';
import 'package:mynotes/core/constants/constants.dart';
import 'package:mynotes/features/notes/presentation/screens/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF7F7B86)),
        useMaterial3: true,
        fontFamily: 'Poppins',
        scaffoldBackgroundColor: background,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: primary,
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const MainPage(),
    );
  }
}
