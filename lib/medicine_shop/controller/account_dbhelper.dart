import 'package:practice/medicine_shop/controller/account.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/widgets.dart';
import 'medicine.dart';
import 'package:path/path.dart';
import 'dart:async';

class AccDatabaseHelper {
  static const _databaseName = "account.db";
  static const table = 'sell_table';
  static const columnId = 'id';
  static const columnName = 'name';
  static const columnDate = 'date';
  static const columnPrice = 'price';
  static const columnCount = 'quantity';
  static const columnAmount = 'amount';

  // make this a singleton class
  AccDatabaseHelper._privateConstructor();
  static final AccDatabaseHelper instance =
      AccDatabaseHelper._privateConstructor();

  // only have a single app-wide reference to the database
  Future<Database> _initDatabase() async {
    final database = openDatabase(
      join(await getDatabasesPath(), _databaseName),
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE $table(
            $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
            $columnName TEXT NOT NULL,
            $columnDate TEXT NOT NULL,
            $columnPrice REAL  NOT NULL,
            $columnCount INT NOT NULL,
            $columnAmount REAL NOT NULL
            )
          ''');
      },
      version: 1,
    );
    return database;
  }

  Future<Database> get database async {
    // lazily instantiate the db the first time it is accessed
    Future<Database> _database = _initDatabase();
    return _database;
  }

  // // SQL code to create the database table
  // Future _onCreate(Database db, int version) async {
  //   await db.execute('''
  //         CREATE TABLE $table (
  //           $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
  //           $columnName TEXT NOT NULL,
  //           $columnMiles INTEGER NOT NULL
  //         )
  //         ''');
  // }

  // Helper methods

  Future<int> insert(Account acc) async {
    Database db = await instance.database;
    return await db.insert(table, acc.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    // await db.insert(table, {'name': car.name, 'miles': car.miles});
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(
      table,
      where: "date like '2022-03-%'",
      // whereArgs: [DateTime.now().year, DateTime.now().month],
    );
  }

  Future<List<Map<String, dynamic>>> queryRows(DateTime date) async {
    Database db = await instance.database;
    return await db.query(
      table,
      where: "$columnDate LIKE '${date.year}-${date.month}-${date.day} %'",
    );
  }

  Future<List<Map<String, dynamic>>> querybyToday() async {
    Database db = await instance.database;
    return await db.rawQuery(
        "SELECT * FROM   $table WHERE  date BETWEEN JulianDay('now') AND JulianDay('now','+1 day','-0.001 second')");
  }

  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    var result =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
    return result;
  }

  Future<int> update(Account acc) async {
    Database db = await instance.database;
    int? id = acc.id;
    return await db
        .update(table, acc.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
