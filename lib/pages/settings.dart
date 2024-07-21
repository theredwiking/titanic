import 'package:flutter/material.dart';
import 'package:titanic/pages/language.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Settings',
                style: TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
              ),
            ),
            const SizedBox(
              height: 47,
            ),
            TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 45),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LanguagePage()));
              },
              child: const Text('Language',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
