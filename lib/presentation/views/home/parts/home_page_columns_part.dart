part of '../home_view/ice_cream_home_view.dart';

class HomePageColumnsPart {
  static Column _topItemColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, StringConstants.instance.topItem),
        context.emptySizedHeightBoxLow,
        Expanded(
          child: const IceCreamHomeView()._topItemList(),
        ),
      ],
    );
  }

  static Text _topFlovoursTitleText(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.headline6?.copyWith(
        color: ColorConstants.blackPearl.withOpacity(0.7),
      ),
    );
  }

  static Column _popularIceCreamColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, StringConstants.instance.popularIceCream),
        Expanded(
          child: const IceCreamHomeView()._popularIceCreamList(),
        )
      ],
    );
  }

  static Column _topFlovoursColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, StringConstants.instance.topFlavours),
        context.emptySizedHeightBoxLow,
        context.emptySizedHeightBoxLow,
        Expanded(
          child: const IceCreamHomeView()._topFlovoursContainer(context),
        )
      ],
    );
  }
}
