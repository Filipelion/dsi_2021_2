import 'package:english_words/english_words.dart';

class PairSavedRepository {
  final _suggestions = <WordPair>[];
  final saved = <WordPair>{};
  // bool saved = false;

  bool isSaved(String pair) => saved.contains(pair);
}
