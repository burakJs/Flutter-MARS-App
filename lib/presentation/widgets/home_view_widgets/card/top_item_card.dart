import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/image_constants.dart';
import '../../../../models/top_item.dart';

import '../../../../core/constants/color_constants.dart';
import '../button/circle_button.dart';
import '../icons/money_with_dolar_icon.dart';

class TopItemCard extends StatelessWidget {
  const TopItemCard({
    Key? key,
    required this.callback,
    required this.topItem,
    required this.index,
  }) : super(key: key);
  final int index;
  final TopItem topItem;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width / 2.4,
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: ColorConstants.softColors[index].withOpacity(0.4),
      ),
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: Image.asset(index == 0 ? ImageConstants.instance.sherbet1 : ImageConstants.instance.sherbet2)),
            Text(
              topItem.title,
              style: context.textTheme.headline6!.copyWith(
                fontSize: 19,
                color: ColorConstants.blackPearl.withOpacity(0.8),
              ),
            ),
            Text(
              topItem.subTitle,
              style: context.textTheme.bodyText1!.copyWith(
                color: ColorConstants.blackPearl.withOpacity(0.4),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Row(
                children: [
                  MoneyWithDolarIcon(money: '${topItem.cost}'),
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
