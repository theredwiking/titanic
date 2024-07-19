import 'package:titanic/db/database.dart';
import 'package:sqflite/sqflite.dart';

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
  Questions({required this.pack}) {
    database = DB().connectDb('questions_english.db');
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
}