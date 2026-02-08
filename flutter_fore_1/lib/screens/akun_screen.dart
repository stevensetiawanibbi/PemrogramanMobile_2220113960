import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

const Color kPrimaryGreen = Color(0xFF0F6A39);


class AkunScreen extends StatefulWidget {
  const AkunScreen({Key? key}) : super(key: key);

  @override
  State<AkunScreen> createState() => _AkunScreenState();
}

class _AkunScreenState extends State<AkunScreen> {
  User? user;

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  String username = 'JOHANA';
  String phone = '+62895320322139';
  double profileComplete = 0.25;

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser;

    if (user != null && user!.displayName != null) {
      username = user!.displayName!;
    }
  }

  @override 
  Widget build(BuildContext context) {
    Future<void> logout() async {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();

      if (!mounted) return;

      Navigator.pushNamedAndRemoveUntil(
        context,
        '/login1',
        (route) => false,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Akun Saya'),
        leading: const BackButton(color: kPrimaryGreen),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 10),
            Center(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'Member sejak : 09 Juli 2025',
                  style: TextStyle(color: Colors.black87),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundImage:
                        user?.photoURL != null ? NetworkImage(user!.photoURL!) : null,
                    backgroundColor: Colors.grey[300],
                  ),
                  Positioned(
                    right: 6,
                    bottom: 6,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.edit, size: 18, color: kPrimaryGreen),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'Lengkapi data dirimu sekarang dan dapatkan voucher menarik di hari spesialmu*.',
                textAlign: TextAlign.center,
                style: TextStyle(color: kPrimaryGreen, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 10),
            LinearProgressIndicator(
              value: profileComplete,
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(kPrimaryGreen),
            ),
            const SizedBox(height: 20),
            buildEditableField('Username', username, onEdit: (v) => setState(() => username = v)),
            buildEditableField('Email', 'Email', isPlaceholder: true),
            buildStaticField('Tanggal Lahir'),
            buildStaticField('Jenis Kelamin'),
            buildStaticField('Nomer Telepon', value: phone),
            const SizedBox(height: 30),
            const Text('LAINNYA',
                style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),

            ElevatedButton(
              onPressed: logout,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 48),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
              child: const Text('Logout Semua Akun'),
            ),

            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();

                Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/login1',
                  (route) => false,
                );
              },
              child: const Text(
                'Keluar',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget buildEditableField(String label, String value,
      {bool isPlaceholder = false, ValueChanged<String>? onEdit}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: fieldLabelStyle()),
        Row(
          children: [
            Expanded(
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18,
                  color: isPlaceholder ? Colors.grey[400] : kPrimaryGreen,
                  fontWeight: isPlaceholder ? FontWeight.normal : FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                if (onEdit != null) _showEditDialog(label, value, onEdit);
              },
              icon: const Icon(Icons.edit, color: kPrimaryGreen),
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }

  Widget buildStaticField(String label, {String value = ''}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: fieldLabelStyle()),
        const SizedBox(height: 8),
        if (value.isNotEmpty)
          Text(value, style: const TextStyle(color: Colors.grey, fontSize: 16)),
        const Divider(),
      ],
    );
  }

  TextStyle fieldLabelStyle() =>
      const TextStyle(color: Colors.grey, fontWeight: FontWeight.w600);

  void _showEditDialog(String title, String initial, ValueChanged<String> onSaved) {
    final controller = TextEditingController(text: initial);
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: Text('Edit $title'),
        content: TextField(controller: controller),
        actions: [
          TextButton(onPressed: () => Navigator.pop(c), child: const Text('Batal')),
          TextButton(
            onPressed: () {
              onSaved(controller.text.trim());
              Navigator.pop(c);
            },
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}