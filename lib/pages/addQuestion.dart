import 'dart:async';

import 'package:flutter/material.dart';
import 'package:titanic/db/questions.dart';

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
              const Align(
                alignment: Alignment.topCenter,
                child: Text(
                  'Custom questions',
                  style: TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
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
                          title: const Text('Custom'),
                          content: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Form(
                              child: Column(
                                children: <Widget>[
                                  TextFormField(
                                    controller: questionCtl,
                                    decoration: const InputDecoration(
                                      labelText: 'Question',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            ElevatedButton(
                                child: const Text("Add"),
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
                child: const Text('Add question',
                    style: TextStyle(
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
