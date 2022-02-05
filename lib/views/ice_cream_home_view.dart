import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';
import 'package:mars_project/core/constants/image_constants.dart';
import 'package:mars_project/widgets/home_view_widgets/search_filter_button.dart';
import 'package:mars_project/widgets/home_view_widgets/search_textfield.dart';

class IceCreamHomeView extends StatelessWidget {
  const IceCreamHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.mediumValue / 1.5,
            vertical: context.mediumValue,
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
              Expanded(flex: 4, child: Container(color: context.randomColor)),
              Expanded(flex: 3, child: Container(color: context.randomColor)),
              Expanded(flex: 6, child: Container(color: context.randomColor))
            ],
          ),
        ),
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
