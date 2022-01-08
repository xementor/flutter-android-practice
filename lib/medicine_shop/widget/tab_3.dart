import 'package:flutter/material.dart';

class Tab3 extends StatefulWidget {
  Tab3({Key? key}) : super(key: key);

  @override
  _Tab3State createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  //controllers used in query operation UI
  TextEditingController queryController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
