import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:rive/rive.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../injection_container.dart';
import '../../../routes/routes.dart';
import '../../application/auth_service.dart';

class Startup extends HookWidget {
  const Startup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = locator<AuthService>();

    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        if (authService.isLogged()) {
          Navigator.pushReplacementNamed(context, Routes.home.name);
        } else {
          Navigator.pushReplacementNamed(context, Routes.login.name);
        }
      });
      return null;
    }, const []);

    return Scaffold(
      body: Container(
        height: screenHeight(context),
        width: screenWidth(context),
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.04),
        color: const Color(0xFFD0F0C0),
        child: const Center(
          child: RiveAnimation.asset(
            'assets/animations/heartbeat.riv',
          ),
        ),
      ),
    );
  }
}
