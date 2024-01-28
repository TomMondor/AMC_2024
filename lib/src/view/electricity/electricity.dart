import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/electricity/graph.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:flutter/material.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> with TickerProviderStateMixin {
  late final TabController _tabController;
  late int cityGraphVariation = 0;
  late bool cityGraphHasIncreased = false;
  late int pourcentageVariation = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  void setCityGraphVariation(int variation, bool hasIncreased, int pourcentageVariation) {
    setState(() {
      cityGraphVariation = variation;
      cityGraphHasIncreased = hasIncreased;
      pourcentageVariation = pourcentageVariation;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Power Consumption',
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant),
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
                                child: Text(
                                  cityGraphVariation.toString(),
                                  style: Theme.of(context).textTheme.headlineLarge!.copyWith(color: kcPrimaryVariant),
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
                    cityGraphHasIncreased ? '$pourcentageVariation% increase' : '$pourcentageVariation% decrease',
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
                                height: 200,
                                color: kcBackground,
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      const Padding(
                                        padding: EdgeInsets.only(left: 30, right: 30),
                                        child: Column(children: <Widget>[
                                          TipItem(
                                              descriptionText: "Save energy and costs by doing laundry outside 4 to 8 PM",
                                              titleText: "Smart Laundry Scheduling",
                                              iconData: Icons.local_laundry_service),
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
          const Center(
            child: Text("It's rainy here"),
          )
        ],
      ),
    );
  }
}
