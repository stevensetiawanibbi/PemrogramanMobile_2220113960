import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WalletListScreen(),
    );
  }
}

class WalletListScreen extends StatelessWidget {
  final List<Map<String, String>> items = [
    {
      'image': 'assets/d1.jpeg',
      'title': 'Dompet Kelly Belly Grace Mini WD168',
      'price': 'IDR 17000',
      'new': 'NEW'
    },
    {
      'image': 'assets/d2.jpeg',
      'title': 'Dompet Rumbai Love Mini WD117',
      'price': 'IDR 17000',
      'new': 'NEW'
    },
    {
      'image': 'assets/d3.jpeg',
      'title': 'Dompet Lipat Forever Young Mini',
      'price': 'IDR 19000',
      'new': ''
    },
    {
      'image': 'assets/d4.jpeg',
      'title': 'Dompet Lidah Besi Panjang',
      'price': 'IDR 26000',
      'new': 'NEW'
    },
    {
      'image': 'assets/d5.jpeg',
      'title': 'Dompet Cat Hug Panjang',
      'price': 'IDR 24000',
      'new': 'NEW'
    },
    {
      'image': 'assets/d6.jpeg',
      'title': 'Dompet Aurel Mini',
      'price': 'IDR 24000',
      'new': ''
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dompet'),
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: Image.asset(
                    item['image']!,
                    width: 70,
                    height: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['title']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item['price']!,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                if (item['new']!.isNotEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 4),
                    child: Text(
                      'NEW',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
