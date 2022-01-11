import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/controller/medicine.dart';

Widget _storage(Medicine med) {
  int storage = med.storage;
  TextEditingController storageUpdateController = TextEditingController();
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
            onPressed: () {},
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
