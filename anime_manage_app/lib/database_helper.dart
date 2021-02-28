import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  String tableName;
  int version = 1;
  String tableStructure;

  DatabaseHelper._createInstance(
      {@required this.tableName, this.version, @required this.tableStructure});

  static final DatabaseHelper helperInstance = DatabaseHelper._createInstance();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();

    return database;
  }

  _initDatabase() async {
    Directory activeDirectory = await getApplicationDocumentsDirectory();
    String path = join(activeDirectory.path, tableName);
    return await openDatabase(path, version: version, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE 
          ${this.tableName}
          (${this.tableStructure})
          ''');
  }

  Future <int> insert(Map<String, dynamic> row) async {
    Database db = await helperInstance.database;
    return await db.insert(tableName, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await helperInstance.database;
    return await db.query(tableName);
  }

  Future<int> queryRowCount() async {
    Database db = await helperInstance.database;
    return Sqflite.firstIntValue(
        await db.rawQuery('SELECT COUNT(*) FROM $tableName'));
  }

  
}
