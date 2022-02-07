import 'package:flutter/material.dart';

import '../../presentation/views/home/home_view/ice_cream_home_view.dart';
import '../../presentation/widgets/error_widget.dart';
import '../constants/navigation_constants.dart';

class NavigationRoute {
  static NavigationRoute? _instance;
  static NavigationRoute get instance => _instance ??= NavigationRoute._init();
  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_PAGE:
        return normalNavigate(const IceCreamHomeView());
      case NavigationConstants.DETAIL_PAGE:
      // return normalNavigate(const IceCreamHomeView());
      default:
        return normalNavigate(const NavigateErrorWidget());
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) {
    return MaterialPageRoute(builder: (context) => widget);
  }
}
