import 'dart:io';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DB {
  late final Future<Database> database;

  void copyDb(String db) async {
    final directory = await getDatabasesPath();
    var file = File('$directory/$db');
    if (!file.existsSync()) {
      ByteData data = await rootBundle.load('assets/db/$db');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      await file.writeAsBytes(bytes);
    }
  }

  Future<Database> connectDb(String db) async {
    return openDatabase(join(await getDatabasesPath(), db));
  }
}
