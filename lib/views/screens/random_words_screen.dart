import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import '../../repository/card_view_repository.dart';
import '../../repository/pair_repository.dart';
import '../shared/constants.dart';

class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _pairRepository = PairRepository();
  final _screenView = CardViewRepository();
  get _suggestions => _pairRepository.getSuggestions;
  get _saved => _pairRepository.getSaved;

  void generatePair(index, suggestions) {
    if (index >= suggestions.length) {
      _suggestions.addAll(generateWordPairs().take(10));
    }
  }

  void _changeViwer() {
    setState(() {
      _screenView.changeView();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Startup Name Generator'),
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

  // Widget _deletePair(BuildContext context, WordPair pair, int index) {
  //   final stringPair = pair.toString();

  //   return Dismissible(
  //     key: Key(stringPair),
  //     direction: DismissDirection.endToStart,
  //     onDismissed: (direction) {
  //       setState(() {
  //         var removed = _suggestions.removeAt(index);
  //         _saved.remove(removed);
  //       });
  //     },
  //     background: Container(
  //       color: Colors.red,
  //       child: const Align(
  //         alignment: AlignmentDirectional.centerEnd,
  //         child: Icon(
  //           Icons.delete,
  //         ),
  //       ),
  //     ),
  //     child: _buildRow(context, stringPair, pair, index),
  //   );
  // }

  void _pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) {
          // todo: fix tiles return
          final tiles = _saved.map<Widget>(
            (pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: Constants.bigSizeFont,
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
    if (_screenView.isCardView) {
      return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisCount: 2,
            childAspectRatio: 1.3,
          ),
          itemBuilder: (BuildContext context, int i) {
            final int index = i;
            generatePair(index, _suggestions);
            return _buildRow(_suggestions[index]);
          });
    } else {
      return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemBuilder: (BuildContext context, int i) {
            if (i.isOdd) {
              return const Divider();
            }
            final int index = i ~/ 2;
            generatePair(index, _suggestions);
            return _buildRow(_suggestions[index]);
          });
    }
  }

  Widget _buildRow(WordPair pair) {
    final alreadySaved = _saved.contains(pair);
    final stringPair = pair.toString();
    final index = _suggestions.indexOf(pair);

    if (_screenView.isCardView) {
      return Card(
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              // Todo: recuperar Pair
              pair.asPascalCase,
              style: Constants.bigSizeFont,
            ),
            IconButton(
              icon: Icon(
                // Todo: recuperar alreadySaved
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
              ),
              color: alreadySaved ? Colors.red : null,
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    _saved.remove(pair);
                  } else {
                    _saved.add(pair);
                  }
                });
              },
            ),
          ],
        ),
      );
    } else {
      return Dismissible(
        key: Key(stringPair),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          setState(() {
            var removed = _suggestions.removeAt(index);
            _saved.remove(removed);
          });
        },
        background: Container(
          color: Colors.red,
          child: const Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Icon(
              Icons.delete,
            ),
          ),
        ),
        child: ListTile(
          title: Text(
            pair.asPascalCase,
            style: Constants.bigSizeFont,
          ),
          trailing: Icon(
            alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null,
          ),
          onTap: () {
            setState(() {
              if (alreadySaved) {
                _saved.remove(pair);
              } else {
                _saved.add(pair);
              }
            });
          },
        ),
      );

      // ListTile(
      //   title: Text(
      //     pair.asPascalCase,
      //     style: Constants.bigSizeFont,
      //   ),
      //   trailing: IconButton(
      //     icon: Icon(
      //       alreadySaved ? Icons.favorite : Icons.favorite_border,
      //       semanticLabel: alreadySaved ? 'Remove from saved' : 'Save',
      //     ),
      //     color: alreadySaved ? Colors.red : null,
      //     onPressed: () {
      //       setState(() {
      //         if (alreadySaved) {
      //           _saved.remove(pair);
      //         } else {
      //           _saved.add(pair);
      //         }
      //       });
      //     },
      //   ),
      //   onTap: () {
      //     // NEW lines from here...
      //   },
      // );
    }
  }
}
