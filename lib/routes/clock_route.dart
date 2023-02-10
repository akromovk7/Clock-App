import 'package:clock_app/core/constants/const_route.dart';
import 'package:clock_app/screens/home_page/view/home_view.dart';
import 'package:clock_app/screens/settings_page/view/settings_view.dart';
import 'package:flutter/material.dart';

class MyRoute {
  static final MyRoute _instance = MyRoute.init();
  static MyRoute get instance => _instance;
  MyRoute.init();

  Route? myRoutes(RouteSettings settings) {
    var args = settings.arguments;
    switch (settings.name) {
      case homePage:
        return easynavigate(HomeView());
      case settingsPage:
        return easynavigate(SettingsView());
    }
  }

  easynavigate(Widget page) => MaterialPageRoute(builder: (context) => page);
}
