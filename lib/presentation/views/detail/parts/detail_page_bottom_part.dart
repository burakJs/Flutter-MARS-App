part of '../detail_view/ice_cream_detail_view.dart';

class DetailPageBottomPart {
  static Row _starAndReviewsCountRow(BuildContext context, TopFlavour topFlavour) {
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

  static Text _descriptionText(BuildContext context, TopFlavour topFlavour) {
    return Text(
      topFlavour.description,
      style: context.textTheme.headline6?.copyWith(
        color: ColorConstants.darkGray,
      ),
    );
  }

  static Container _addToCardButtonContainer(BuildContext context) {
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

  static ElevatedButton _addToCardElevatedButton(BuildContext context) {
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

  static Text _topFlavourNameText(BuildContext context, TopFlavour topFlavour) {
    return Text(
      topFlavour.name,
      style: context.textTheme.headline4?.copyWith(
        color: ColorConstants.blackPearl,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Container _setWeightButtonContainer(BuildContext context, IconData icon) {
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
