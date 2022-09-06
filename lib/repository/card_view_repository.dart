class CardViewRepository {
  bool cardView = false;

  void changeView() {
    cardView = !cardView;
  }

  get isCardView => cardView;
}
