import 'dart:convert';

import 'package:flutter/services.dart';

Future<void> readJson() async {
  final String response = await rootBundle.loadString('assets/db.json');
  final data = await json.decode(response);
  print(data);
  // ...
}

// Map<String, dynamic> user = jsonDecode();
