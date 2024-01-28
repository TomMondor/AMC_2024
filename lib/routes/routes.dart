import 'package:amc_2024/src/view/account/profile.dart';
import 'package:amc_2024/src/view/account/register.dart';
import 'package:amc_2024/src/view/electricity/electricity.dart';
import 'package:amc_2024/src/view/home/hub.dart';
import 'package:flutter/material.dart';

import '../src/view/account/login.dart';
import '../src/view/startup/startup.dart';

enum Routes {
  home,
  startup,
  login,
  register,
  electricity,
  hub,
  profile,
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
      case Routes.register:
        return '/register';
      case Routes.electricity:
        return '/electricity';
      case Routes.profile:
        return '/profile';
      default:
        return '/';
    }
  }
}

Map<String, Widget Function(BuildContext)> appRoutes = {
  Routes.home.name: (context) =>
      const MyHubPage(title: 'Flutter Demo Home Page'),
  Routes.startup.name: (context) => const Startup(),
  Routes.login.name: (context) => const Login(),
  Routes.register.name: (context) => const Register(),
  Routes.electricity.name: (context) => const Electricity(),
  Routes.profile.name: (context) => const Profile(),
};
