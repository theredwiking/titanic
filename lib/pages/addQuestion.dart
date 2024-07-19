import 'package:flutter/material.dart';
import 'package:titanic/pages/question.dart';

class AddQuestionPage extends StatefulWidget {
  final String mode;
  const AddQuestionPage({super.key, required this.mode});

  @override
  State createState() => _State(mode: mode);
}

class _State extends State<AddQuestionPage> {
  final String mode;
  final List<String> customQuestions = [];
  final TextEditingController questionCtl = TextEditingController();
  _State({required this.mode});

  void _addPlayer(String question) {
    customQuestions.add(question);
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
                                onPressed: () {
                                  _addPlayer(questionCtl.text);
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
                            child: Text(customQuestions[index],
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
