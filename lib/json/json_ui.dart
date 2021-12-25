import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:practice/json/json.dart';
import 'package:practice/json/user.dart';

Future<String> readFromJsonToVar(String x) async {
  final String response = await rootBundle.loadString('assets/db.json');
  return response;
}

class Json extends StatelessWidget {
  String data = "jd";
  late Map<String, dynamic> joson;

  Json({Key? key}) : super(key: key) {
    data = "jl";
    joson = jsonDecode(data);
  }

  @override
  Widget build(BuildContext context) {
    var user = User.fromJson(userMap);
    return Container(
      child: Text(joson['name']),
    );
  }
}
