import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'database.dart';

class DatabaseHelper {
  final String tableName = "titleData";
  int? version = 1;
  final String tableStructure = 'id INTEGER PRIMARY KEY, title TEXT, totalEpisode INTEGER, weekDays INTEGER, progress TEXT';

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
    String path = join(activeDirectory.path, tableName + ".db");
    return await openDatabase(path, version: version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('CREATE TABLE $tableName ($tableStructure)');
  }

  Future<int?> insert(ProgramInformation info) async {
    Database? db = await this.database;
    return await db!.insert(tableName, info.toMap());
  }

  Future<int?> update(ProgramInformation info) async {
    Database? db = await this.database;
    return await db!.update(tableName, info.toMap(),where: 'id = ?',whereArgs: [info.id]);
  }

  Future<int?> delete(int id) async {
    Database? db = await this.database;
    return await db!.delete(tableName, where: 'id = ?',whereArgs: [id]);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database? db = await this.database;
    return await db!.query(tableName);
  }

  //get ths 'Map List' [List<Map>] and convert it to 'ProgramInformation List' [List<ProgramInformation>]
  Future<List<ProgramInformation>> getDBlist() async {
    var mapList = await queryAllRows();
    int listCount = mapList.length;
    List<ProgramInformation> infoList = [];

    for (int index = 0; index < listCount; listCount++)
      infoList.add(ProgramInformation.fromMapObject(mapList[index]));

    return infoList;
  }

  Future<int?> queryRowCount() async {
    Database? db = await helperInstance.database;
    return Sqflite.firstIntValue(
        await db!.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }
}

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
