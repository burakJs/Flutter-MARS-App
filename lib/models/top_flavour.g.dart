// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_flavour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopFlavour _$TopFlavourFromJson(Map<String, dynamic> json) => TopFlavour(
      name: json['name'] as String,
      weight: json['weight'] as int,
      point: (json['point'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      image: json['image'] as String,
      colorR: json['color_r'] as int,
      colorG: json['color_g'] as int,
      colorB: json['color_b'] as int,
      description: json['description'] as String,
      reviewsCount: json['reviews_count'] as int,
      isLiked: json['isLiked'] as bool,
    );

Map<String, dynamic> _$TopFlavourToJson(TopFlavour instance) =>
    <String, dynamic>{
      'name': instance.name,
      'weight': instance.weight,
      'point': instance.point,
      'cost': instance.cost,
      'image': instance.image,
      'color_r': instance.colorR,
      'color_g': instance.colorG,
      'color_b': instance.colorB,
      'description': instance.description,
      'reviews_count': instance.reviewsCount,
      'isLiked': instance.isLiked,
    };
