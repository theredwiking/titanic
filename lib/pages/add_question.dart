import 'dart:async';

import 'package:flutter/material.dart';
import 'package:titanic/db/questions.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddQuestionPage extends StatefulWidget {
  final String mode;
  const AddQuestionPage({super.key, required this.mode});

  @override
  State createState() => _State(mode: mode);
}

class _State extends State<AddQuestionPage> {
  final String mode;
  late List<Question> customQuestions = [];
  late final Questions pack;
  final TextEditingController questionCtl = TextEditingController();
  _State({required this.mode}) {
    pack = Questions(pack: mode);
    _init();
  }

  Future _init() async {
    await pack.init();
    customQuestions = await pack.customQuestions();
    setState(() {});
  }

  Future _addQuestion(String question) async  {
    Question newQuestion = Question(question: question, custom: 1);
    await pack.insertQuestion(newQuestion);
    customQuestions.add(newQuestion);
    setState(() {});
  }

  @override
  void dispose() {
    questionCtl.dispose();
    super.dispose();
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
                  AppLocalizations.of(context)!.questionsPackBanner,
                  style: const TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFFCECC9),
                    minimumSize: const Size(263, 45)),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          scrollable: true,
                          title: Text(AppLocalizations.of(context)!.customBanner),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: questionCtl,
                                    decoration: InputDecoration(
                                      labelText: AppLocalizations.of(context)!.questionAddText,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: Text(AppLocalizations.of(context)!.playerAddBtn),
                                onPressed: () async {
                                  await _addQuestion(questionCtl.text);
                                  questionCtl.clear();
                                  setState(() {});
                                  Navigator.pop(context);
                                })
                          ],
                        );
                      });
                },
                child: Text(AppLocalizations.of(context)!.addQuestionBtn,
                    style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black)),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: customQuestions.length,
                      itemBuilder: (BuildContext ctxt, int index) {
                        return Center(
                            child: Text(customQuestions[index].toQuest(),
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)));
                      })),
            ],
          )),
    );
  }
}
