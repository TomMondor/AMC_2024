import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/transport/number_label.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class Transport extends StatefulWidget {
  const Transport({super.key});

  @override
  State<Transport> createState() => _TransportState();
}

class _TransportState extends State<Transport> with TickerProviderStateMixin {
  int _average = 1230;

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
              'Transport',
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
            child: Column(
              children: [
                verticalSpace(24),
                Text('My Footprint',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: kcPrimaryVariant)),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: AnimatedDigitWidget(
                        value: _average,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: kcPrimaryVariant),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.expand_less,
                          color: kcPrimary,
                          size: 40.0,
                        ),
                        Text(
                          'kg',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: kcPrimaryVariant, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(children: [
                    Text("CO2",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kcPrimaryVariant)),
                    verticalSpace(32),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        NumberLabel(score: 5, descriptionText: 'Walk'),
                        NumberLabel(
                            score: 300, descriptionText: 'Public'),
                        NumberLabel(score: 275, descriptionText: 'Car'),
                      ],
                    ),
                    verticalSpace(58),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What does it mean?',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kcPrimaryVariant,
                            ),
                      ),
                    ),
                    verticalSpace(16),
                  ]),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: const [
                      TipItem(
                          iconData: Icons.directions_walk,
                          titleText: 'Maybe a little walk?',
                          descriptionText:
                              'If you walked instead of taking your car, you would have saved 5kg of CO2 for distances less than 5km.'),
                      TipItem(
                          iconData: Icons.directions_bus,
                          titleText: 'Cheap bus tickets',
                          descriptionText:
                              'There is a sale on the annual bus pass for students. You can save up to 50% on your bus tickets.'),
                      TipItem(
                          iconData: Icons.local_taxi,
                          titleText: 'Carpool to Montreal',
                          descriptionText:
                              'Your calendar suggests that you are going to Montreal for AMC 2024. You can carpool with other students and save up to 275kg of CO2.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
