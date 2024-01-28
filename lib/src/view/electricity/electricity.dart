import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/electricity/graph.dart';
import 'package:amc_2024/src/view/electricity/home_chart.dart';
import 'package:amc_2024/src/view/electricity/radial_gauge.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity>
    with AutomaticKeepAliveClientMixin<Electricity>, TickerProviderStateMixin {
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

  void setCityGraphVariation(
      int variation, bool hasIncreased, String pourcentageVariation) {
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
            AppLocalizations.of(context)!.power_consumption,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: kcPrimaryVariant),
          ),
        ),
        bottom: TabBar(
          indicatorColor: kcBlue,
          labelColor: kcBlue,
          unselectedLabelColor: kcLightSecondary,
          labelStyle:
              Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcBlue),
          indicatorSize: TabBarIndicatorSize.label,
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              text: AppLocalizations.of(context)!.my_city,
            ),
            Tab(text: AppLocalizations.of(context)!.my_hub)
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
                                  Icon(
                                    cityGraphHasIncreased
                                        ? Icons.expand_less
                                        : Icons.expand_more,
                                    color: cityGraphHasIncreased
                                        ? kcRed
                                        : kcPrimary,
                                    size: 40.0,
                                  ),
                                  Text(
                                    'kWh',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: kcPrimaryVariant,
                                            fontSize: 30),
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
                    cityGraphHasIncreased
                        ? '$cityGraphPourcentageVariation% ${AppLocalizations.of(context)!.increase}'
                        : '$cityGraphPourcentageVariation% ${AppLocalizations.of(context)!.decrease}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kcPrimaryVariant),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 30, right: 30),
                                        child: Column(children: <Widget>[
                                          TipItem(
                                              descriptionText:
                                                  AppLocalizations.of(context)!
                                                      .slack_text,
                                              titleText:
                                                  AppLocalizations.of(context)!
                                                      .slack_title,
                                              iconData:
                                                  Icons.local_laundry_service,
                                              color: kcBlue),
                                          verticalSpace(10),
                                          TipItem(
                                            descriptionText:
                                                AppLocalizations.of(context)!
                                                    .nobody_text,
                                            titleText:
                                                AppLocalizations.of(context)!
                                                    .nobody_title,
                                            iconData: Icons.heat_pump,
                                            color: kcBlue,
                                          ),
                                          verticalSpace(10),
                                          TipItem(
                                              descriptionText:
                                                  AppLocalizations.of(context)!
                                                      .heating_text,
                                              titleText:
                                                  AppLocalizations.of(context)!
                                                      .heating_title,
                                              iconData: Icons.whatshot,
                                              color: kcBlue),
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
                        child: Text(AppLocalizations.of(context)!.can_help,
                            style: const TextStyle(color: kcBlue))),
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
                                    Icons.expand_more,
                                    color: kcPrimary,
                                    size: 40.0,
                                  ),
                                  Text(
                                    'Wh',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: kcPrimaryVariant,
                                            fontSize: 30),
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
                    '47.3% ${AppLocalizations.of(context)!.decrease}',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kcPrimaryVariant),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                padding: const EdgeInsets.all(16),
                                color: kcBackground,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8, top: 20),
                                        child: SizedBox(
                                          width: screenWidth(context),
                                          child: Text(
                                              AppLocalizations.of(context)!
                                                  .doing_great,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyMedium!
                                                  .copyWith(
                                                      color: kcPrimaryVariant)),
                                        ),
                                      ),
                                      Center(
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .generating_co2,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall!
                                                .copyWith(
                                                    color: kcPrimaryVariant)),
                                      ),
                                      const SizedBox(
                                        width: 200,
                                        height: 200,
                                        child: RadialGaugeConsumption(),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: Text(AppLocalizations.of(context)!.my_impact,
                            style: const TextStyle(color: kcBlue)),
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
