import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fore_1/screens/kotak_masuk_screen.dart';
import 'package:flutter_fore_1/screens/my_fore_plan.dart';
import 'screens/login1.dart';
import 'screens/login2.dart';
import 'screens/home.dart';
import 'screens/voucher_screen.dart';
import 'screens/pesanan_screen.dart';
import 'screens/akun_screen.dart';
import 'screens/detail_voucher_screen.dart';
import 'screens/kode_voucher_screen.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FORE COFFEE APP',
      // Halaman pertama tetap login
      initialRoute: '/login1',
      routes: {
        '/login1': (context) => const ForeLoginPage(),
        '/login2': (context) => const LoginPage(),
        '/myforeplan': (context) => const MyForePlanScreen(),
        '/kotakmasuk': (context) => const KotakMasukScreen(),
        '/home': (context) => const MainScreen(), // Wrapper dengan bottom nav
      },
    );
  }
}

/// Wrapper utama dengan BottomNavigationBar dan animasi fade
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomeScreen(),
    VoucherScreen(),
    PesananScreen(),
    AkunScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300), // durasi animasi
        transitionBuilder: (child, animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: const Color(0xFF006C3B), // warna hijau khas Fore
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/home_icon.png', width: 24),
            activeIcon: Image.asset('assets/icons/home_icon.png', width: 28),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/voucher_icon.png', width: 24),
            activeIcon: Image.asset('assets/icons/voucher_icon.png', width: 28),
            label: 'Voucher',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/pesanan_icon.png', width: 24),
            activeIcon: Image.asset('assets/icons/pesanan_icon.png', width: 28),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icons/akun_icon.png', width: 24),
            activeIcon: Image.asset('assets/icons/akun_icon.png', width: 28),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}

