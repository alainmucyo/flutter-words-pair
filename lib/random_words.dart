import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:words/saved_words.dart';
import 'package:words/widgets/list_item.dart';

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _randomPairs = <WordPair>[];
  final _savedWords = Set<WordPair>();

  void _save(word) {
    setState(() {
      if (_savedWords.contains(word))
        _savedWords.remove(word);
      else
        _savedWords.add(word);
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SavedWords(_savedWords);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("WordPair Generator!"),
          ),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.list), onPressed: _pushSaved)
          ],
        ),
        body: Container(
          child: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemBuilder: (BuildContext context, int item) {
              if (item.isOdd) return Divider();
              final index = item ~/ 2;
              if (index >= _randomPairs.length) {
                _randomPairs.addAll(generateWordPairs().take(10));
              }
              var pair = _randomPairs[index];
              bool alreadySaved = _savedWords.contains(pair);
              return ListItem(pair, alreadySaved, _save);
            },
          ),
        ));
  }
}
