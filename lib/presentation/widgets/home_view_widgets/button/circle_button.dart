import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/constants/color_constants.dart';

class CircleButton extends StatelessWidget {
  const CircleButton({Key? key, required this.callback, required this.radius}) : super(key: key);
  final VoidCallback callback;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: CircleAvatar(
        child: Icon(Icons.add, color: context.colorScheme.onPrimary),
        radius: radius,
        backgroundColor: ColorConstants.deepCerise,
      ),
    );
  }
}
