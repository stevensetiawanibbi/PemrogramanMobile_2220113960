import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ============================
                // BANNER PROMO BESAR
                // ============================
                Stack(
                  children: [
                    Image.asset(
                      "assets/images/home_banner.jpeg",
                      width: double.infinity,
                      height: 260,
                      fit: BoxFit.cover,
                    ),

                    // ICON NOTIFIKASI DIPINDAH KE ATAS
                    Positioned(
                      top: 40,
                      right: 20,
                      child:GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/kotakmasuk');
                        },
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: const Color(0xFFE6F2EC),
                          child: Icon(Icons.notifications_none, color: Colors.green[700]),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                // ============================
                // KARTU POIN
                // ============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 18,
                          backgroundColor: const Color(0xFFE6F2EC),
                          child: Icon(Icons.eco, color: Colors.green[700]),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "19 Poin",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const Spacer(),
                        Icon(Icons.arrow_forward_ios,
                            size: 18, color: Colors.black54),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                // ============================
                // MY FORE PLAN (GAMBAR SAJA)
                // ============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/myforeplan');
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "assets/images/myforeplan_bg.jpeg",
                        width: double.infinity,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // ============================
                // SALAM + TOMBOL PICKUP/DELIVERY
                // ============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Hi JOHANA, Pesan Sekarang?",
                    style: GoogleFonts.poppins(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Image.asset(
                          "assets/images/pickup.png",
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Image.asset(
                          "assets/images/delivery.png",
                          height: 120,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // ============================
                // SECTION: Yang Menarik di Fore
                // ============================
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Yang Menarik di Fore",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                const SizedBox(height: 14),

                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.only(left: 16),
                    children: [
                      _buildPromoCard("assets/images/promo1.jpeg"),
                      _buildPromoCard("assets/images/promo2.jpeg"),
                    ],
                  ),
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================
  // KARTU PROMO LISTVIEW
  // ============================
  Widget _buildPromoCard(String img) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 6,
            offset: const Offset(0, 3),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(
          img,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
