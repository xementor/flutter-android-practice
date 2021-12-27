import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/json/user.dart';

Future<String> readFromJsonToVar() async {
  final String response = await rootBundle.loadString('assets/db.json');
  return response;
}

class Json extends StatefulWidget {
  // String data = "jd";
  // late Map<String, dynamic> joson;
  Json({Key? key}) : super(key: key);

  // Json({Key? key}) : super(key: key) {
  //   data = "jl";
  //   joson = jsonDecode(data);
  // }

  @override
  State<Json> createState() => _JsonState();
}

class _JsonState extends State<Json> {
  String jsonString = '{"name": "abc", "email": "ej"}';
  var abc = readFromJsonToVar();
  @override
  Widget build(BuildContext context) {
    a() {
      () async {
        String jsonString = await readFromJsonToVar();
        Map<String, dynamic> userMap = jsonDecode(jsonString);
        User user = User.fromJson(userMap);
        setState(() {
          user = user;
        });
      };
    }

    var q = User('ih', 'hellow');

    return Scaffold(
      appBar: AppBar(
        title: Text("Json"),
      ),
      body: Column(
        children: [
          Text('hi'),
          Text("hiellja"),
        ],
      ),
    );
  }
}
