import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/color_constants.dart';

class MoneyWithDolarIcon extends StatelessWidget {
  final String money;
  const MoneyWithDolarIcon({Key? key, required this.money}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ ',
          style: context.textTheme.subtitle2!.copyWith(
            color: ColorConstants.deepCerise,
          ),
        ),
        Text(
          money,
          style: context.textTheme.headline6,
        ),
      ],
    );
  }
}
