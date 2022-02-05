import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';
import 'package:mars_project/core/constants/image_constants.dart';
import 'package:mars_project/widgets/home_view_widgets/circle_button.dart';
import 'package:mars_project/widgets/home_view_widgets/money_with_dolar_icon.dart';
import 'package:mars_project/widgets/home_view_widgets/popular_ice_cream_card.dart';
import 'package:mars_project/widgets/home_view_widgets/search_filter_button.dart';
import 'package:mars_project/widgets/home_view_widgets/search_textfield.dart';
import 'package:mars_project/widgets/home_view_widgets/top_flavours_card.dart';
import 'package:mars_project/widgets/home_view_widgets/top_item_card.dart';

class IceCreamHomeView extends StatelessWidget {
  const IceCreamHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mediumValue / 1.5,
            vertical: context.mediumValue / 1.2,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: _homePageTitlePart(context),
              ),
              Expanded(
                flex: 2,
                child: _searchTextFieldAndFilterButton(context),
              ),
              Expanded(
                flex: 4,
                child: _topFlovoursColumn(context),
              ),
              context.emptySizedHeightBoxLow,
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: 3,
                child: _popularIceCreamColumn(context),
              ),
              Expanded(
                flex: 6,
                child: _topItemColumn(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Column _topItemColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, 'Top Item'),
        context.emptySizedHeightBoxLow,
        Expanded(
          child: _topItemList(),
        ),
      ],
    );
  }

  ListView _topItemList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 2,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(right: 10),
          child: TopItemCard(
            title: 'Sherbet flavors',
            subTitle: 'With strawberry jam',
            money: '14.60',
            callback: () {},
          ),
        );
      },
    );
  }

  Column _popularIceCreamColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, 'Popular Ice Cream'),
        Expanded(
          child: _popularIceCreamList(),
        )
      ],
    );
  }

  ListView _popularIceCreamList() {
    return ListView.builder(
      itemCount: 3,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return const PopularIceCreamCard();
      },
    );
  }

  Column _topFlovoursColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, 'Top Flavours'),
        context.emptySizedHeightBoxLow,
        context.emptySizedHeightBoxLow,
        Expanded(
          child: _topFlovoursContainer(context),
        )
      ],
    );
  }

  Text _topFlovoursTitleText(BuildContext context, String title) {
    return Text(
      title,
      style: context.textTheme.headline6!.copyWith(
        color: ColorConstants.blackPearl.withOpacity(0.7),
      ),
    );
  }

  Container _topFlovoursContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: context.normalBorderRadius,
        color: ColorConstants.deepCerise.withOpacity(0.3),
      ),
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: Placeholder(),
          ),
          Expanded(
            flex: 3,
            child: TopFloavoursCard(),
          ),
        ],
      ),
    );
  }

  Stack _searchTextFieldAndFilterButton(BuildContext context) {
    return Stack(
      children: [
        SearchTextField(controller: TextEditingController()),
        _filterButtonPadding(context),
      ],
    );
  }

  Padding _filterButtonPadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: context.mediumValue),
      child: Align(
        alignment: Alignment.centerRight,
        child: SearchFilterButton(
          callback: () {},
        ),
      ),
    );
  }

  Row _homePageTitlePart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _titleTextPart(context),
        _girlCircleAvatar(),
      ],
    );
  }

  Column _titleTextPart(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titleText(context),
        context.emptySizedHeightBoxLow,
        _subTitleText(context),
      ],
    );
  }

  Text _titleText(BuildContext context) {
    return Text(
      'Hey Emma',
      style: context.textTheme.headline5!.copyWith(
        color: ColorConstants.blackPearl,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _subTitleText(BuildContext context) {
    return Text(
      'What flavor do you like to eat?',
      style: context.textTheme.bodyText1!.copyWith(
        color: ColorConstants.darkGray,
      ),
    );
  }

  CircleAvatar _girlCircleAvatar() {
    return CircleAvatar(
      backgroundColor: ColorConstants.deepCerise,
      radius: 30,
      backgroundImage: AssetImage(ImageConstants.instance.girl),
    );
  }
}
