import 'package:dsi_2021_2/repository/pair_saved_repository.dart';
import 'package:flutter/material.dart';

import 'package:english_words/english_words.dart';
import 'package:dsi_2021_2/views/shared/constants.dart';
import 'package:dsi_2021_2/repository/card_view_repository.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = PairSavedRepository().suggestions;
  final _screenView = CardViewRepository();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
      ),
      body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions() {
    //Todo: desacoplar e tranformar em cardView
    if (_screenView.cardView) {
      return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (BuildContext _context, int i) {
            if (i.isOdd) {
              return Divider();
            }

            final int index = i ~/ 2;

            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    } else {
      //Todo: Desacoplar
      return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (BuildContext _context, int i) {
            if (i.isOdd) {
              return Divider();
            }

            final int index = i ~/ 2;

            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    }
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: Constants.bigSizeFont,
      ),
    );
  }
}
