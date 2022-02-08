import 'package:flutter/material.dart';

import '../core/constants/color_constants.dart';

class TopFlavour {
  final String name;
  final int weight;
  final double point;
  final double cost;
  final String image;
  final Color color;

  static final TopFlavour baseModel = TopFlavour(name: 'Base', weight: 1, point: 1, cost: 1, image: '', color: ColorConstants().randomColor);
  TopFlavour({
    required this.name,
    required this.weight,
    required this.point,
    required this.cost,
    required this.image,
    required this.color,
  });

  factory TopFlavour.fromJson(Map<String, dynamic>? json) {
    return TopFlavour(
      name: json?['name'] as String,
      weight: json?['weight'] as int,
      point: json?['point'] as double,
      cost: json?['cost'] as double,
      image: json?['image'] as String,
      color: Color.fromRGBO(json?['color_r'] as int, json?['color_g'] as int, json?['color_b'] as int, 1),
    );
  }
}
