import 'dart:convert';

import 'package:flutter/services.dart';

class User {
  final String name;
  final String email;

  User(this.name, this.email);

  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

Future<String> readFromJsonToVar() async {
  final String response = await rootBundle.loadString('assets/db.json');
  return response;
}

// String jsonString = '{"name": "ih", "email": "ih.zonaid@gmail.com"}';

// String jsonString =  readFromJsonToVar();
// Map<String, dynamic> userMap = jsonDecode( readFromJsonToVar());
