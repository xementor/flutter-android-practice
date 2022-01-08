import 'package:flutter/material.dart';

class Tab4 extends StatefulWidget {
  Tab4({Key? key}) : super(key: key);

  @override
  _Tab4State createState() => _Tab4State();
}

class _Tab4State extends State<Tab4> {
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
