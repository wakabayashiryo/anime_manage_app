import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database.dart';

//TODO
// sqfliteの振る舞いを確認
// ProgramInformationと統合させる
//
void test() async {
  
  final databaseName = 'hoge.db';
  final databasePath = await getDatabasesPath();

  final String sql =
      'CREATE TABLE name(id INTEGER PRIMARY KEY,first TEXT,last TEXT)';
  final String path2DB = join(databasePath, databaseName);

  // await sqflite.deleteDatabase(path2DB);

  Database database = await openDatabase(path2DB, version: 1,
      onCreate: (Database db, int version) async {
    await db.execute(sql);
  });

  // final int res = await database.insert('name', name1);
  // print('result of insert:${res}');

  final List<Map<String, dynamic>> gotName = await database.query('name');
  print(gotName[0]);
  print(databasePath);

}

class DatabaseHelper {
  final String tableName = "titleData.db";
  int? version = 1;
  final String tableStructure = 
  """
  CREATE TABLE 
  titleData(
    id INTEGER PRIMARY KEY, 
    title TEXT, 
    totalEpisode INTEGER,
    weekDays INTEGER,
    progress TEXT,
    )
  """;

 // make this a singleton class
  DatabaseHelper._createInstance();
  static final DatabaseHelper helperInstance = DatabaseHelper._createInstance();

  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return database;
  }

  _initDatabase() async {
    Directory activeDirectory = await getApplicationDocumentsDirectory();
    String path = join(activeDirectory.path, tableName);
    return await openDatabase(path, version: version, onCreate: _onCreate);
  }

  List<bool>? fromBoolString2List(String? text) {
    List<bool> result = [];
    final String hoge = text!.substring(1, text.length - 1);
    final List<String> hoge2 = hoge.split(",");

    hoge2.forEach((element) {
      element == 'true' ? result.add(true) : result.add(false);
    });
    
    return result;
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE 
          ${this.tableName}
          (${this.tableStructure})
          ''');
  }

  Future<int?> insert(Map<String, dynamic> row) async {
    Database? db = await helperInstance.database;
    return await db!.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await helperInstance.database;
    return await db!.query(tableName);
  }

  Future<int?> queryRowCount() async {
    Database? db = await helperInstance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }
}
