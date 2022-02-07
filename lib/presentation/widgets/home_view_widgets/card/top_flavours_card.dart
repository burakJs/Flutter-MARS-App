import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/models/top_flavour.dart';

import '../../../../core/constants/color_constants.dart';
import '../button/circle_button.dart';
import '../icons/money_with_dolar_icon.dart';

class TopFloavoursCard extends StatelessWidget {
  const TopFloavoursCard({Key? key, required this.topFlavour}) : super(key: key);
  final TopFlavour topFlavour;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowValue * 2, vertical: context.lowValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            topFlavour.name,
            style: context.textTheme.headline6,
          ),
          Row(
            children: [
              _weightWithContainer(context),
              const Spacer(),
              _starAndPointRow(context),
              const Spacer(),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MoneyWithDolarIcon(money: '${topFlavour.cost}'),
              const Spacer(),
              CircleButton(radius: 20, callback: () {}),
            ],
          ),
        ],
      ),
    );
  }

  Container _weightWithContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.lowBorderRadius,
        color: ColorConstants.splash,
      ),
      child: Padding(
        padding: EdgeInsets.all(context.lowValue / 2),
        child: Text(
          '${topFlavour.weight} KG',
          style: context.textTheme.subtitle2,
        ),
      ),
    );
  }

  Row _starAndPointRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: ColorConstants.witchHaze),
        Text(
          '${topFlavour.point}',
          style: context.textTheme.subtitle2,
        )
      ],
    );
  }
}
