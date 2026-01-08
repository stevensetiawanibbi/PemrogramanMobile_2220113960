import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import 'login_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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

  void logout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            /// AVATAR
            CircleAvatar(
              radius: 44,
              backgroundColor: Colors.teal,
              child: Text("S", style: TextStyle(fontSize: 36)),
            ),

            SizedBox(height: 16),

            /// USERNAME (SAMA PERSIS SEPERTI GAMBAR)
            Text(
              username.isEmpty ? " " : username,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24),

            /// DARK MODE TOGGLE
            ValueListenableBuilder<bool>(
              valueListenable: isDarkMode,
              builder: (_, value, __) {
                return SwitchListTile(
                  title: Text("Dark Mode"),
                  value: value,
                  onChanged: (val) async {
                    isDarkMode.value = val;
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setBool('darkMode', val);
                  },
                );
              },
            ),

            Spacer(),

            /// LOGOUT
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                ),
                onPressed: () => logout(context),
                icon: Icon(Icons.logout),
                label: Text("Logout"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
