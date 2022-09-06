class PairModel {
  final String first;
  final String second;
  bool liked;

  PairModel({
    required this.first,
    required this.second,
    required this.liked,
  });

  @override
  String toString() {
    return 'PairModel{first: $first, second: $second, liked: $liked}';
  }
}
