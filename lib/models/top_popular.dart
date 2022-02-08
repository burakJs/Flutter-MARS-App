class TopPopular {
  final String name;
  TopPopular({required this.name});

  factory TopPopular.fromJson(String name) {
    return TopPopular(name: name);
  }
}
