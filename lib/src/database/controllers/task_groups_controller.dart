import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/src/database/database_config.dart';
import 'package:to_do_app/src/models/task_groups_model.dart';

class TaskGroupsController {
  DatabaseConfig databaseConfig = DatabaseConfig();

  /// Get all task groups from database.

  Future<List<TaskGroup>> index() async {
    Database db = await databaseConfig.getDatabase();
    List<Map<String, dynamic>> maps =
        await db.query('task_groups', orderBy: 'id ASC');

    return List.generate(maps.length, (index) {
      return TaskGroup(
        maps[index]['id'],
        maps[index]['name'],
      );
    });
  }

  /// Insert task group in database (task_groups table).

  Future<bool> store(TaskGroup taskGroup) async {
    Database db = await databaseConfig.getDatabase();
    bool success = false;

    try {
      await db.insert('task_groups', taskGroup.toMap());

      success = true;
    } catch (err) {
      success = false;
    }

    return success;
  }

  /// Delete task group from database.

  Future delete(int taskGroupId) async {
    Database db = await databaseConfig.getDatabase();

    await db.delete('task_groups', where: 'id = ?', whereArgs: [taskGroupId]);
  }
}
