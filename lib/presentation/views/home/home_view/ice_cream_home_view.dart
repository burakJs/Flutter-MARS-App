import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/string_constants.dart';
import 'package:mars_project/core/widget/error_widget.dart';
import 'package:mars_project/presentation/views/home/home_view_model/popular_ice_cream/repositories/popular_repository.dart';
import 'package:mars_project/presentation/views/home/home_view_model/popular_ice_cream/top_flavours_cubit.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/data/concrete/firebase_data_manager.dart';
import '../../../../models/top_flavour.dart';
import '../../../widgets/home_view_widgets/button/search_filter_button.dart';
import '../../../widgets/home_view_widgets/card/popular_ice_cream_card.dart';
import '../../../widgets/home_view_widgets/card/top_flavours_card.dart';
import '../../../widgets/home_view_widgets/card/top_item_card.dart';
import '../../../widgets/home_view_widgets/textfield/search_textfield.dart';
import '../home_view_model/popular_ice_cream/top_popular_state.dart';
import '../home_view_model/top_flavour/repositories/flavour_repository.dart';
import '../home_view_model/top_flavour/top_flavour_state.dart';
import '../home_view_model/top_flavour/top_flavours_cubit.dart';

class IceCreamHomeView extends StatelessWidget {
  const IceCreamHomeView({Key? key}) : super(key: key);

  final int _flexTwo = 2;
  final int _flexThree = 3;
  final int _flexFour = 4;
  final int _flexSix = 6;
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
                flex: _flexTwo,
                child: _homePageTitlePart(context),
              ),
              Expanded(
                flex: _flexTwo,
                child: _searchTextFieldAndFilterButton(context),
              ),
              Expanded(
                flex: _flexFour,
                child: _topFlovoursColumn(context),
              ),
              context.emptySizedHeightBoxLow,
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: _flexThree,
                child: _popularIceCreamColumn(context),
              ),
              Expanded(
                flex: _flexSix,
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
        _topFlovoursTitleText(context, StringConstants.instance.topItem),
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
        _topFlovoursTitleText(context, StringConstants.instance.popularIceCream),
        Expanded(
          child: _popularIceCreamList(),
        )
      ],
    );
  }

  Widget _popularIceCreamList() {
    return BlocProvider(
      create: (context) => TopPopularCubit(repository: PopularRepository(firebaseDataService: FirebaseDataManager()))..getTopPopular(),
      child: BlocConsumer<TopPopularCubit, TopPopularState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopPopularLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopPopularSuccess) {
            return ListView.builder(
              itemCount: state.topPopular?.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return PopularIceCreamCard(index: index, topPopular: state.topPopular?[index]);
              },
            );
          } else {
            return BlocErrorWidget(error: StringConstants.instance.errorPopular);
          }
        },
      ),
    );
  }

  Column _topFlovoursColumn(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _topFlovoursTitleText(context, StringConstants.instance.topFlavours),
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
      style: context.textTheme.headline6?.copyWith(
        color: ColorConstants.blackPearl.withOpacity(0.7),
      ),
    );
  }

  Widget _topFlovoursContainer(BuildContext context) {
    return BlocProvider(
      create: (context) => TopFlavourCubit(
        repository: FlavourRepository(
          firebaseDataService: FirebaseDataManager(),
        ),
      )..getTopFlavour(),
      child: BlocConsumer<TopFlavourCubit, TopFlavourState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopFlavourLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopFlavourSuccess) {
            TopFlavour _topFlavour = state.topFlavour ?? TopFlavour.baseModel;
            return Container(
              decoration: BoxDecoration(
                borderRadius: context.normalBorderRadius,
                color: _topFlavour.color.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  const Expanded(
                    flex: 2,
                    child: Placeholder(),
                  ),
                  Expanded(
                    flex: 3,
                    child: TopFloavoursCard(topFlavour: _topFlavour),
                  ),
                ],
              ),
            );
          } else {
            return BlocErrorWidget(error: StringConstants.instance.erorTopFlavour);
          }
        },
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
        _girlCircleAvatar(context),
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
      StringConstants.instance.heyEmma,
      style: context.textTheme.headline5?.copyWith(
        color: ColorConstants.blackPearl,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Text _subTitleText(BuildContext context) {
    return Text(
      StringConstants.instance.whatFlavorDoYouLikeToEat,
      style: context.textTheme.bodyText1?.copyWith(
        color: ColorConstants.darkGray,
      ),
    );
  }

  CircleAvatar _girlCircleAvatar(BuildContext context) {
    return CircleAvatar(
      backgroundColor: ColorConstants.deepCerise,
      backgroundImage: AssetImage(ImageConstants.instance.girl),
    );
  }
}
