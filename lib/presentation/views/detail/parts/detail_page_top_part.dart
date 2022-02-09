part of '../detail_view/ice_cream_detail_view.dart';

class DetailPageTopPart {
  static Container _imageContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(context.highValue / 1.8)),
        color: ColorConstants.deepCerise.withOpacity(0.5),
      ),
      child: _imagePadding(context),
    );
  }

  static Padding _imagePadding(BuildContext context) {
    return Padding(
      padding: context.paddingMedium,
      child: const Placeholder(),
    );
  }
}