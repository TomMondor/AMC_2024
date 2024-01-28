import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/electricity/graph.dart';
import 'package:amc_2024/src/view/electricity/home_chart.dart';
import 'package:amc_2024/src/view/electricity/radial_gauge.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> with AutomaticKeepAliveClientMixin<Electricity>, TickerProviderStateMixin {
  late final TabController _tabController;
  late int cityGraphVariation = 0;
  late bool cityGraphHasIncreased = false;
  late String cityGraphPourcentageVariation = "0";

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void setCityGraphVariation(int variation, bool hasIncreased, String pourcentageVariation) {
    setState(() {
      cityGraphVariation = variation;
      cityGraphHasIncreased = hasIncreased;
      cityGraphPourcentageVariation = pourcentageVariation;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Power Consumption',
            style: Theme.of(context).textTheme.displayLarge!.copyWith(color: kcPrimaryVariant),
          ),
        ),
        bottom: TabBar(
          labelStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: const <Widget>[
            Tab(
              text: "My City",
            ),
            Tab(text: "My Hub")
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: AnimatedDigitWidget(
                                  value: cityGraphVariation,
                                  textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(color: kcPrimaryVariant),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(
                                    cityGraphHasIncreased ? Icons.expand_less : Icons.expand_more,
                                    color: cityGraphHasIncreased ? kcRed : kcPrimary,
                                    size: 40.0,
                                  ),
                                  Text(
                                    'kWh',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kcPrimaryVariant, fontSize: 30),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    cityGraphHasIncreased ? '$cityGraphPourcentageVariation% increase' : '$cityGraphPourcentageVariation% decrease',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: kcBackground,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30, right: 30),
                                        child: Column(children: <Widget>[
                                          const TipItem(
                                              descriptionText: "A slow period is starting, do you have a laundry load to do?",
                                              titleText: "Slack period",
                                              iconData: Icons.local_laundry_service),
                                          verticalSpace(10),
                                          const TipItem(
                                              descriptionText: "There seems to be no one at home, would you like to turn down the heat?",
                                              titleText: "Nobody at home?",
                                              iconData: Icons.heat_pump),
                                          verticalSpace(10),
                                          const TipItem(
                                              descriptionText: "Confirm your work schedule to automatically reduce the heating in your absence.",
                                              titleText: "Heating an empty house?!",
                                              iconData: Icons.whatshot),
                                        ]),
                                      ),
                                      ElevatedButton(
                                        child: const Text('OK!'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("How can I help?")),
                  )
                ],
              ),
              CoolChart(methodFromParent: setCityGraphVariation),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: AnimatedDigitWidget(
                                  value: 757,
                                  textStyle: Theme.of(context).textTheme.headlineLarge!.copyWith(color: kcPrimaryVariant),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Icon(
                                    Icons.expand_more,
                                    color: kcPrimary,
                                    size: 40.0,
                                  ),
                                  Text(
                                    'Wh',
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: kcPrimaryVariant, fontSize: 30),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text(
                    '47.3% decrease',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                color: kcBackground,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 8, top: 20),
                                        child: Text("You are doing great! Keep it up!",
                                            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 30, right: 30),
                                        child: Center(
                                          child: Text("You are generating approximately 757 Wh, which translates to 0.5kg of CO2 per day.",
                                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: kcPrimaryVariant)),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.only(left: 30, right: 30),
                                        child: RadialGaugeConsumption(),
                                      ),
                                      ElevatedButton(
                                        child: const Text('OK!'),
                                        onPressed: () => Navigator.pop(context),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text("What is my impact?"),
                      ))
                ],
              ),
              HomeChart(),
            ],
          ),
        ],
      ),
    );
  }
}
