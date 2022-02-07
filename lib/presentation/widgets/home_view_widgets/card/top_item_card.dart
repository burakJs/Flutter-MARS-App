import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/constants/color_constants.dart';

import '../button/circle_button.dart';
import '../icons/money_with_dolar_icon.dart';

class TopItemCard extends StatelessWidget {
  const TopItemCard({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.money,
    required this.callback,
  }) : super(key: key);

  final String title;
  final String subTitle;
  final String money;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2.4,
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: ColorConstants().randomColor.withOpacity(0.3),
      ),
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Placeholder()),
            Text(
              title,
              style: context.textTheme.headline6!.copyWith(
                fontSize: 19,
                color: ColorConstants.blackPearl.withOpacity(0.8),
              ),
            ),
            Text(
              subTitle,
              style: context.textTheme.bodyText1!.copyWith(
                color: ColorConstants.blackPearl.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  MoneyWithDolarIcon(money: money),
                  const Spacer(),
                  CircleButton(radius: 15, callback: callback),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
