import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/users.dart';

class UsersDatabase {
  static final UsersDatabase instatnce =
      UsersDatabase._init(); //calling the constractor

//creating fields
  static Database? _database;

  UsersDatabase._init(); //private constractor

  //openin connection with database

  Future<Database> get database async {
    if (_database != null)
      //return db incase it already exist
      _database = await _initDB('users.db');
    return _database!;
  }

  //inializing db
  Future<Database> _initDB(String filepath) async {
    final dbPath = await getDatabasesPath(); //specifying where db is stored
    final path = join(dbPath, filepath);

    return await openDatabase(path,
        version: 1, onCreate: _createDB); //opening database
  }

  Future _createDB(Database db, int version) async {
    final idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    final textType = 'TEXT NOT NULL';
    final boolType = 'BOOLEAN NOT NULL';
    final integerType = 'INTEGER NOT NULL';
    //defining schema
    await db.execute('''
    CREATE TABLE $tableUsers(
      ${UsersFields.id} $idType, 
      ${UsersFields.number} $integerType,
      ${UsersFields.name} $textType,
      ${UsersFields.time} $textType
          

    )
    ''');
  }

  Future close() async {
    var instance;
    final db = await instance.database;
    db.close();
  } //closing db
}
