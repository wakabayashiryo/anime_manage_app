import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart' as path;

void test() async {

  final databaseName = 'hoge.db';
  final databasePath = await sqflite.getDatabasesPath();

  final String sql =
      'CREATE TABLE name(id INTEGER PRIMARY KEY,first TEXT,last TEXT)';
  final String path2DB = path.join(databasePath, databaseName);

  // await sqflite.deleteDatabase(path2DB);

  sqflite.Database database = await sqflite.openDatabase(path2DB, version: 1,
      onCreate: (sqflite.Database db, int version) async {
    await db.execute(sql);
  });

  // final int res = await database.insert('name', name1);
  // print('result of insert:${res}');

  final List<Map<String,dynamic>> gotName = await database.query('name');
  print(gotName[0]);
  print(databasePath);
}

class ProgramInformation{
  String? title;
  int? totalEpisode;
  int? weekDays;
  List<bool>? progress;

  @override
  String toString() {
    return '{ ${this.title}, ${this.weekDays}, ${this.totalEpisode}, ${this.progress} }';
  }

  ProgramInformation({this.title,this.weekDays,this.totalEpisode,this.progress});
}

