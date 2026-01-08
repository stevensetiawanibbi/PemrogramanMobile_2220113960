import 'package:flutter/material.dart';

class DetailVoucherScreen extends StatelessWidget {
  const DetailVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Detail Voucher",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/promo1.png', fit: BoxFit.cover, width: double.infinity),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Treats FOREveryday! Diskon 20%",
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "Nikmati diskon 20% hingga Rp50K dengan minimal belanja Rp99K. Yuk pesan sekarang!",
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Berlaku Hingga\n24 Okt 2025",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                      Text("Min Transaksi\nRp 99.000",
                          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  ListTile(
                    title: Text("Menu yang Berlaku",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    title: Text("Syarat & Ketentuan",
                        style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                  ListTile(
                    title:
                        Text("Cara Pemesanan", style: TextStyle(fontWeight: FontWeight.w600)),
                    trailing: Icon(Icons.arrow_forward_ios, size: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0A6847),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: const Text("Gunakan Sekarang",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ),
      ),
    );
  }
}