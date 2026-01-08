import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username = "";

  @override
  void initState() {
    super.initState();
    loadUsername();
  }

  void loadUsername() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: Icon(Icons.menu),
        centerTitle: true,
        title: Text("Gemini"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => ProfilePage()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                child: Text("S"),
              ),
            ),
          )
        ],
      ),

      /// BODY + INPUT BOX BAWAH
      body: Column(
        children: [
          /// ===== MAIN CONTENT =====
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 32, 24, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hi ${username.isEmpty ? '' : username}",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Where should we start?",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 32),
                  _actionButton("🍌  Create image"),
                  _actionButton("📝  Write anything"),
                  _actionButton("📚  Help me learn"),
                  _actionButton("✨  Boost my day"),
                ],
              ),
            ),
          ),

          /// ===== BOTTOM INPUT (100% MIRIP GAMBAR) =====
          _bottomInput(),
        ],
      ),
    );
  }

  /// BUTTON STYLE GEMINI
  Widget _actionButton(String text) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      height: 52,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(30),
      ),
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text(text, style: TextStyle(fontSize: 16)),
    );
  }

  /// BOTTOM TEXT BOX
  Widget _bottomInput() {
  final TextEditingController inputCtrl = TextEditingController();

  return Container(
    padding: EdgeInsets.fromLTRB(16, 12, 16, 20),
    color: Colors.black,
    child: Container(
      height: 54,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: [
          Icon(Icons.add, color: Colors.grey),
          SizedBox(width: 12),

          /// TEXT INPUT (AKTIF)
          Expanded(
            child: TextField(
              controller: inputCtrl,
              style: TextStyle(color: Colors.white),
              cursorColor: Colors.white,
              decoration: InputDecoration(
                hintText: "Ask Gemini",
                hintStyle: TextStyle(color: Colors.grey),
                border: InputBorder.none,
                isCollapsed: true,
              ),
            ),
          ),

          /// MODE FAST
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.grey.shade800,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                Text("Fast", style: TextStyle(fontSize: 12)),
                SizedBox(width: 4),
                Icon(Icons.circle, size: 8, color: Colors.blue),
              ],
            ),
          ),

          SizedBox(width: 12),
          Icon(Icons.mic, color: Colors.grey),
          SizedBox(width: 12),
          Icon(Icons.graphic_eq, color: Colors.white),
        ],
      ),
    ),
  );
}
}