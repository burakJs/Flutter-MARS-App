class StringConstants {
  static StringConstants? _instance;
  static StringConstants get instance => _instance ??= StringConstants._init();
  StringConstants._init();

  String get topItem => 'Top Item';
  String get popularIceCream => 'Popular Ice Cream';
  String get topFlavours => 'Top Flavours';
  String get heyEmma => 'Hey Emma';
  String get whatFlavorDoYouLikeToEat => 'What flavor do you like to eat?';
  String get erorTopFlavour => 'Error when is loading top flavours';
  String get errorPopular => 'Error when is loading popular ice creams';
  String get errorTopItem => 'Error when is loading popular top items';
  String get addToCard => 'Add to Card';
  String get errorWhenSetLike => 'Error when is set like';
  String get errorWhenSetKilos => 'Error when is set kilos';
}
