import 'dart:io';
import 'package:flutter_application_puskesmas2/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper? _dbHelper;
  static Database? _database;

  DbHelper._createObject();
  factory DbHelper() {
    if (_dbHelper == null) _dbHelper = DbHelper._createObject();
    return _dbHelper!;
  }

  //method untuk mengecek apakah DB sudah ada? kalau belum create DB, selanjutnya dia return objek database
  Future<Database> getDatabase() async {
    //await initDb();
    if (_database == null) _database = await initDb();
    return _database!;
  }

  //method untuk membuat database dan return objek database yang telah dibuat
  Future<Database> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'notes.db'; //path database
    //perintah untuk hapus database: await deleteDatabase(path);
    // Delete the database
    //await deleteDatabase(path);

    //method openDatabase akan create sebuah database dan menyimpannya pada path
    var notesDatabase = openDatabase(path, version: 1, onCreate: _createDb);
    return notesDatabase;
  }

  //method call back _createDb
  void _createDb(Database db, int version) async {
    await db.execute(
        "CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT,username TEXT NOT NULL UNIQUE,password TEXT NOT NULL,email TEXT NOT NULL UNIQUE)");
  }

  Future<int> insertUser(User object) async {
    Database db = await this.getDatabase();
    int count = 0;
    try {
      count = await db.insert('users', object.toMap());
    } catch (e) {}
    return count;
  }

  //Read
  Future<List<Map<String, dynamic>>> selectAllUser() async {
    Database db = await this.getDatabase();
    var mapList = await db.query('users');
    return mapList;
  }

  //Read
  Future<List<Map<String, dynamic>>> selectUser(
      String username, String password) async {
    Database db = await this.getDatabase();
    var mapList = await db.query('users',
        where: "username='$username' AND password='$password'");
    return mapList;
  }

  Future<int> deleteAllUsers() async {
    Database db = await this.getDatabase();
    int count = await db.delete('users');
    return count;
  }
}
