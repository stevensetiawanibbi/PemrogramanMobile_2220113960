import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForeLoginPage extends StatelessWidget {
  const ForeLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Gambar header
            Stack(
              children: [
                Image.asset(
                  'assets/images/fore.jpg', // pastikan file ini ada di folder assets
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Judul dan deskripsi
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  Text(
                    "Berbagai Keuntungan Via Fore App",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF1D4E2E),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Pesan tanpa antri, dapat promo menarik setiap hari, Fore Poin, dan berbagai promo lainnya",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Dropdown negara
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/indonesia.png', // tambahkan bendera Indonesia
                    width: 24,
                    height: 16,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    "Indonesia",
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Tombol Masuk
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login2');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF006241),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: Text(
                  "Masuk",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tombol Masuk dengan Google
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/google.png', // logo Google kecil
                  width: 20,
                ),
                label: Text(
                  "Masuk dengan Google",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Lewati tahap ini
            TextButton(
              onPressed: () {},
              child: Text(
                "Lewati tahap ini",
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: const Color(0xFF006241),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
