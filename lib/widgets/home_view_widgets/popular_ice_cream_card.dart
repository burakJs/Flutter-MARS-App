import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';

class PopularIceCreamCard extends StatelessWidget {
  const PopularIceCreamCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: context.lowValue),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: context.lowBorderRadius,
              color: ColorConstants.deepCerise,
            ),
            width: context.width / 8,
            height: context.height / 18,
            child: Placeholder(),
          ),
          Container(
            decoration: BoxDecoration(
              color: ColorConstants.deepCerise.withOpacity(0.3),
            ),
            height: context.height / 18,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.lowValue * 1.5, vertical: context.lowValue * 1.8),
              child: const Center(child: Text('Vanilla')),
            ),
          ),
        ],
      ),
    );
  }
}
