import 'package:dio_demo/pages/register/register.dart';
import 'package:flutter/material.dart';

import '../pages/home/home.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Home.route:
        return pageRoute(page: const Home(), routeName: Home.route);

      case Register.route:
        return pageRoute(page: const Register(), routeName: Register.route);

      default:

        ///404 page
        return null;
    }
  }

  static pageRoute({required Widget page, required String routeName}) {
    return MaterialPageRoute(
        builder: (context) => page, settings: RouteSettings(name: routeName));
  }
}
