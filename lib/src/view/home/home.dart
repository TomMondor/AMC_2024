import 'package:amc_2024/src/application/auth_service.dart';
import 'package:amc_2024/src/infra/account/profile_repo.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/widgets/card_carbon.dart';
import 'package:amc_2024/src/view/widgets/card_summary.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../injection_container.dart';
import '../widgets/card_tip.dart';

class Home extends HookWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthService authService = locator<AuthService>();
    final UserRepository userRepository = locator<UserRepository>();

    final name = useState("");

    useEffect(() {
      Future<void> getUserName() async {
        final userId = authService.currentUser!.uid;
        final userInfo = await userRepository.getUser(userId);
        name.value = userInfo.name;
      }

      getUserName();
      return () {};
    }, []);

    useEffect(() {
      Future<void> requestNotificationPermissions() async {
        NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
          alert: true,
          announcement: false,
          badge: true,
          carPlay: false,
          criticalAlert: false,
          provisional: false,
          sound: true,
        );

        print('User granted permission: ${settings.authorizationStatus}');
      }

      requestNotificationPermissions();
      return () {};
    }, []);

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Hi ${name.value} !",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: kcPrimaryVariant,
                    ),
              ),
            ),
            const CardCarbon(score: 253),
            SizedBox(
              height: 125, // Set the height as needed
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  CardTip(topIcon: Icons.pie_chart, descriptionText: "You can wash your clothes"),
                  CardTip(topIcon: Icons.pie_chart, descriptionText: "You can wash your clothes"),
                  CardTip(topIcon: Icons.pie_chart, descriptionText: "You can wash your clothes"),
                  CardTip(topIcon: Icons.pie_chart, descriptionText: "You can wash your clothes"),
                ],
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Summary",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardSummary(topIcon: Icons.lightbulb, titleText: '27°C', descriptionText: "Sunny", categoryText: "Temp."),
                CardSummary(topIcon: Icons.lightbulb, titleText: '370', descriptionText: "KW", categoryText: "Consumption"),
                CardSummary(topIcon: Icons.lightbulb, titleText: '1-10', descriptionText: "Good", categoryText: "Air Quality"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
