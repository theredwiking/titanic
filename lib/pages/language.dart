import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguagePage extends StatelessWidget {
  late final SharedPreferences prefs;
  LanguagePage({super.key}) {
    _init();
  }

  Future _init() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 60,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              AppLocalizations.of(context)!.languageBanner,
              style: const TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
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
            onPressed: () async {
              await prefs.setString('language', 'en');
            },
            child: const Text('English',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 27),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 45)),
            onPressed: () async {
              await prefs.setString('language', 'da');
            },
            child: const Text('Dansk',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ],
      )),
    );
  }
}
