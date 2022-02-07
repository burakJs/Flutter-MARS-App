import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import 'core/constants/color_constants.dart';
import 'presentation/views/home_view/ice_cream_home_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: context.appTheme.copyWith(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: ColorConstants.deepCerise,
            fixedSize: const Size(100, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
      home: const IceCreamHomeView(),
    );
  }
}
