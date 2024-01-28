import 'package:amc_2024/src/view/account/register.dart';
import 'package:amc_2024/src/view/electricity/electricity.dart';
import 'package:amc_2024/src/view/home/hub.dart';
import 'package:flutter/material.dart';

import '../src/view/account/login.dart';
import '../src/view/account/user_info.dart';
import '../src/view/startup/startup.dart';
import '../src/view/home/home.dart';

enum Routes {
  home,
  startup,
  login,
  register,
  userInfo,
  electricity,
  hub
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
      case Routes.userInfo:
        return '/user-info';
      case Routes.electricity:
        return '/electricity';
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
  Routes.userInfo.name: (context) => const UserInfo(),
  Routes.electricity.name: (context) => const Electricity(),
};
