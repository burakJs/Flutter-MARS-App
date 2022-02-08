import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:json_serializable/builder.dart';
import 'package:mars_project/core/constants/color_constants.dart';

part 'top_item.g.dart';

@JsonSerializable()
class TopItem {
  final String title;
  final String subTitle;
  final double cost;
  @JsonKey(name: 'color_r')
  final int colorR;
  @JsonKey(name: 'color_g')
  final int colorG;
  @JsonKey(name: 'color_b')
  final int colorB;

  Color get color => Color.fromRGBO(colorR, colorG, colorB, 1);

  TopItem({
    required this.title,
    required this.subTitle,
    required this.cost,
    required this.colorR,
    required this.colorG,
    required this.colorB,
  });
  static final baseModel = TopItem(title: 'Base Title', subTitle: 'Base SubTitle', cost: 14.60, colorR: 179, colorG: 189, colorB: 242);

  factory TopItem.fromJson(Map<String, dynamic> json) => _$TopItemFromJson(json);
  Map<String, dynamic> toJson() => _$TopItemToJson(this);
}
