import 'package:flutter/material.dart';
import 'medicine.dart';
import 'dbhelper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IH Medicine Sheop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final dbHelper = DatabaseHelper.instance;

  List<Medicine> medicines = [];
  List<Medicine> medicineByName = [];

  //controllers used in insert operation UI
  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController storageController = TextEditingController();

  //controllers used in update operation UI
  TextEditingController idUpdateController = TextEditingController();
  TextEditingController nameUpdateController = TextEditingController();
  TextEditingController locationUpdateController = TextEditingController();
  TextEditingController priceUpdateController = TextEditingController();
  TextEditingController storageUpdateController = TextEditingController();

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  // Custom Widget
  Widget _storage(Medicine med) {
    int storage = med.storage;
    return Column(
      children: [
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
            Text(storage.toString()),
            TextButton(
              onPressed: () {
                setState(() {
                  storage++;
                });
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Sell'),
            ),
          ],
        ),
      ],
    );
  }

  Widget Update(Medicine med) => Scaffold(
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
      ));

  // storae state
  int storage = 0;

  @override
  Widget build(BuildContext context) {
    // widget manual
    _editWindow(Medicine med) {
      idUpdateController.text = med.id.toString();
      nameUpdateController.text = med.name;
      locationUpdateController.text = med.location;
      priceUpdateController.text = med.price.toString();
      storageUpdateController.text = med.storage.toString();
      //int storage = med.storage;
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (BuildContext context) {
        return Update(med);
      }));
    }

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Insert",
              ),
              Tab(
                text: "View",
              ),
              Tab(
                text: "Query",
              ),
              Tab(
                text: "Update",
              ),
              Tab(
                text: "Delete",
              ),
            ],
          ),
          title: Text('Medicine Shop'),
        ),
        body: TabBarView(
          children: [
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: locationController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Location',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: priceController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Price',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: storageController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Storage',
                      ),
                    ),
                  ),
                  ElevatedButton(
                    child: Text('Insert Medicine Details'),
                    onPressed: () {
                      // insert in db;
                      String name = nameController.text;
                      String location = locationController.text;
                      double price = double.parse(priceController.text);
                      int storage = int.parse(storageController.text);
                      _insert(name, location, price, storage);

                      nameController.clear;

                      // refresh
                      _refresh();
                    },
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(8),
                    itemCount: medicines.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      if (index == medicines.length) {
                        return ElevatedButton(
                          child: const Text('Refresh'),
                          onPressed: () {
                            // setState(() {
                            //   _queryAll();
                            // });
                            _refresh();
                          },
                        );
                      }
                      return ListTile(
                        title: Text(
                          medicines[index].name,
                          style: const TextStyle(fontSize: 18),
                        ),
                        subtitle: Text((medicines[index].price).toString()),
                        trailing: Text(medicines[index].storage.toString()),
                        onTap: () {
                          print('push another window calling');
                          _editWindow(medicines[index]);
                        },
                      );
                    },
                  ),
                ),
                TextField(
                  controller: queryController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Medicine Name',
                  ),
                  onChanged: (text) {
                    if (text.length >= 1) {
                      setState(() {
                        _query(text);
                      });
                    } else {
                      _refresh();
                      // setState(() {
                      //   medicines.clear();
                      // });
                    }
                  },
                ),
              ],
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: queryController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine Name',
                      ),
                      onChanged: (text) {
                        if (text.length >= 1) {
                          setState(() {
                            _query(text);
                          });
                        } else {
                          setState(() {
                            medicines.clear();
                          });
                        }
                      },
                    ),
                    height: 100,
                  ),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      padding: const EdgeInsets.all(8),
                      itemCount: medicineByName.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          height: 50,
                          margin: EdgeInsets.all(2),
                          child: ListTile(
                            title: Text(
                              /*[${medicineByName[index].id}]*/ ' ${medicineByName[index].name} ',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine id',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: nameUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine Name',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: locationUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'location',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: priceUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'price',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: storageUpdateController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Storage',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Update Medicine Details'),
                    onPressed: () {
                      int id = int.parse(idUpdateController.text);
                      String name = nameUpdateController.text;
                      String location = locationUpdateController.text;
                      double price = double.parse(priceUpdateController.text);
                      int storage = int.parse(storageUpdateController.text);
                      _update(id, name, location, price, storage);
                    },
                  ),
                ],
              ),
            ),
            Center(
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(20),
                    child: TextField(
                      controller: idDeleteController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Medicine id',
                      ),
                    ),
                  ),
                  RaisedButton(
                    child: Text('Delete'),
                    onPressed: () {
                      int id = int.parse(idDeleteController.text);
                      _delete(id);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _refresh() {
    setState(() {
      _queryAll();
    });
  }

  void _insert(name, location, price, storage) async {
    print(name);
    int idx = 33;
    // row to insert
    Map<String, dynamic> row = {
      DatabaseHelper.columnName: name,
      DatabaseHelper.columnLocation: location,
      DatabaseHelper.columnPrice: price,
      DatabaseHelper.columnStorage: storage,
    };

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
    setState(() {});
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
}
