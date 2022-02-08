import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../../../core/constants/color_constants.dart';

class MoneyWithDolarIcon extends StatelessWidget {
  final String money;
  final TextStyle? dolarStyle;
  final TextStyle? costStyle;
  const MoneyWithDolarIcon({Key? key, required this.money, this.dolarStyle, this.costStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          '\$ ',
          style: (dolarStyle ?? context.textTheme.subtitle2!).copyWith(
            color: ColorConstants.deepCerise,
          ),
        ),
        Text(
          money,
          style: costStyle ?? context.textTheme.headline6,
        ),
      ],
    );
  }
}
