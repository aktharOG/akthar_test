// ignore_for_file: avoid_print

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflitenew/model/todo_model.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    // If _database is null, initialize it
    _database = await initDatabase();
    return _database!;
  }

  Future<Database> initDatabase() async {
    print("sqflite initialized");
    String path = join(await getDatabasesPath(), 'todo_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE todo(id INTEGER PRIMARY KEY AUTOINCREMENT, title VARCHAR(30), task VARCHAR(30))",
        );
      },
    );
  }

  Future<void> insertTodo(TodoModel todoModel) async {
    final db = await database;
    await db.insert(
      'todo',
      todoModel.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    print("success");
  }

  Future<TodoModel?> getTodo(int id) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return TodoModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<TodoModel>> getAllTodos() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'todo',
    );
    if (maps.isNotEmpty) {
      return maps
          .map(
            (e) => TodoModel.fromMap(e),
          )
          .toList();
    } else {
      return [];
    }
  }

  Future<void> clearTodos() async {
    final db = await database;
    await db.delete('todo_database.db');
    print("All items cleared");
  }


  

  Future<void> deleteTodoById(int id) async {
    final db = await database;
    await db.delete(
      'todo',
      where: 'id = ?',
      whereArgs: [id],
    );
    print("All items cleared");
  }
}
