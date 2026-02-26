import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:test_03/models/task_model.dart';

class DBHelper {
  static Future<Database> _openDB() async {
    return openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)',
        );
      },
      version: 1,
    );
  }
  
  static Future<int> insert(TaskItem task) async {
    final db = await _openDB();
    return db.insert('tasks', task.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  } 

  static Future<List<TaskItem>> getTasks() async {
    final db = await _openDB();
    final List<Map<String, dynamic>> maps = await db.query('tasks');
    return List.generate(maps.length, (i) => TaskItem.fromMap(maps[i]));
  }

  static Future<void> delete(int id) async {
    final db = await _openDB();
    await db.delete('tasks', where: 'id = ?', whereArgs: [id]);
  }

  static Future<void> update(TaskItem task) async {
    final db = await _openDB();
    await db.update('tasks', task.toMap(), where: 'id = ?', whereArgs: [task.id]);  
  }
}