import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_03/models/task_model.dart';

class DBHelper {
  static const String _key = 'tasks_list';

  // Instancia cacheada — se inicializa una sola vez
  static SharedPreferences? _prefs;

  static Future<SharedPreferences> _getPrefs() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  // Lista en memoria como fuente de verdad (cache local)
  static List<TaskItem>? _cache;

  static Future<List<TaskItem>> getTasks() async {
    if (_cache != null) return List.from(_cache!);
    final prefs = await _getPrefs();
    final String? data = prefs.getString(_key);
    if (data == null) {
      _cache = [];
      return [];
    }
    final List<dynamic> jsonList = jsonDecode(data);
    _cache = jsonList
        .map((e) => TaskItem.fromMap(Map<String, dynamic>.from(e)))
        .toList();
    return List.from(_cache!);
  }

  static Future<void> _persist() async {
    final prefs = await _getPrefs();
    final String data = jsonEncode(_cache!.map((t) => t.toMap()).toList());
    await prefs.setString(_key, data);
  }

  static Future<void> insert(TaskItem task) async {
    await getTasks(); // asegura que _cache esté inicializado
    _cache!.add(task);
    _persist(); // no awaited — en background
  }

  static Future<void> delete(int id) async {
    await getTasks();
    _cache!.removeWhere((t) => t.id == id);
    _persist();
  }

  static Future<void> update(TaskItem task) async {
    await getTasks();
    final index = _cache!.indexWhere((t) => t.id == task.id);
    if (index != -1) {
      _cache![index] = task;
      _persist();
    }
  }
}