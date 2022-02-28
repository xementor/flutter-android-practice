import 'package:flutter/material.dart';
import 'package:practice/medicine_shop/widget/account_tab.dart';
import 'controller/account_controller.dart';
import 'controller/medicine_controller.dart';
import 'controller/medicine.dart';
import 'controller/med_dbhelper.dart';
import 'widget/tab_1.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

import 'widget/tab_2.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MedicineController()),
        ChangeNotifierProvider(create: (_) => AccountController()),
      ],
      child: MyApp(),
    ),
  );
}

class Counter with ChangeNotifier, DiagnosticableTreeMixin {
  int _count = 0;

  int get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IH Medicine Sheop',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Medicine> medicines = [];

  //controllers used in insert operation UI

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  void _showMessageInScaffold(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  // Custom Widget

  int storage = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Insert",
              ),
              Tab(
                text: "View",
              ),
              Tab(
                text: "Account",
              ),
              Tab(
                text: "Query",
              ),
              Tab(
                text: "Update",
              ),
              Tab(
                text: "Delete",
              ),
            ],
          ),
          title: Text('Medicine Shop'),
        ),
        body: TabBarView(
          children: [
            Tab1(),
            Tab2(),
            AccountTab(),
            Text('hi'),
            Text('hi'),
            Text('hi'),
          ],
        ),
      ),
    );
  }
}
