import 'dart:ffi';

import 'package:titanic/db/database.dart';
import 'package:sqflite/sqflite.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Question {
  final String question;
  final int custom;

  const Question({required this.question, required this.custom});

  Map<String, Object?> toMap() {
    return {
      'question': question,
      'custom': custom
    };
  }

  @override
  String toString() {
    return 'Question{question: $question, custom: $custom}';
  }

  String toQuest() {
    return question;
  }
}

class Questions {
  final String pack;
  late final Future<Database> database;
  late final SharedPreferences prefs;
  Questions({required this.pack});

  Future init() async {
    prefs = await SharedPreferences.getInstance();
    String? dbName = 'questions_${prefs.getString('language')}.db';
    dbName ??= '';
    database = DB().connectDb(dbName);
  }

  Future<void> insertQuestion(Question question) async {
    final db = await database;
    await db.insert(pack, question.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Question>> packQuestions() async {
    final db = await database;

    final List<Map<String, Object?>> questionMaps = await db.query(pack);

    return [
      for (final {
            'question': question as String,
            'custom': custom as int,
          } in questionMaps)
        Question(question: question, custom: custom),
    ];
  }

  Future<List<Question>> customQuestions() async {
    final db = await database;

    final List<Map<String, Object?>> questionMaps = await db.query(pack, where: 'custom = 1');

    return [
      for (final {
      'question': question as String,
      'custom': custom as int,
      } in questionMaps)
        Question(question: question, custom: custom),
    ];
  }
}