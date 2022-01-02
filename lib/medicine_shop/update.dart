import 'package:flutter/material.dart';
import 'dbhelper.dart';

import 'medicine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IH Medicine Sheop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Update(),
    );
  }
}

class Update extends StatefulWidget {
  Update({Key? key}) : super(key: key);

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final dbHelper = DatabaseHelper.instance;
  List<Medicine> medicines = [];
  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController locationUpdateController = TextEditingController();
  TextEditingController priceUpdateController = TextEditingController();
  TextEditingController storageUpdateController = TextEditingController();
  int storage = 0;

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Update(medicines[1]);
  }

  Widget Update(Medicine med) {
    idUpdateController.text = med.id.toString();
    nameUpdateController.text = med.name;
    locationUpdateController.text = med.location;
    priceUpdateController.text = med.price.toString();
    storageUpdateController.text = med.storage.toString();

    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Manage'),
        ),
        body: Column(
          children: <Widget>[
            // _storage(med),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: storageUpdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Storage',
                ),
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      storage++;
                    });
                  },
                  child: Text('Add'),
                ),
                Text(storage.toString()),
                TextButton(
                  onPressed: () {},
                  child: Text('Sell'),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: idUpdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: const Text('Medicine id'),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: nameUpdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Medicine Name',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: locationUpdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'location',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: priceUpdateController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'price',
                ),
              ),
            ),
            // RaisedButton(
            //   child: Text('Update Medicine Details'),
            //   onPressed: () {
            //     int id = int.parse(idUpdateController.text);
            //     String name = nameUpdateController.text;
            //     String location = locationUpdateController.text;
            //     double price = double.parse(priceUpdateController.text);
            //     int storage = int.parse(storageUpdateController.text);
            //     _update(id, name, location, price, storage);
            //   },
            // ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('Update'),
          onPressed: () {
            // updating from db
            int id = int.parse(idUpdateController.text);
            String name = nameUpdateController.text;
            String location = locationUpdateController.text;
            double price = double.parse(priceUpdateController.text);
            int storage = int.parse(storageUpdateController.text);
            _update(id, name, location, price, storage);

            // going back
            Navigator.of(context).pop();

            // set state
            _refresh();
          },
        ),
      ),
    );
  }

  void _update(id, name, location, price, storage) async {
    // row to update
    Medicine med = Medicine(
        id: id, name: name, location: location, price: price, storage: storage);
    final rowsAffected = await dbHelper.update(med);
    _showMessageInScaffold('updated $rowsAffected row(s)');
  }

  void _refresh() {
    setState(() {
      _queryAll();
    });
  }

  void _queryAll() async {
    final allRows = await dbHelper.queryAllRows();
    medicines.clear();
    allRows.forEach((row) => medicines.add(Medicine.fromMap(row)));
    _showMessageInScaffold('Query done.');
    setState(() {});
  }

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  // storae state
}
