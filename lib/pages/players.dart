import 'package:flutter/material.dart';

class Players extends StatefulWidget {
  final String mode;
  const Players({super.key, required this.mode});

  @override
  State createState() => _State();
}

class _State extends State<Players> {
  final List<String> _players = [];
  final TextEditingController nameCtl = TextEditingController();

  void _addPlayer(String name) {
    _players.add(name);
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
                  itemCount: _players.length,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return Center(child: Text(_players[index],
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)));
                  })),
          TextButton(
            style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFCECC9),
                minimumSize: const Size(263, 45)),
            onPressed: () {},
            child: const Text('Complete',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black)),
          ),
          const SizedBox(height: 20,)
        ],
      )),
    );
  }
}
