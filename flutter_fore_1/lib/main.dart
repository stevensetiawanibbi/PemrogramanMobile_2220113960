import 'package:flutter/material.dart';
import 'screens/login1.dart';
import 'screens/login2.dart';
import 'screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FORE COFFEE APP',
      initialRoute: '/login1',
      routes: {
        '/login1': (context) => const ForeLoginPage(), // Route to the page widget inside login1 (do not return a nested MaterialApp)
        '/login2': (context) => const LoginPage(), // Route to the actual login page in login2.dart
        '/home': (context) => const HOME(),
      },
    );
  }
}
