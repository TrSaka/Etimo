// ignore_for_file: unused_field

import 'package:etimology/models/dictionary_word_model.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class SQLSerivce {
  static const String _dbName = "Database.db";
  static const int version = 1;

  static Future<Database> _getDB() async {
    return openDatabase(
      join(await getDatabasesPath(), _dbName),
      onCreate: (db, version) async => await db.execute(
          "CREATE TABLE Database(id INTEGER PRIMARY KEY, kelime TEXT NOT NULL, ek TEXT NOT NULL, kok TEXT NOT NULL, tur TEXT NOT NULL, fav INTEGER NOT NULL);"),
      version: version,
    );
  }

  static Future<int?> saveWord(DictionaryModel model) async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db
        .query("Database", where: 'kelime = ?', whereArgs: [model.kelime]);

    if (maps.isNotEmpty) {
      debugPrint("already have this word");
      return null;
    } else {
      return await db.insert("Database", model.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    }
  }

  static Future<int> deleteNote(DictionaryModel model) async {
    final db = await _getDB();
    return await db
        .delete("Database", where: 'kelime = ?', whereArgs: [model.kelime]);
  }

  static Future<List<DictionaryModel>?> getAllWords() async {
    final db = await _getDB();
    final List<Map<String, dynamic>> maps = await db.query("Database");

    if (maps.isNotEmpty) {
      return List.generate(
          maps.length, (index) => DictionaryModel.fromMap(maps[index]));
    } else {
      return null;
    }
  }

  static Future getByName(DictionaryModel model) async {
    final db = await _getDB();

    final List<Map<String, dynamic>> maps = await db
        .query("Database", where: 'kelime = ?', whereArgs: [model.kelime]);

    if (maps.isNotEmpty) {
      return maps;
    } else {
      return null;
    }
  }
}
