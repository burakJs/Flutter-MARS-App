import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';
import '../../../../core/data/concrete/firebase_data_manager.dart';
import '../../../../core/constants/color_constants.dart';
import '../../../../core/constants/string_constants.dart';
import '../../../../core/extensions/int_extension.dart';
import '../../../../core/widget/error_widget.dart';
import '../../../../models/top_flavour.dart';
import '../detail_view_model/repositories/top_flavour_detail_repository.dart';
import '../detail_view_model/top_flavour_detail_state.dart';
import '../../../widgets/home_view_widgets/icons/money_with_dolar_icon.dart';

import '../detail_view_model/top_flavour_detail_cubit.dart';

part '../parts/detail_page_top_part.dart';
part '../parts/detail_page_bottom_part.dart';

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
              child: DetailPageTopPart._imageContainer(context),
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
            DetailPageBottomPart._topFlavourNameText(context, topFlavour),
            DetailPageBottomPart._starAndReviewsCountRow(context, topFlavour),
            _setWeightAndCostRow(context),
            DetailPageBottomPart._descriptionText(context, topFlavour),
            DetailPageBottomPart._addToCardButtonContainer(context)
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
              return _setLikeIconGesture(context);
            } else if (state is TopFlavourDetailLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TopFlavourDetailSuccess) {
              return _setLikeIconGesture(context);
            } else {
              return BlocErrorWidget(error: (state as TopFlavourDetailError).error ?? StringConstants.instance.errorWhenSetLike);
            }
          },
        ),
      ),
    );
  }

  GestureDetector _setLikeIconGesture(BuildContext context) {
    return GestureDetector(
        onTap: () => context.read<TopFlavourDetailCubit>().setLike(topFlavour),
        child: Icon(topFlavour.isLiked ? Icons.favorite : Icons.favorite_border, size: 32));
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
            return _weightAndCostRow(context, state);
          } else {
            return BlocErrorWidget(error: StringConstants.instance.errorWhenSetKilos);
          }
        },
      ),
    );
  }

  Row _weightAndCostRow(BuildContext context, TopFlavourDetailSuccess state) {
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
      child: DetailPageBottomPart._setWeightButtonContainer(context, icon),
    );
  }
}
