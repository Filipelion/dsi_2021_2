import 'package:english_words/english_words.dart';

class PairRepository {
  final suggestions = <WordPair>[];
  final saved = <WordPair>{};
  // bool savedPair = false;

  get getSuggestions => suggestions;

  get getSaved => saved;
}
