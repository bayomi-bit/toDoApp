import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  Database? _database;
  static const tableName = "notes";

  Future get database async {
    if (_database != null) {
      return _database;
    }
    return _database = await initDatabase();
  }

  Future<Database> initDatabase() async {
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/notes.db';

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      print("creating database table notes");
      await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT)');

      print("database created successfully");
    });
  }

  Future<int> insertNote(Map<String, dynamic> note) async {
    Database db = await database;
    return db.insert(tableName, note);
  }

  Future getAllNote() async {
    Database db = await database;
    return await db.query(tableName);
  }

  Future<int> deleteNote(int id) async {
    Database db = await database;
    return await db.delete(tableName, where: 'id = ?', whereArgs: [id]);
  }
}
