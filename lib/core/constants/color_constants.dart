import 'dart:math';

import 'package:flutter/material.dart';

class ColorConstants {
  /// Title Text Color
  static Color blackPearl = const Color.fromRGBO(30, 33, 44, 1);

  /// Subtitle Text Color
  static Color darkGray = const Color.fromRGBO(169, 169, 169, 1);

  /// Textfield Background Color
  static Color whiteSmoke = const Color.fromRGBO(243, 243, 243, 1);

  /// Button Background Color
  static Color deepCerise = const Color.fromRGBO(221, 66, 134, 1);

  /// Weight Text Background Color
  static Color splash = const Color.fromRGBO(242, 228, 156, 1);

  /// Star Color
  static Color witchHaze = const Color.fromRGBO(251, 239, 133, 1);

  /// Card Background Color like Purple
  static Color paleCornflowerBlue = const Color.fromRGBO(179, 189, 242, 1);

  /// Appbar Icon Color
  static Color mandy = const Color.fromRGBO(202, 78, 91, 1);

  /// Appbar Background Color
  static Color paleRose = const Color.fromRGBO(236, 198, 211, 1);

  /// Popular Ice Cream Card Colors
  static List<Color> softColors = [deepCerise, witchHaze, paleCornflowerBlue];

  /// Popular Ice Cream Card Colors
  Color get randomColor => softColors[Random().nextInt(softColors.length)];
}
