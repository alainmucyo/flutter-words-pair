import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  final WordPair randomWord;
  final bool alreadySaved;
  final Function save;

  ListItem(this.randomWord, this.alreadySaved, this.save);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        randomWord.asPascalCase,
        style: TextStyle(fontSize: 18),
      ),
      trailing: alreadySaved
          ? Icon(
              Icons.favorite,
              color: Colors.red,
            )
          : Icon(Icons.favorite_border),
      onTap: () => save(randomWord),
    );
  }
}
