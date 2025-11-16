import 'package:flutter/material.dart';

class KodeVoucherScreen extends StatelessWidget {
  const KodeVoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Voucher",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: TextField(
          decoration: InputDecoration(
            hintText: "Punya kode promo? Masukkan disini",
            prefixIcon: Image.asset('assets/images/icon_voucher.png', width: 24, height: 24),
            suffixIcon: const Icon(Icons.close, color: Colors.grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF0A6847), width: 1.2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color(0xFF0A6847), width: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
