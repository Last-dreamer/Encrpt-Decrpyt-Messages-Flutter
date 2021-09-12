import 'dart:io';
import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
  static final _databasename = "enc.db";
  static final _databaseversion = 1;

  // the table name
  static final table = "my_table";

  // column names
  static final columnID = 'id';
  static final userName = "username";
  static final privateKey = "privateKey";
  static final publicKey = "publicKey";
  static final xdate = "xdate";
  static final passphrase = "passphrase";

  // a database
  static Database? _database;

  // privateconstructor
  Databasehelper._privateConstructor();
  static final Databasehelper instance = Databasehelper._privateConstructor();

  // asking for a database
  Future<Database> get databse async {
    if (_database != null) return _database!;

    // create a database if one doesn't exist
    _database = await _initDatabase();
    return _database!;
  }

  // function to return a database
  _initDatabase() async {
    Directory documentdirecoty = await getApplicationDocumentsDirectory();
    String path = join(documentdirecoty.path, _databasename);
    return await openDatabase(path,
        version: _databaseversion, onCreate: _onCreate);
  }

  // create a database since it doesn't exist
  Future _onCreate(Database db, int version) async {
    // sql code
    await db.execute('''
      CREATE TABLE $table (
        $columnID INTEGER PRIMARY KEY,
        $userName TEXT NOT NULL,
        $publicKey TEXT NOT NULL,
        $privateKey TEXT NOT NULL,
        $xdate TEXT,
        $passphrase TEXT NOT NULL
      );
      ''');
  }

  // functions to insert data
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.databse;
    return await db.insert(table, row);
  }

  // function to query all the rows
  Future<List<Map<String, dynamic>>> queryall() async {
    Database db = await instance.databse;
    return await db.query(table);
  }

  //
  Future getPubKey(String username) async {
    Database db = await instance.databse;
      var result =  await db.rawQuery("SELECT $publicKey  FROM $table where $userName = '$username';");
    // return await db.query(table, where: '$userName = ? ', whereArgs: [username]);

    return  result;
  }


  // function to delete some data
  Future<int> deletedata(int id) async {
    Database db = await instance.databse;
    var res = await db.delete(table, where: "id = ?", whereArgs: [id]);
    return res;
  }
}