import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';
import 'package:mars_project/widgets/home_view_widgets/circle_button.dart';
import 'package:mars_project/widgets/home_view_widgets/money_with_dolar_icon.dart';

class TopFloavoursCard extends StatelessWidget {
  const TopFloavoursCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.lowValue * 2, vertical: context.lowValue),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Vanilla Ice Cream',
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
              const MoneyWithDolarIcon(money: '14.60'),
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
          '1 KG',
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
          '4.9',
          style: context.textTheme.subtitle2,
        )
      ],
    );
  }
}
