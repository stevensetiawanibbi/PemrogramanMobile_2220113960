import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final userCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  void login(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('login', true);
    await prefs.setString('username', userCtrl.text);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("LOGIN",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            SizedBox(height: 32),
            TextField(
              controller: userCtrl,
              decoration: InputDecoration(labelText: "Username"),
            ),
            SizedBox(height: 16),
            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => login(context),
                child: Text("MASUK"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
