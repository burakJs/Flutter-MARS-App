import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/constants/color_constants.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width - 60,
      height: context.height / 15,
      decoration: BoxDecoration(
        color: ColorConstants.whiteSmoke,
        borderRadius: context.lowBorderRadius,
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: ColorConstants.darkGray,
          ),
          hintText: 'Search',
          hintStyle: context.textTheme.bodyText1!.copyWith(
            color: ColorConstants.darkGray,
          ),
        ),
      ),
    );
  }
}
