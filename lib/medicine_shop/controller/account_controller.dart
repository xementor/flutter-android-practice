import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'account.dart';
import 'account_dbhelper.dart';
import 'medicine.dart';
import 'med_dbhelper.dart';

class AccountController with ChangeNotifier, DiagnosticableTreeMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Account> accounts = [];

  final dbHelper = AccDatabaseHelper.instance;
  // final int demo = 11;

  void insert(String name, DateTime date, double price, int quantity) async {
    int idx = 33;
    // row to insert
    Account acc = Account(
      id: idx,
      name: name,
      date: date,
      price: price,
      quantity: quantity,
      amount: price * quantity,
    );
    final id = await dbHelper.insert(acc);
    // _showMessageInScaffold('inserted row id: $id');

    // provider
    notifyListeners();
  }

  void queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    accounts.clear();
    allRows.forEach((row) => accounts.add(Account.fromMap(row)));
    // _showMessageInScaffold('Query done.');

    // provider
    notifyListeners();
  }

  void query(name) async {
    final allRows = await dbHelper.queryRows(name);
    // medicineByName.clear();
    // allRows.forEach((row) => medicineByName.add(Medicine.fromMap(row)));
    accounts.clear();
    allRows.forEach((row) => accounts.add(Account.fromMap(row)));
    notifyListeners();
  }

  void update(
      int id, String name, DateTime date, double price, int quantity) async {
    // row to update
    Account acc = Account(
      id: id,
      name: name,
      date: date,
      price: price,
      quantity: quantity,
      amount: price * quantity,
    );
    final rowsAffected = await dbHelper.update(acc);
    // _showMessageInScaffold('updated $rowsAffected row(s)');
    notifyListeners();
  }

  void _delete(int id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }

  void _showMessageInScaffold(String message) {
    // ignore: deprecated_member_use
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
