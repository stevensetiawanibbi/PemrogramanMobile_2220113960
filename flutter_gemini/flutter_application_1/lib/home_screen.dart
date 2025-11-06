import 'package:flutter/material.dart';
import 'profile_drawer.dart'; // Pastikan Anda membuat file ini

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Kunci untuk mengakses ScaffoldState (untuk membuka drawer)
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    
    // Icon lingkaran kecil untuk akun (mirip dengan 'V' dan gambar kecil)
    Widget _buildAccountIcon(String text, {Color color = Colors.transparent, bool hasBorder = false}) {
      return Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: hasBorder ? Border.all(color: Colors.white, width: 1.5) : null,
        ),
        child: CircleAvatar(
          radius: 12,
          backgroundColor: color,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    return Scaffold(
      key: _scaffoldKey, // Kunci scaffold
      backgroundColor: Colors.black,
      // Mengganti App Bar dengan baris yang dikustomisasi
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0, left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () {
                  _scaffoldKey.currentState?.openDrawer(); // Membuka drawer
                },
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1F1F1F),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Text('Gemini', style: TextStyle(color: Colors.white, fontSize: 16)),
                        Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 18),
                        Text('2.5 Flash', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  // Icon Profil di kanan atas
                  GestureDetector(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.green.shade700,
                      child: const Text('S', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      
      // Menu Samping (Drawer)
      drawer: const ProfileDrawer(), 

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Hello, Steven',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF8AB4F8), // Warna biru Gemini
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Grid Tombol Fungsional
                    Wrap(
                      spacing: 12.0, // Jarak horizontal antar tombol
                      runSpacing: 12.0, // Jarak vertikal antar baris tombol
                      alignment: WrapAlignment.center,
                      children: [
                        _buildFeatureButton('Create Image', const Color(0xFF1F1F1F), Icons.phone_iphone), // Mengganti ikon pisang dengan ikon lain (karena tidak ada ikon pisang di MD)
                        _buildFeatureButton('Write', const Color(0xFF1F1F1F)),
                        _buildFeatureButton('Build', const Color(0xFF1F1F1F)),
                        _buildFeatureButton('Deep Research', const Color(0xFF1F1F1F)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Bagian Bawah Input Chat
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFF1F1F1F), // Background gelap untuk input
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.grey.shade700)
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        hintText: 'Ask Gemini',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      onSubmitted: (text) {
                        // Logika saat tombol kirim ditekan (opsional)
                      },
                    ),
                  ),
                  const Icon(Icons.add, color: Colors.grey),
                  const SizedBox(width: 12),
                  const Icon(Icons.mic, color: Colors.grey),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget pembantu untuk tombol fungsional
  Widget _buildFeatureButton(String text, Color color, [IconData? icon]) {
    return Container(
      width: 150, // Sesuaikan lebar agar terlihat seperti grid
      height: 50,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(icon, color: Colors.yellow.shade700, size: 20),
              const SizedBox(width: 4),
            ],
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}