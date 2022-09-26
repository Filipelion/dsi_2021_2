import 'package:flutter/material.dart';

class SavedWords extends StatelessWidget {
  const SavedWords({
    super.key,
    required this.divided,
  });

  final List<Widget> divided;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Suggestions'),
      ),
      body: ListView(children: divided),
    );
  }
}
