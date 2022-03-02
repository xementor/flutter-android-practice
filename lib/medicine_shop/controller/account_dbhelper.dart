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

  // this opens the database (and creates it if it doesn't exist)
  // _initDatabase() async {
  //   String path = join(await getDatabasesPath(), _databaseName);
  //   return await openDatabase(path,
  //       version: _databaseVersion, onCreate: _onCreate);
  // }
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

  // Inserts a row in the database where each key in the Map is a column name
  // and the value is the column value. The return value is the id of the
  // inserted row.
  Future<int> insert(Account acc) async {
    Database db = await instance.database;
    return await db.insert(table, acc.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    // await db.insert(table, {'name': car.name, 'miles': car.miles});
  }

  // All of the rows are returned as a list of maps, where each map is
  // a key-value list of columns.
  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    return await db.query(table);
  }

  // Queries rows based on the argument received
  Future<List<Map<String, dynamic>>> queryRows(name) async {
    Database db = await instance.database;
    return await db.query(table, where: "$columnName LIKE '%$name%'");
  }

  Future<List<Map<String, dynamic>>> querybyToday() async {
    // var sdate = date.compareTo(DateTime.april);
    Database db = await instance.database;

    // return await db.query(
    //   table,
    //   where: "date > ?",
    //   whereArgs: [DateTime(2022, 2, 28).toString()],
    // );
    return await db.rawQuery(
        "SELECT * FROM   $table WHERE  date BETWEEN JulianDay('now') AND JulianDay('now','+1 day','-0.001 second')");
    // "select * from $table");
  }

  // All of the methods (insert, query, update, delete) can also be done using
  // raw SQL commands. This method uses a raw query to give the row count.
  Future<int?> queryRowCount() async {
    Database db = await instance.database;
    var result =
        Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $table'));
    return result;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Account acc) async {
    Database db = await instance.database;
    int? id = acc.id;
    return await db
        .update(table, acc.toMap(), where: '$columnId = ?', whereArgs: [id]);
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
  }
}
