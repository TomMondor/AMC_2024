import 'package:amc_2024/src/application/auth_service.dart';
import 'package:amc_2024/src/infra/account/user_repo.dart';
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
    final name = useState("");

    useEffect(() {
      Future<void> getUserName() async {
        final AuthService authService = locator<AuthService>();
        final UserRepository userRepository = locator<UserRepository>();

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
                  CardTip(
                    topIcon: Icons.whatshot,
                    descriptionText: "A slow period is starting, do you have a laundry load to do?",
                    titleText: "Slack period",
                  ),
                  CardTip(
                    topIcon: Icons.house,
                    descriptionText: "Confirm your work schedule to automatically reduce the heating in your absence.",
                    titleText: "Heating an empty house?",
                  ),
                  CardTip(
                    topIcon: Icons.car_crash,
                    descriptionText: "Some of your car trips would have been quicker by bus!",
                    titleText: "38km of car to do by bus",
                  ),
                  CardTip(
                    topIcon: Icons.attach_money,
                    descriptionText: "In the last month, these are your car trips of 2km or less, which you could have made on foot!",
                    titleText: "Missed \$11.50 savings!",
                  )
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
                CardSummary(topIcon: Icons.device_thermostat, titleText: '27°C', descriptionText: "Sunny", categoryText: "Temp."),
                CardSummary(topIcon: Icons.electric_bolt, titleText: '370', descriptionText: "KW", categoryText: "Consumption"),
                CardSummary(topIcon: Icons.air, titleText: '1-10', descriptionText: "Good", categoryText: "Air Quality"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
