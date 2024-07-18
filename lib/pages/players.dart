import 'package:flutter/material.dart';
import 'package:titanic/pages/question.dart';

class PlayersPage extends StatefulWidget {
  final String mode;
  const PlayersPage({super.key, required this.mode});

  @override
  State createState() => _State(mode: mode);
}

class _State extends State<PlayersPage> {
  final String mode;
  final List<String> players = [];
  final TextEditingController nameCtl = TextEditingController();
  _State({required this.mode});

  void _addPlayer(String name) {
    players.add(name);
  }

  @override
  void dispose() {
    nameCtl.dispose();
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
              'Players',
              style: TextStyle(fontSize: 36, color: Color(0xFFFCB0B3)),
            ),
          ),
          const Text(
            'Max players: 10',
            style: TextStyle(fontSize: 24, color: Colors.white),
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
                      title: const Text('Player'),
                      content: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: nameCtl,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                  icon: Icon(Icons.account_box),
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
                              _addPlayer(nameCtl.text);
                              nameCtl.clear();
                              setState(() {});
                              Navigator.pop(context);
                            })
                      ],
                    );
                  });
            },
            child: const Text('Add player',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: players.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Center(
                        child: Text(players[index],
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)));
                  })),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 45)),
            onPressed: () {
              if (players.length >= 2) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            //TODO: Change harccode mode to dynamic
                            QuestionPage(mode: 'party', players: players)));
              }
            },
            child: const Text('Complete',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
