part of '../home_view/ice_cream_home_view.dart';

class HomePageTitlePart {
  static Row _homePageTitlePart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleTextPart(context),
        _girlCircleAvatar(context),
      ],
    );
  }

  static Column _titleTextPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(context),
        context.emptySizedHeightBoxLow,
        _subTitleText(context),
      ],
    );
  }

  static Text _titleText(BuildContext context) {
    return Text(
      StringConstants.instance.heyEmma,
      style: context.textTheme.headline5?.copyWith(
        color: ColorConstants.blackPearl,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  static Text _subTitleText(BuildContext context) {
    return Text(
      StringConstants.instance.whatFlavorDoYouLikeToEat,
      style: context.textTheme.bodyText1?.copyWith(
        color: ColorConstants.darkGray,
      ),
    );
  }

  static CircleAvatar _girlCircleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorConstants.deepCerise,
      backgroundImage: AssetImage(ImageConstants.instance.girl),
      radius: context.mediumValue / 1.4,
    );
  }
}
