import 'package:flutter/material.dart';

class TabBar extends StatelessWidget {
  const TabBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              title: Text('tabBar'),
            ),
            body: TabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_train),
                Icon(Icons.directions_car),
              ],
            )),
      ),
    );
  }
}
