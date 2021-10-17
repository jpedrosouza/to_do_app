import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseConfig {
  /// Open database, and create database file.

  Future<Database> getDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'to_do_app_database.db'),
      onCreate: (db, version) async {
        await createTable(db);
      },
      onOpen: (db) {},
      onUpgrade: (db, oldVersion, newVersion) async {},
      onDowngrade: (db, oldVserion, newVersion) async {},
      version: 1,
    );
  }

  /// Create table in database if not exists.

  Future createTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS tasks (id INTEGER PRIMARY KEY, task_name '
        'TEXT NOT NULL, completed INTEGER NOT NULL, group_id INTEGER);');

    await db.execute('CREATE TABLE IF NOT EXISTS task_groups ('
        'id INTEGER PRIMARY KEY, name TEXT NOT NULL);');
  }
}
