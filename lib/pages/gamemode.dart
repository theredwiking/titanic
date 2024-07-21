import 'package:flutter/material.dart';
import 'package:titanic/pages/players.dart';
import "package:flutter_gen/gen_l10n/app_localizations.dart";

class GamemodePage extends StatelessWidget {
  const GamemodePage({super.key});
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
              AppLocalizations.of(context)!.chooseModeBtn,
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
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersPage(mode: 'party')));
            },
            child: Text(AppLocalizations.of(context)!.partyBtn,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 27),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 45)),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersPage(mode: 'birthday')));
            },
            child: Text(AppLocalizations.of(context)!.birthdayBtn,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 27),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: const Color(0xFFFCECC9),
              minimumSize: const Size(263, 45),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PlayersPage(mode: 'christmas')));
            },
            child: Text(AppLocalizations.of(context)!.christmasBtn,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
        ],
      )),
    );
  }
}
