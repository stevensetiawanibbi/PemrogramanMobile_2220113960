import 'package:flutter/material.dart';

const Color kPrimaryGreen = Color(0xFF0F6A39);

enum ShowBy { semua, aplikasi, pickup, delivery, store }
enum SortDate { terbaru, satuHari, tigaHari, seminggu, sebulan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ShowBy _showBy = ShowBy.semua;
  SortDate _sortDate = SortDate.terbaru;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter'),
        leading: const BackButton(color: kPrimaryGreen),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                children: [
                  Text('TAMPILKAN BERDASARKAN', style: sectionTitleStyle()),
                  const SizedBox(height: 8),
                  buildRadioRow('Semua', ShowBy.semua),
                  buildRadioRow('Pemesanan via Aplikasi', ShowBy.aplikasi),
                  buildRadioRow('Pick Up', ShowBy.pickup),
                  buildRadioRow('Delivery', ShowBy.delivery),
                  buildRadioRow('Pemesanan di Store', ShowBy.store),
                  const SizedBox(height: 24),
                  Text('URUTKAN TANGGAL', style: sectionTitleStyle()),
                  const SizedBox(height: 8),
                  buildSortRow('Terbaru', SortDate.terbaru),
                  buildSortRow('1 hari sebelum', SortDate.satuHari),
                  buildSortRow('3 hari sebelum', SortDate.tigaHari),
                  buildSortRow('1 minggu sebelum', SortDate.seminggu),
                  buildSortRow('1 bulan sebelum', SortDate.sebulan),
                ],
              ),
            ),
            Container(
              color: kPrimaryGreen,
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
              child: SafeArea(
                top: false,
                child: SizedBox(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context, {'showBy': _showBy, 'sort': _sortDate});
                    },
                    child: const Text(
                      'TERAPKAN',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadioRow(String title, ShowBy value) {
    return InkWell(
      onTap: () => setState(() => _showBy = value),
      child: Row(
        children: [
          Radio<ShowBy>(
            value: value,
            groupValue: _showBy,
            onChanged: (v) => setState(() => _showBy = v!),
            activeColor: kPrimaryGreen,
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  Widget buildSortRow(String title, SortDate value) {
    return InkWell(
      onTap: () => setState(() => _sortDate = value),
      child: Row(
        children: [
          Radio<SortDate>(
            value: value,
            groupValue: _sortDate,
            onChanged: (v) => setState(() => _sortDate = v!),
            activeColor: kPrimaryGreen,
          ),
          Text(title, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  TextStyle sectionTitleStyle() => const TextStyle(
        color: kPrimaryGreen,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.3,
      );
}
