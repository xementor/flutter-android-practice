import 'package:flutter/material.dart';
import 'medicine.dart';
import 'dbhelper.dart';

class Controller {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<Medicine> medicines = [];

  final dbHelper = DatabaseHelper.instance;

  void _insert(name, location, price, storage) async {
    int idx = 33;
    // row to insert
    Medicine car = Medicine(
      id: idx,
      name: name,
      location: location,
      price: price,
      storage: storage,
    );
    final id = await dbHelper.insert(car);
    _showMessageInScaffold('inserted row id: $id');
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    medicines.clear();
    allRows.forEach((row) => medicines.add(Medicine.fromMap(row)));
    _showMessageInScaffold('Query done.');
  }

  void _query(name) async {
    final allRows = await dbHelper.queryRows(name);
    // medicineByName.clear();
    // allRows.forEach((row) => medicineByName.add(Medicine.fromMap(row)));
    medicines.clear();
    allRows.forEach((row) => medicines.add(Medicine.fromMap(row)));
  }

  void _update(id, name, location, price, storage) async {
    // row to update
    Medicine med = Medicine(
        id: id, name: name, location: location, price: price, storage: storage);
    final rowsAffected = await dbHelper.update(med);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _delete(id) async {
    // Assuming that the number of rows is the id for the last row.
    final rowsDeleted = await dbHelper.delete(id);
    _showMessageInScaffold('deleted $rowsDeleted row(s): row $id');
  }

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
