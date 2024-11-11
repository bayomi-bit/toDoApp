import 'package:sqflite/sqflite.dart';
class DatabaseHelper {
  Database? _database;
  static const tableName = "notes";
  static const tableUsers = "users";

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
          await db.execute('CREATE TABLE $tableUsers (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');

          await db.execute(
          'CREATE TABLE notes (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, desc TEXT, user_id INTEGER)'

              'FOREIGN KEY (user_id) REFERENCES $tableUsers )',
          );

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
  Future getNotesByUserId(int userId) async {
    Database db = await database;
    return await db.query(tableName, where: 'user_id = ?', whereArgs: [userId]);
  }

Future<int> insertUser(Map<String, dynamic> user) async {
    Database db = await database;
    return db.insert(tableUsers, user);
  }

  Future getIdByUserName(String userName) async {
    Database db = await database;
    return await db.query(tableUsers, where: 'name = ?', whereArgs: [userName]);
  }


}
