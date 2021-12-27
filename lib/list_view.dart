// ignore: file_names
import 'package:flutter/material.dart';
import 'package:practice/data_storage_ex.dart';
import 'package:practice/first_route.dart';
import 'package:practice/flexible.dart';
import 'package:practice/main.dart';
import 'package:practice/simple_list.dart';

import 'json/json_ui.dart';
import 'json/user.dart';
import 'traversy_app.dart';

class FrontPage extends StatefulWidget {
  const FrontPage({Key? key}) : super(key: key);

  @override
  State<FrontPage> createState() => _FrontPageState();
}

class _FrontPageState extends State<FrontPage> {
  final List<String> medicines = <String>["-----No data here----------"];

  TextEditingController myController = TextEditingController();

  Widget _buildPopup(BuildContext context) {
    return AlertDialog(
      title: Text('I am title'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("hi"),
          const Text("Hi2"),
        ],
      ),
      actions: [
        const Text('hi'),
        const Text('ok'),
        FlatButton(
          onPressed: () => {Navigator.of(context).pop()},
          child: const Text('close'),
        )
      ],
    );
  }

  void _addItemToList() {
    setState(() {
      if (myController.text.length > 3) {
        medicines.insert(0, myController.text);
        myController.text = "";
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => _buildPopup(context),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Medicine Store"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: myController,
          ),
        ),
        ElevatedButton(
          child: const Text("Add"),
          onPressed: () => _addItemToList(),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: medicines.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.all(5),
                  color: Colors.blue[100],
                  child: Text(medicines[index]),
                  alignment: Alignment.center,
                  height: 100,
                );
              }),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FirstRoute(),
            ),
          )
        },
        child: const Text("New W"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text("First Route"),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstRoute()))
              },
            ),
            ListTile(
              title: const Text("Second Route"),
              onLongPress: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()))
              },
            ),
            ListTile(
              title: const Text("My home Page"),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(
                            // title: "Counter",
                            // storage: DataStorage(),
                            )))
              },
            ),
            ListTile(
              title: const Text("My Introduction Screen"),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyIntroductionPage()))
              },
            ),
            ListTile(
              title: const Text("Flexible Screen"),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyFlex()))
              },
            ),
            ListTile(
              title: const Text("Traversy crash courh copoy"),
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TraversyApp()))
              },
            ),
            ListTile(
              title: const Text("Simple list"),
              onTap: () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            SimpleList(storage: DataStorage())))
              },
            ),
            ListTile(
              title: const Text("Json data"),
              onTap: () => {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Json()))
              },
            ),
          ],
        ),
      ),
    );
  }

  addItemToList() {}
}
