import 'package:flutter/material.dart';
import 'home_screen.dart'; // Pastikan Anda membuat file ini

void main() {
  runApp(const GeminiAppClone());
}

class GeminiAppClone extends StatelessWidget {
  const GeminiAppClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gemini Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark, // Menggunakan tema gelap
        scaffoldBackgroundColor: Colors.black, // Background hitam
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
        // Menggunakan skema warna yang mirip dengan Gemini
        colorScheme: const ColorScheme.dark(
          primary: Colors.white,
          secondary: Color(0xFF1F1F1F), // Warna gelap untuk card/container
          surface: Colors.black,
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}