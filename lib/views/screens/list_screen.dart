import 'package:flutter/material.dart';

import 'package:dsi_2021_2/views/shared/constants.dart';

class ListView extends StatefulWidget {
  const ListView({Key? key}) : super(key: key);

  @override
  State<ListView> createState() => _ListViewState();
}

class _ListViewState extends State<ListView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: Constants.bigSizeFont,
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
