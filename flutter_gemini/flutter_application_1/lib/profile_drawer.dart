// profile_drawer.dart (Kode yang Diperbaiki untuk Mengatasi Overflow)

import 'package:flutter/material.dart';

class ProfileDrawer extends StatelessWidget {
  const ProfileDrawer({super.key});

  // Widget pembantu untuk item menu (seperti History, Apps, dll.)
  Widget _buildMenuItem(IconData icon, String title) {
    return InkWell(
      onTap: () {
        // Tambahkan fungsi yang ingin dijalankan saat menu ditekan
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            Icon(icon, color: Colors.white70, size: 24),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget pembantu untuk ikon akun kecil (Switch Account)
  Widget _buildSmallAccountIcon(String text, {Color color = Colors.transparent, bool isImage = false}) {
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: 1.5),
      ),
      child: CircleAvatar(
        radius: 10,
        backgroundColor: color == Colors.transparent ? Colors.orange.shade700 : color,
        child: isImage
            ? const Icon(Icons.person, color: Colors.white, size: 16)
            : Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
              ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.85, 
      backgroundColor: Colors.black, 
      child: SafeArea(
        // PASTIKAN SingleChildScrollView membungkus seluruh konten yang bisa overflow.
        child: SingleChildScrollView( 
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 20), // Padding bisa diatur di sini
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Profil (Email dan Tombol Tutup)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'stevensetiawan711@gmail.com',
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              
              // Detail Akun
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.green.shade700,
                        child: const Text('S', style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Icon(Icons.camera_alt, color: Colors.white, size: 16),
                      ),
                    ],
                  ),
                  const SizedBox(width: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Hi, Steven!',
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.grey),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                        ),
                        child: const Text(
                          'Manage your Google Account',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 25),
              
              // Switch Account
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Switch account', style: TextStyle(color: Colors.white, fontSize: 16)),
                  Row(
                    children: [
                      _buildSmallAccountIcon('V', color: Colors.blue.shade800),
                      const SizedBox(width: 8),
                      _buildSmallAccountIcon('A', isImage: true), 
                      const SizedBox(width: 8),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                ],
              ),
              const Divider(color: Color(0xFF3C4043), height: 30),
              
              // Bagian "More from Gemini"
              const Text('More from Gemini', style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 15),
              
              // Item: Upgrade to Google AI Plus
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.star, color: Color(0xFF8AB4F8), size: 24),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          'Upgrade to Google AI Plus',
                          style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Divider(color: Color(0xFF3C4043), height: 30),
              
              // Menu Lainnya
              _buildMenuItem(Icons.history, 'Gemini Apps Activity'),
              _buildMenuItem(Icons.description_outlined, 'Instructions for Gemini'),
              _buildMenuItem(Icons.apps_outlined, 'Apps'),
              _buildMenuItem(Icons.diamond_outlined, 'Gem manager'),
              _buildMenuItem(Icons.update_outlined, 'Updates'),
              _buildMenuItem(Icons.help_outline, 'Privacy Help Hub'),
              
              const SizedBox(height: 30), // Memberi sedikit ruang
              const Divider(color: Color(0xFF3C4043), height: 1),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: _buildMenuItem(Icons.assistant_navigation, 'Switch to Google Assistant'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}