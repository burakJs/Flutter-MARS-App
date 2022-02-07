import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class SearchFilterButton extends StatelessWidget {
  const SearchFilterButton({Key? key, required this.callback}) : super(key: key);
  final VoidCallback callback;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(
            Icons.tune,
            color: context.colorScheme.onPrimary.withOpacity(0.8),
          ),
          Text(
            'Filter',
            style: context.textTheme.bodyText1!.copyWith(
              fontWeight: FontWeight.w400,
              color: context.colorScheme.onPrimary.withOpacity(0.8),
            ),
          ),
        ],
      ),
      onPressed: callback,
    );
  }
}
