import 'package:titanic/db/database.dart';
import 'package:sqflite/sqflite.dart';

class Question {
  final int id;
  final String question;

  const Question({required this.id, required this.question});

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'question': question,
    };
  }

  @override
  String toString() {
    return 'Question{id: $id, question: $question}';
  }
}

class Questions {
  final String pack;
  late final Future<Database> database;
  Questions({required this.pack}) {
    database = DB().connectDb(pack);
  }

  Future<void> insertQuestion(Question question, String pack) async {
    final db = await database;
    await db.insert(pack, question.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Question>> allQuestions() async {
    final db = await database;

    final List<Map<String, Object?>> questionMaps = await db.query(pack);

    return [
      for (final {
            'id': id as int,
            'question': question as String,
          } in questionMaps)
        Question(id: id, question: question),
    ];
  }
}