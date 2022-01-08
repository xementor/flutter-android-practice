import 'package:flutter/material.dart';

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
