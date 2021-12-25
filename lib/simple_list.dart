import 'package:flutter/material.dart';
import 'package:practice/data_storage_ex.dart';

class SimpleList extends StatefulWidget {
  const SimpleList({Key? key, required this.storage}) : super(key: key);
  final DataStorage storage;

  @override
  _SimpleListState createState() => _SimpleListState();
}

class _SimpleListState extends State<SimpleList> {
  final List<String> mainWords = <String>[
    "Npap",
    "Henten",
    "Offer",
    "Ami",
    "Tmi",
    "Nothing",
  ];

  late List<String> words = <String>[...mainWords];

  TextEditingController myController = TextEditingController();

  _goToSavedList() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) {
        final Iterable<ListTile> tiles = savedList.map((String text) {
          return ListTile(
            title: Text(text),
          );
        });
        final List<Widget> diveded = ListTile.divideTiles(
          context: context,
          tiles: tiles,
        ).toList();

        return Scaffold(
            appBar: AppBar(
              title: const Text("Selected List"),
            ),
            body: ListView(
              children: diveded,
            ));
      },
    ));
  }

  void _search({String? text}) {
    String input = text ?? myController.text.toLowerCase();

    Iterable<String> searchedIList = mainWords.where((element) {
      return element.toLowerCase().contains(input);
    });
    List<String> searchedList = searchedIList.toList();

    setState(() {
      words = searchedList;
    });
  }

  final List<String> savedList = <String>[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SimpleList'),
          actions: [
            IconButton(
              onPressed: () => _goToSavedList(),
              icon: const Icon(Icons.list),
            )
          ],
        ),
        body: Column(
          children: [
            Expanded(child: myListView(words)),
            Flexible(
              child: TextField(
                onChanged: (_) {
                  _search(text: _);
                },
                controller: myController,
              ),
            ),
            Flexible(
              child: ElevatedButton(
                onPressed: () {
                  _add();
                  
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ));
  }

  Widget myListView(List<String> words) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: words.length,
      itemBuilder: (BuildContext context, index) {
        const Divider();
        return _rowView(index);
      },
    );
  }

  Widget _rowView(int index) {
    final isSaved = savedList.contains(words[index]);
    return ListTile(
      title: Text(
        words[index],
        style: const TextStyle(fontSize: 17),
      ),
      trailing: Icon(isSaved ? Icons.error : Icons.add,
          color: isSaved ? Colors.red : null),
      onTap: () {
        setState(() {
          isSaved
              ? savedList.remove(words[index])
              : savedList.add(words[index]);
        });
      },
    );
  }

  void _add() {
    if (myController.text.isNotEmpty) {
      setState(() {
        print(myController.text);
        mainWords.add(myController.text);
      });
    }
    myController.text = '';
    _search();
  }
}
