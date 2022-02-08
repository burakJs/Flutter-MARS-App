import 'package:flutter/material.dart';

class BlocErrorWidget extends StatelessWidget {
  const BlocErrorWidget({Key? key, required this.error}) : super(key: key);
  final String error;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(error),
    );
  }
}
