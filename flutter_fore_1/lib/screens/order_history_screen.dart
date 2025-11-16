import 'package:flutter/material.dart';
import 'filter_screen.dart';

const Color kPrimaryGreen = Color(0xFF0F6A39);

class OrderHistoryScreen extends StatelessWidget {
  const OrderHistoryScreen({Key? key}) : super(key: key);

  String _monthString(int m) {
    const months = ['', 'Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'];
    return months[m];
  }

  String _weekdayString(int w) {
    const wd = ['', 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat', 'Sabtu', 'Minggu'];
    return wd[w];
  }

  @override
  Widget build(BuildContext context) {
    final orders = [
      {
        'status': 'Berhasil',
        'place': 'Thamrin Plaza Medan Lt.2',
        'to': 'ke PT.Megah Tetap Sakti',
        'date': DateTime(2025, 9, 23, 14, 38),
        'item': '1 Iced Matcha Butter Salt Cream, 1 Ice...',
        'count': 4,
        'price': 'Rp 108.900'
      },
      {
        'status': 'Berhasil',
        'place': 'Thamrin Plaza Medan Lt.2',
        'to': '',
        'date': DateTime(2025, 7, 9, 17, 57),
        'item': '1 Iced Buttercream Tiramisu Latte',
        'count': 1,
        'price': 'Rp 20.000'
      },
      {
        'status': 'Berhasil',
        'place': 'Thamrin Plaza Medan Lt.2',
        'to': '',
        'date': DateTime(2025, 7, 9, 17, 54),
        'item': '1 Iced Butterscotch Sea Salt Latte',
        'count': 1,
        'price': 'Rp 26.000'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pemesanan'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FilterScreen()),
              );
            },
            icon: const Icon(Icons.tune, color: kPrimaryGreen),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: orders.length,
          itemBuilder: (context, i) {
            final o = orders[i];
            final date = o['date'] as DateTime;
            final tanggal =
                '${_weekdayString(date.weekday)}, ${date.day} ${_monthString(date.month)} ${date.year} ${date.hour}:${date.minute.toString().padLeft(2, '0')}';

            return Container(
              margin: const EdgeInsets.only(bottom: 12),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(o['status'] as String,
                      style: const TextStyle(
                          color: kPrimaryGreen, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(o['place'] as String,
                      style: const TextStyle(fontWeight: FontWeight.w600)),
                  if ((o['to'] as String).isNotEmpty)
                    Text(o['to'] as String, style: const TextStyle(fontSize: 13)),
                  const SizedBox(height: 4),
                  Text(tanggal, style: TextStyle(color: Colors.grey[700], fontSize: 12)),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Expanded(
                        child: Text(o['item'] as String,
                            style: const TextStyle(fontSize: 14)),
                      ),
                      const SizedBox(width: 8),
                      const Text('Pemesanan via Aplikasi',
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                      const Icon(Icons.smartphone, size: 16, color: Colors.grey),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${o['count']} item • ${o['price']}',
                        style: const TextStyle(
                            color: kPrimaryGreen, fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kPrimaryGreen,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('PESAN LAGI',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
