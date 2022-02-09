import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/data/concrete/firebase_data_manager.dart';
import '../detail_view_model/repositories/ITop_flavour_detail_repository.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../core/widget/error_widget.dart';
import '../../../../models/top_flavour.dart';
import '../detail_view_model/repositories/top_flavour_detail_repository.dart';
import '../detail_view_model/top_flavour_detail_state.dart';
import '../../home/home_view_model/top_flavour/top_flavour_state.dart';
import '../../../widgets/home_view_widgets/icons/money_with_dolar_icon.dart';

import '../detail_view_model/top_flavour_detail_cubit.dart';

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
        _likeHearthPadding(context),
      ],
    );
  }

  Padding _likeHearthPadding(BuildContext context) {
    return Padding(
      padding: context.horizontalPaddingMedium,
      child: BlocProvider(
        create: (context) => TopFlavourDetailCubit(repository: TopFlavourDetailRepository(service: FirebaseDataManager())),
        child: BlocBuilder<TopFlavourDetailCubit, TopFlavourDetailState>(
          builder: (context, state) {
            if (state is TopFlavourDetailInitial) {
              return GestureDetector(
                  onTap: () => context.read<TopFlavourDetailCubit>().setLike(topFlavour),
                  child: Icon(topFlavour.isLiked ? Icons.favorite : Icons.favorite_border, size: 32));
            } else if (state is TopFlavourDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopFlavourDetailSuccess) {
              return GestureDetector(
                  onTap: () => context.read<TopFlavourDetailCubit>().setLike(topFlavour),
                  child: Icon((state.topFlavour ?? TopFlavour.baseModel).isLiked ? Icons.favorite : Icons.favorite_border, size: 32));
            } else {
              return BlocErrorWidget(error: (state as TopFlavourDetailError).error ?? StringConstants.instance.errorWhenSetLike);
            }
          },
        ),
      ),
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

  Widget _setWeightAndCostRow(BuildContext context) {
    return BlocProvider(
      create: (context) => TopFlavourDetailCubit(repository: TopFlavourDetailRepository(service: FirebaseDataManager())),
      child: BlocBuilder<TopFlavourDetailCubit, TopFlavourDetailState>(
        builder: (context, state) {
          if (state is TopFlavourDetailInitial) {
            return _initialWeightAndCostRow(context);
          } else if (state is TopFlavourDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopFlavourDetailSuccess) {
            return Row(
              children: [
                _setWeightButton(context, Icons.remove, false),
                const Spacer(),
                Text((state.kilos ?? 1).toKg),
                const Spacer(),
                _setWeightButton(context, Icons.add, true),
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
          } else {
            return BlocErrorWidget(error: StringConstants.instance.errorWhenSetKilos);
          }
        },
      ),
    );
  }

  Row _initialWeightAndCostRow(BuildContext context) {
    return Row(
      children: [
        _setWeightButton(context, Icons.remove, false),
        const Spacer(),
        Text(topFlavour.weight.toKg),
        const Spacer(),
        _setWeightButton(context, Icons.add, true),
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

  GestureDetector _setWeightButton(BuildContext context, IconData icon, bool isAdd) {
    return GestureDetector(
      onTap: () => context.read<TopFlavourDetailCubit>().setKilos(isAdd),
      child: Container(
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
      ),
    );
  }
}
