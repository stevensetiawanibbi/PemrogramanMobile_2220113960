import 'package:flutter/material.dart';
import 'screens/login1.dart';
import 'screens/login2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Multi Page App',
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage1(),
        '/home': (context) => const HomePage(),
      },
    );
  }
}
