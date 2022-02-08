import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mars_project/core/init/navigation_route.dart';
import 'package:mars_project/core/init/navigation_service.dart';

import 'core/constants/color_constants.dart';
import 'presentation/views/home/home_view/ice_cream_home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      theme: _mainTheme(context),
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      navigatorKey: NavigationService.instance.navigatorKey,
      home: const IceCreamHomeView(),
    );
  }

  ThemeData _mainTheme(BuildContext context) {
    return context.appTheme.copyWith(
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: ColorConstants.deepCerise,
          fixedSize: const Size(100, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
