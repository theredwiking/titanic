import 'package:flutter/material.dart';
import 'package:titanic/pages/add_question.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuestionPacksPage extends StatelessWidget {
  const QuestionPacksPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          const SizedBox(
            height: 70,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Text(
              AppLocalizations.of(context)!.questionsPackBanner,
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
                      builder: (context) => const AddQuestionPage(mode: 'party')));
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
                      builder: (context) =>
                          const AddQuestionPage(mode: 'birthday')));
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
                      builder: (context) =>
                          const AddQuestionPage(mode: 'christmas')));
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
