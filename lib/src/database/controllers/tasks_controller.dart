import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/src/database/database_config.dart';
import 'package:to_do_app/src/models/task_model.dart';

class TaskController {
  DatabaseConfig databaseConfig = DatabaseConfig();

  /// Get all tasks from database.

  Future<List<Task>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query('tasks', orderBy: 'id ASC');

    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        taskName: maps[index]['task_name'],
        completed: false,
        groupId: maps[index]['group_id'],
      );
    });
  }

  /// Get all tasks by group (ex: work tasks).

  Future<List<Task>> getTasksByGroupId(int groupId) async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query('tasks', where: 'group_id = ?', whereArgs: [groupId]);

    return List.generate(maps.length, (index) {
      return Task(
        id: maps[index]['id'],
        taskName: maps[index]['task_name'],
        completed: false,
        groupId: maps[index]['group_id'],
      );
    });
  }

  /// Insert task in database (tasks table).

  Future<bool> store(Task task) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('tasks', task.toMap());

      success = true;
    } catch (err) {
      success = false;
    }

    return success;
  }

  /// Delete task from database.

  Future delete(int taskId) async {
    Database db = await databaseConfig.getDatabase();

    await db.delete('tasks', where: 'id = ?', whereArgs: [taskId]);
  }
}
