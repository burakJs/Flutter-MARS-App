import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

import '../core/constants/color_constants.dart';

part 'top_flavour.g.dart';

@JsonSerializable()
class TopFlavour {
  final String name;
  final int weight;
  final double point;
  final double cost;
  final String image;

  @JsonKey(name: 'color_r')
  final int colorR;

  @JsonKey(name: 'color_g')
  final int colorG;

  @JsonKey(name: 'color_b')
  final int colorB;

  final String description;

  @JsonKey(name: 'reviews_count')
  final int reviewsCount;

  bool isLiked;

  Color get color => Color.fromRGBO(colorR, colorG, colorB, 1);

  static final TopFlavour baseModel = TopFlavour(
    name: 'Base',
    weight: 1,
    point: 1,
    cost: 1,
    image: '',
    description: 'Description text...',
    reviewsCount: 229,
    isLiked: false,
    colorR: 221,
    colorG: 66,
    colorB: 134,
  );

  TopFlavour({
    required this.name,
    required this.weight,
    required this.point,
    required this.cost,
    required this.image,
    required this.colorR,
    required this.colorG,
    required this.colorB,
    required this.description,
    required this.reviewsCount,
    required this.isLiked,
  });

  factory TopFlavour.fromJson(Map<String, dynamic> json) => _$TopFlavourFromJson(json);
  Map<String, dynamic> toJson() => _$TopFlavourToJson(this);
}
