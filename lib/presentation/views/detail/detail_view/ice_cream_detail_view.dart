import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';
import 'package:mars_project/core/constants/string_constants.dart';
import 'package:mars_project/core/extensions/int_extension.dart';
import 'package:mars_project/models/top_flavour.dart';
import 'package:mars_project/presentation/widgets/home_view_widgets/icons/money_with_dolar_icon.dart';

class IceCreamDetailView extends StatelessWidget {
  const IceCreamDetailView({Key? key, required this.topFlavour}) : super(key: key);
  final TopFlavour topFlavour;

  final int _flexEight = 8;
  final int _flexTen = 10;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: _flexEight,
              child: _imageContainer(context),
            ),
            Expanded(
              flex: _flexTen,
              child: _bottomPageContainer(context),
            ),
          ],
        ),
      ),
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.deepCerise.withOpacity(0.5),
      elevation: 0,
      foregroundColor: ColorConstants.mandy,
      actions: [
        Padding(
          padding: context.horizontalPaddingMedium,
          child: Icon(topFlavour.isLiked ? Icons.favorite : Icons.favorite_border, size: 32),
        ),
      ],
    );
  }

  Container _bottomPageContainer(BuildContext context) {
    return Container(
      color: ColorConstants.deepCerise.withOpacity(0.5),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(context.highValue / 1.8),
          ),
          color: Colors.white,
        ),
        child: _bottomPagePadding(context),
      ),
    );
  }

  Padding _bottomPagePadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: context.mediumValue,
        horizontal: context.lowValue * 3,
      ),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _topFlavourNameText(context),
            _starAndReviewsCountRow(context),
            _setWeightAndCostRow(context),
            _descriptionText(context),
            _addToCardButtonContainer(context)
          ],
        ),
      ),
    );
  }

  Text _topFlavourNameText(BuildContext context) {
    return Text(
      topFlavour.name,
      style: context.textTheme.headline4?.copyWith(
        color: ColorConstants.blackPearl,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _descriptionText(BuildContext context) {
    return Text(
      topFlavour.description,
      style: context.textTheme.headline6?.copyWith(
        color: ColorConstants.darkGray,
      ),
    );
  }

  Container _addToCardButtonContainer(BuildContext context) {
    return Container(
      width: double.infinity,
      height: context.highValue / 1.5,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.deepCerise.withOpacity(0.5),
            ColorConstants.deepCerise.withOpacity(0.7),
            ColorConstants.deepCerise.withOpacity(0.9),
            ColorConstants.deepCerise,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: context.lowBorderRadius,
      ),
      child: _addToCardElevatedButton(context),
    );
  }

  ElevatedButton _addToCardElevatedButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(
        StringConstants.instance.addToCard,
        style: context.textTheme.headline6?.copyWith(
          color: context.colorScheme.onPrimary,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
        shadowColor: MaterialStateProperty.all(
          Colors.transparent,
        ),
      ),
    );
  }

  Container _imageContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(context.highValue / 1.8)),
        color: ColorConstants.deepCerise.withOpacity(0.5),
      ),
      child: _imagePadding(context),
    );
  }

  Padding _imagePadding(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: const Placeholder(),
    );
  }

  Row _starAndReviewsCountRow(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: ColorConstants.witchHaze),
        Icon(Icons.star, color: ColorConstants.witchHaze),
        Icon(Icons.star, color: ColorConstants.witchHaze),
        Icon(Icons.star, color: ColorConstants.witchHaze),
        Icon(Icons.star, color: ColorConstants.witchHaze),
        context.emptySizedWidthBoxNormal,
        Text(
          '${topFlavour.point}',
          style: context.textTheme.subtitle1?.copyWith(
            color: ColorConstants.darkGray,
          ),
        ),
        context.emptySizedWidthBoxNormal,
        Text(
          topFlavour.reviewsCount.toReviews,
          style: context.textTheme.subtitle1?.copyWith(
            color: ColorConstants.darkGray,
          ),
        ),
      ],
    );
  }

  Row _setWeightAndCostRow(BuildContext context) {
    return Row(
      children: [
        _setWeightButton(context, Icons.remove),
        const Spacer(),
        Text(topFlavour.weight.toKg),
        const Spacer(),
        _setWeightButton(context, Icons.add),
        Spacer(flex: _flexTen),
        MoneyWithDolarIcon(
          money: topFlavour.cost.toStringAsFixed(2),
          dolarStyle: context.textTheme.headline4,
          costStyle: context.textTheme.headline4?.copyWith(
            color: ColorConstants.blackPearl,
          ),
        ),
      ],
    );
  }

  Container _setWeightButton(BuildContext context, IconData icon) {
    return Container(
      width: context.lowValue * 3,
      height: context.lowValue * 3,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorConstants.deepCerise.withOpacity(0.5),
            ColorConstants.deepCerise.withOpacity(0.7),
            ColorConstants.deepCerise.withOpacity(0.9),
            ColorConstants.deepCerise,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Icon(
        icon,
        color: context.colorScheme.onPrimary,
      ),
    );
  }
}
