import 'package:flutter/material.dart';

class KotakMasukScreen extends StatelessWidget {
  const KotakMasukScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // HEADER
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 40), // Untuk posisi jam (disembunyikan)
                const Text(
                  "Kotak Masuk",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF245C3E),
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(right: 16),
                    child: Icon(Icons.close_rounded,
                        size: 26, color: Color(0xFF245C3E)),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 40),

            const Text(
              "No message(s) to show",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
