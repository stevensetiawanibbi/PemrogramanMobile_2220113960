import 'package:flutter/material.dart';

class MyForePlanScreen extends StatefulWidget {
  const MyForePlanScreen({super.key});

  @override
  State<MyForePlanScreen> createState() => _MyForePlanScreenState();
}

class _MyForePlanScreenState extends State<MyForePlanScreen> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 8),

            // ---------------- HEADER ----------------
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Icon(Icons.chevron_left_rounded,
                        size: 32, color: Colors.black),
                  ),
                ),
                Image.asset(
                  "assets/icons/myforeplan_logo.jpeg",
                  height: 32,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 16),
                  child: Icon(Icons.refresh_rounded,
                      size: 26, color: Colors.black),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ---------------- TITLE ----------------
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Nikmati beragam keuntungan hanya dengan sekali beli setiap bulannya.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- MAIN IMAGE ----------------
            Image.asset(
              "assets/images/myforeplan_hero.jpeg",
              height: 180,
              fit: BoxFit.contain,
            ),

            const SizedBox(height: 12),

            // ---------------- TAB BAR ----------------
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color(0xFFF2F2F2),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 0),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: selectedTab == 0
                              ? const Color(0xFF0B5F44)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            const Text(
                              "Signature",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                            Positioned(
                              right: 30,
                              top: 2,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 2),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Text(
                                  "Best",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => setState(() => selectedTab = 1),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        decoration: BoxDecoration(
                          color: selectedTab == 1
                              ? const Color(0xFF0B5F44)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: Text(
                            "Starter",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: selectedTab == 1
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ---------------- MENU LIST ----------------
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _benefitItem("Free 1 Cup", "1× transaksi/bulan"),
                    _benefitItem("Buy 1 Get 1", "Berlaku setiap tanggal 25"),
                    _benefitItem("Diskon 25%", ""),
                    const SizedBox(height: 20),

                    // PRICE AREA
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Rp 24.000 / bulan",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 6),
                          Text(
                            "Diperpanjang otomatis seharga Rp 24.000 di 15 Nov",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),

                    // BUTTON
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B5F44),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: const Center(
                        child: Text(
                          "Langganan Sekarang",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _benefitItem(String title, String subtitle) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7E8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600)),
              if (subtitle.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(subtitle,
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                )
            ],
          ),
          const Text(
            "1\nVoucher",
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 13),
          )
        ],
      ),
    );
  }
}
