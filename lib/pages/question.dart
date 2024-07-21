import 'dart:math';
import 'package:flutter/material.dart';
import 'package:titanic/db/questions.dart';

class QuestionPage extends StatefulWidget {
  final String mode;
  final List<String> players;
  const QuestionPage({super.key, required this.mode, required this.players});

  @override
  State createState() => _State(mode: mode, players: players);
}

class _State extends State<QuestionPage> {
  final String mode;
  final List<String> players;
  late List<Question> questions = [];
  late bool fetched = false;
  late final Questions pack;
  _State({required this.mode, required this.players}) {
    pack = Questions(pack: mode);
  }
  late String _question = 'To start click next';

  void selectQuestion() {
    if (questions.length >= 2) {
      Random random = Random();
      int questIdx = random.nextInt(questions.length);
      _question = insertNames(questIdx);
      questions.removeAt(questIdx);
    } else if (questions.length == 1) {
      _question = insertNames(0);
      questions.removeAt(0);
    } else {
      _question = 'No more questions, get an life';
    }
    setState(() {});
  }

  String insertNames(int questIdx) {
    String temp = questions[0].toQuest();
    for(int i=0; i < temp.length; i++) {
      if (temp[i] == '&') {
        Random random = Random();
        String player = players[random.nextInt(players.length)];
        temp = temp.replaceFirst(RegExp(r'&'), player);
      }
    }
    return temp;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 40),
            child: Text(
              'Question',
              style: TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
            ),
          )),
          Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Text(
             _question,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
                backgroundColor: Color(0xFF177E89),
              ),
            ),
          )),
      Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: TextButton(
              style: TextButton.styleFrom(
                  backgroundColor: const Color(0xFFFCECC9),
                  minimumSize: const Size(263, 45)),
              onPressed: () async {
                if (!fetched) {
                  questions = await pack.packQuestions();
                  fetched = true;
                }
                selectQuestion();
              },
              child: const Text('Next',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
            ),
          ))
    ]));
  }
}