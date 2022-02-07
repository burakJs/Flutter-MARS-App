import 'package:flutter/material.dart';

class NavigateErrorWidget extends StatelessWidget {
  const NavigateErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('ERROR ON NAVIGATE'),
      ),
    );
  }
}
