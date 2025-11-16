import 'package:flutter/material.dart';
import 'detail_voucher_screen.dart';
import 'kode_voucher_screen.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
  final TextEditingController _kodeController = TextEditingController();

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
          "Voucher",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ===============================
            // 🔹 TextField Kode Promo
            // ===============================
            TextField(
              controller: _kodeController,
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              decoration: InputDecoration(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Image.asset(
                    'assets/icons/voucher_icon.png',
                    width: 22,
                    height: 22,
                  ),
                ),
                prefixIconConstraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                hintText: "Punya kode promo? Masukkan disini",
                hintStyle: const TextStyle(
                  color: Colors.grey,
                  fontSize: 15,
                ),
                suffixIcon: _kodeController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.close, color: Colors.grey),
                        onPressed: () => setState(() => _kodeController.clear()),
                      )
                    : null,
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
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

            const SizedBox(height: 16),

            // 🔹 Banner MyFore Plan
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF007A74),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/myforeplan');
                },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Expanded(
                    child: Text(
                      "Mau lebih banyak diskon tiap hari?\nYuk langganan MyFore Plan!",
                      style: TextStyle(color: Colors.white, fontSize: 14, height: 1.4),
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
                ],
              ),
            ),
          ),

            const SizedBox(height: 20),

            // 🔹 Header
            const Text(
              "Voucher Belanja",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 4),
            const Text(
              "7 voucher",
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
            const SizedBox(height: 12),

            // 🔹 Voucher Card
            _buildVoucherCard(
              context,
              title: "Treats FOREveryday! Diskon 20%",
              subtitle: "Maksimum Rp50K",
              berlaku: "24 Okt 2025",
              minTransaksi: "Rp 99.000",
            ),
            const SizedBox(height: 12),
            _buildVoucherCard(
              context,
              title: "Buy Hydro Flask Tumbler Get Free Cup Worth Up To Rp33K",
              subtitle: "Min. Pembelian 1 Tumbler",
              berlaku: "31 Okt 2025",
              minTransaksi: "-",
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // 🔸 Widget Card Voucher
  Widget _buildVoucherCard(BuildContext context,
      {required String title,
      required String subtitle,
      required String berlaku,
      required String minTransaksi}) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFFDFDFD),
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade200, blurRadius: 6, offset: const Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Berlaku Hingga\n$berlaku", style: const TextStyle(fontSize: 13)),
              Text("Min Transaksi\n$minTransaksi", style: const TextStyle(fontSize: 13)),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const DetailVoucherScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A6847),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Pakai", style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
