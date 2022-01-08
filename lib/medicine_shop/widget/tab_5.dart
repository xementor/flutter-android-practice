import 'package:flutter/material.dart';

class Tab5 extends StatelessWidget {
  Tab5({Key? key}) : super(key: key);

  //controllers used in delete operation UI
  TextEditingController idDeleteController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
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
          Text(storage.toString()),
          TextButton(
            onPressed: () {
              setState(() {
                storage++;
              });
            },
            child: Text('+'),
          ),
        ],
      ),
    );
  }
}
