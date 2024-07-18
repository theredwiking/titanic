import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';

class Question {
  final int id;
  final String question;

  const Question({required this.id, required this.question});
}

class Questions {
  late final Future<Database> database;
  Questions() {
    _init();
  }

  Future _init() async {
    copyDb();
    connectDb();
  }

  void copyDb() async {
    final directory = await getDatabasesPath();
    var file = File('$directory/questions_english.db');
    if (!file.existsSync()) {
      ByteData data = await rootBundle.load('assets/db/questions_english.db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes);
    }
  }

  void connectDb() async {
    database =
        openDatabase(join(await getDatabasesPath(), 'questions_english.db'));
  }

  void selectQuestions
}
