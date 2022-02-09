import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/constants/navigation_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/widget/error_widget.dart';
import '../../../../models/top_item.dart';
import '../home_view_model/popular_ice_cream/repositories/popular_repository.dart';
import '../home_view_model/popular_ice_cream/top_flavours_cubit.dart';

import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/image_constants.dart';
import '../../../../core/data/concrete/firebase_data_manager.dart';
import '../../../../core/init/navigation/navigation_service.dart';
import '../../../../models/top_flavour.dart';
import '../../../widgets/home_view_widgets/button/search_filter_button.dart';
import '../../../widgets/home_view_widgets/card/popular_ice_cream_card.dart';
import '../../../widgets/home_view_widgets/card/top_flavours_card.dart';
import '../../../widgets/home_view_widgets/card/top_item_card.dart';
import '../../../widgets/home_view_widgets/textfield/search_textfield.dart';
import '../home_view_model/popular_ice_cream/top_popular_state.dart';
import '../home_view_model/top_Item/top_item_state.dart';
import '../home_view_model/top_flavour/repositories/flavour_repository.dart';
import '../home_view_model/top_flavour/top_flavour_state.dart';
import '../home_view_model/top_flavour/top_flavour_cubit.dart';
import '../home_view_model/top_item/repositories/top_item_repository.dart';
import '../home_view_model/top_item/top_item_cubit.dart';

part '../parts/home_page_title_part.dart';
part '../parts/home_page_search_part.dart';
part '../parts/home_page_columns_part.dart';

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
                child: HomePageTitlePart._homePageTitlePart(context),
              ),
              Expanded(
                flex: _flexTwo,
                child: HomePageSearchPart._searchTextFieldAndFilterButton(context),
              ),
              Expanded(
                flex: _flexFour,
                child: HomePageColumnsPart._topFlovoursColumn(context),
              ),
              context.emptySizedHeightBoxLow,
              context.emptySizedHeightBoxLow,
              Expanded(
                flex: _flexThree,
                child: HomePageColumnsPart._popularIceCreamColumn(context),
              ),
              Expanded(
                flex: _flexSix,
                child: HomePageColumnsPart._topItemColumn(context),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _topItemList() {
    return BlocProvider(
      create: (context) => TopItemCubit(repository: TopItemRepository(firebaseDataService: FirebaseDataManager()))..getTopItem(),
      child: BlocConsumer<TopItemCubit, TopItemState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is TopItemLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopItemSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 2,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: TopItemCard(
                    topItem: state.topItem ?? TopItem.baseModel,
                    callback: () {},
                  ),
                );
              },
            );
          } else {
            return BlocErrorWidget(error: StringConstants.instance.errorTopItem);
          }
        },
      ),
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
            TopFlavour _topFlavour = state.flavour ?? TopFlavour.baseModel;
            return GestureDetector(
              onTap: () {
                NavigationService.instance.navigateToPage(
                  NavigationConstants.DETAIL_PAGE,
                  data: _topFlavour,
                );
              },
              child: Container(
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
              ),
            );
          } else {
            return BlocErrorWidget(error: StringConstants.instance.erorTopFlavour);
          }
        },
      ),
    );
  }
}
