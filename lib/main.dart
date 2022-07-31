import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black12,
          foregroundColor: Colors.black,
        ),
      ),
      home: RandomWords(),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = <WordPair>{};
  final _biggerFont = const TextStyle(fontSize: 18);
  final _biggestFont = const TextStyle(fontSize: 27);
  bool cardView = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Startup Name Generator'),
        actions: [
          IconButton(
            icon: const Icon(Icons.crop_square_rounded),
            onPressed: _changeViwer,
            tooltip: 'Change View',
          ),
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: _pushSaved,
            tooltip: 'Saved Suggestions',
          ),
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _changeViwer() {
    setState(() {
      if (cardView) {
        cardView = false;
      } else {
        cardView = true;
      }
    });
  }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          final tiles = _saved.map(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final divided = tiles.isNotEmpty
              ? ListTile.divideTiles(
                  context: context,
                  tiles: tiles,
                ).toList()
              : <Widget>[];

          return Scaffold(
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          );
        },
      ),
    );
  }

  Widget _buildSuggestions() {
    if (cardView) {
      return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (BuildContext _context, int i) {
            final int index = i;
            if (index >= _suggestions.length) {
              _suggestions.addAll(generateWordPairs().take(10));
            }
            return _buildRow(_suggestions[index]);
          });
    } else {
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
    final alreadySaved = _saved.contains(pair);
    if (cardView) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // Todo: recuperar Pair
              pair.asPascalCase,
              style: _biggerFont,
            ),
            IconButton(
              icon: Icon(
                // Todo: recuperar alreadySaved
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              color: alreadySaved ? Colors.red : null,
              onPressed: () {
                setState(
                  () {
                    if (alreadySaved) {
                      _saved.remove(pair);
                    } else {
                      _saved.add(pair);
                    }
                  },
                );
              },
            ),
          ],
        ),
      );
    } else {
      return ListTile(
        title: Text(
          pair.asPascalCase,
          style: _biggerFont,
        ),
        trailing: IconButton(
          icon: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
          ),
          color: alreadySaved ? Colors.red : null,
          onPressed: () {
            setState(
              () {
                if (alreadySaved) {
                  _saved.remove(pair);
                } else {
                  _saved.add(pair);
                }
              },
            );
          },
        ),
        onTap: () {
          // NEW lines from here...
        },
      );
    }
  }
}
