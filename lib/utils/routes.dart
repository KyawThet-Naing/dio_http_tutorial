import 'package:flutter/material.dart';

import '../pages/home.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.route:
        return pageRoute(page:const Home(), routeName: Home.route);
    }
  }

  static pageRoute({required Widget page, required String routeName}) {
    return MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(name: routeName));
  }
}
