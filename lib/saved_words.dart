import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class SavedWords extends StatelessWidget {
  final Set<WordPair> words;

  SavedWords(this.words);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Saved Words"),
        ),
      ),
      body: ListView.separated(
        separatorBuilder: (BuildContext context, int index) {
          return Divider();
        },
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(words.toList()[index].asPascalCase),
          );
        },
        itemCount: words.length,
      ),
    );
  }
}
