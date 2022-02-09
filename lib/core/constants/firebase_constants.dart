class FirebaseConstants {
  static FirebaseConstants? _instance;
  static FirebaseConstants get instance => _instance ??= FirebaseConstants._init();
  FirebaseConstants._init();

  final String TOP_FLAVOUR_COLLECTION = 'top_flavour';
  final String TOP_FLAVOUR_DOCUMENT = 'top';
  final String POPULAR_COLLECTION = 'popular';
  final String POPULAR_DOCUMENT = 'popular_ice_creams';
  final String TOP_ITEM_COLLECTION = 'top';
  final String TOP_ITEM_DOCUMENT = 'top_item';
}
