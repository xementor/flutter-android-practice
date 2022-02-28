import 'package:flutter/material.dart';
import 'package:practice/video/db/data.dart';
import 'package:practice/video/widget/card.dart';
import 'package:practice/video/widget/card_list.dart';
import 'package:practice/video/db/data.dart';
// import 'package:practice/video/db/data.json';

void main() {
  runApp(const MyNewApp());
}

VideoData data1 = VideoData(1, "hellow myapps", "/pic/1.jpg");

class MyNewApp extends StatelessWidget {
  const MyNewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Video"),
        ),
        body: CardList(),
        bottomNavigationBar: bottomNavBar(),
      ),
    );
  }

  BottomNavigationBar bottomNavBar() {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(
            Icons.home_outlined,
            color: Colors.black38,
          ),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(
            Icons.search_outlined,
            color: Colors.black38,
          ),
        ),
        BottomNavigationBarItem(
          label: "Bookmark",
          icon: Icon(
            Icons.bookmark_border_outlined,
            color: Colors.black38,
          ),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(
            Icons.person_outline,
            color: Colors.black38,
          ),
        ),
      ],
    );
  }
}
