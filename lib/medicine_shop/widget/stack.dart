import 'package:flutter/material.dart';
import 'package:practice/main.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Stack'),
        ),
        body: Stack(
          children: [
            Container(
              width: 200,
              height: 200,
            ),
            Positioned(
              child: Text('it is a hover text'),
            ),
          ],
        ),
      ),
    );
  }
}
