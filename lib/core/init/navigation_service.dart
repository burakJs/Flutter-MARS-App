import 'package:flutter/material.dart';

import 'INavigation_Service.dart';

class NavigationService extends INavigationService {
  static NavigationService? _instance;
  static NavigationService get instance => _instance ??= NavigationService._init();
  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data ?? '');
  }

  @override
  Future<void> navigateToPageClear(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data ?? '');
  }
}
