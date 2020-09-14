import "dart:io";

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DbHelper{
  static final _dbName = 'Todolist.db';
  static final _dbVersion = 1;

  static final table = 'contato';
  static final columId = 'id';
  static final columNome ='nome';
  static final columDescricao = 'descricao';

  DbHelper._privateConstructor();
  static final DbHelper instance = DbHelper._privateConstructor();

  static Database _database;

  Future<Database> get database async{
    if(_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, _dbName);
    return await openDatabase(path,
      version: _dbVersion,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async{
    await db.execute(
      'CREATE TABLE $table('
          '$columId INTEGER PRIMARY KEY,'
          '$columNome TEXT NOT NULL,'
          '$columDescricao TEXT NOT NULL)'
    );
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  Future<int> queryRowCount() async {
    Database db = await instance.database;
    return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
  }

  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }


}