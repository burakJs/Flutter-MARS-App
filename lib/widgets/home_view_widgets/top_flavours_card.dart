import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';

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
              _moneyWithDolars(context),
              const Spacer(),
              _addFAButton(),
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

  FloatingActionButton _addFAButton() {
    return FloatingActionButton(
      onPressed: () {},
      mini: true,
      backgroundColor: ColorConstants.deepCerise,
      child: Icon(
        Icons.add,
        size: 32,
      ),
    );
  }

  Row _moneyWithDolars(BuildContext context) => Row(
        children: [
          Text(
            '\$ ',
            style: context.textTheme.subtitle2!.copyWith(
              color: ColorConstants.deepCerise,
            ),
          ),
          Text(
            '14,60',
            style: context.textTheme.headline6,
          ),
        ],
      );
}
