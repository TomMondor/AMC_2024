import 'package:flutter/material.dart';

import '../main.dart';
import '../src/view/account/login.dart';
import '../src/view/startup/startup.dart';

enum Routes {
  home,
  startup,
  login,
}

extension RoutesExtension on Routes {
  String get name {
    switch (this) {
      case Routes.home:
        return '/';
      case Routes.startup:
        return '/startup';
      case Routes.login:
        return '/login';
      default:
        return '/';
    }
  }
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.home.name: (context) => const MyHomePage(title: 'Flutter Demo Home Page'),
  Routes.startup.name: (context) => const Startup(),
  Routes.login.name: (context) => const Login(),
};
