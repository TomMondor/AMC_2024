import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/leftover/leftover_item.dart';
import 'package:amc_2024/src/view/transport/number_label.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class Leftover extends StatefulWidget {
  const Leftover({super.key});

  @override
  State<Leftover> createState() => _LeftoverState();
}

class _LeftoverState extends State<Leftover> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Leftover',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: kcPrimaryVariant),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          // child: Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: const [
              LeftoverItem(
                  storeName: "Maxi", distanceToWalk: 10.0, ecoScore: 4.5),
              LeftoverItem(
                  storeName: "Metro", distanceToWalk: 3.44, ecoScore: 1.5),
              LeftoverItem(
                  storeName: "IGA", distanceToWalk: 2.69, ecoScore: 2.89),
            ],
          ),
        ),
      ),
      // ),
    );
  }
}
