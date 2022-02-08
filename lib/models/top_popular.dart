import 'package:json_annotation/json_annotation.dart';

part 'top_popular.g.dart';

@JsonSerializable()
class TopPopular {
  final String name;
  TopPopular({required this.name});

  factory TopPopular.fromJson(String name) {
    Map<String, dynamic> json = {'name': name};
    return _$TopPopularFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TopPopularToJson(this);
}
