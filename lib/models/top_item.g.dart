// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopItem _$TopItemFromJson(Map<String, dynamic> json) => TopItem(
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      cost: (json['cost'] as num).toDouble(),
      colorR: json['color_r'] as int,
      colorG: json['color_g'] as int,
      colorB: json['color_b'] as int,
    );

Map<String, dynamic> _$TopItemToJson(TopItem instance) => <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'cost': instance.cost,
      'color_r': instance.colorR,
      'color_g': instance.colorG,
      'color_b': instance.colorB,
    };
