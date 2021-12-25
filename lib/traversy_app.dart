import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class TraversyApp extends StatefulWidget {
  const TraversyApp({Key? key}) : super(key: key);

  @override
  State<TraversyApp> createState() => _TraversyAppState();
}

class _TraversyAppState extends State<TraversyApp> {
  final _randomWordPair = <WordPair>[];
  final savedWordPair = Set<WordPair>();

  // Custom Widget
  Widget _buildList() {
    return ListView.builder(
      padding: const EdgeInsets.all(18),
      itemBuilder: (context, item) {
        final index = item;

        if (index >= _randomWordPair.length) {
          _randomWordPair.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_randomWordPair[index]);
      },
    );
  }

  // Custom WIDGET
  Widget _buildRow(WordPair pair) {
    final savedWord = savedWordPair.contains(pair);
    return ListTile(
      trailing: Icon(savedWord ? Icons.favorite : Icons.favorite_border,
          color: savedWord ? Colors.red : null),
      title: Text(pair.asCamelCase, style: const TextStyle(fontSize: 18)),
      onTap: () {
        setState(() {
          savedWord ? savedWordPair.remove(pair) : savedWordPair.add(pair);
        });
      },
    );
  }

  _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = savedWordPair.map((WordPair pair) {
        return ListTile(
          title: Text(
            pair.asCamelCase,
            style: const TextStyle(fontSize: 18),
          ),
        );
      });

      final List<Widget> divided = ListTile.divideTiles(
        context: context,
        tiles: tiles,
      ).toList();

      return Scaffold(
        appBar: AppBar(title: const Text('Saved Word')),
        body: ListView(children: divided),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WordPair Generator"),
        actions: [
          IconButton(
              onPressed: () => _pushSaved(), icon: const Icon(Icons.list))
        ],
      ),
      body: _buildList(),
    );
  }
}
