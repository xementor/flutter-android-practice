import 'dart:developer';

import 'package:flutter/material.dart';
import '../controller/controller.dart';
import 'package:provider/provider.dart';
import '../main.dart';

class Tab1 extends StatelessWidget {
  Tab1({Key? key}) : super(key: key);

  TextEditingController nameController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController storageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                // labelText: 'Medicine Name',
                labelText: '${context.watch<Counter>().count}',
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
              // Controller._insert(name, location, price, storage);

              nameController.clear;

              // refresh
              // _refresh();
            },
          ),
        ],
      ),
    );
  }
}
