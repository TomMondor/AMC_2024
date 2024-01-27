import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/electricity/graph.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Electricity extends StatefulWidget {
  const Electricity({super.key});

  @override
  State<Electricity> createState() => _ElectricityState();
}

class _ElectricityState extends State<Electricity> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
        title: Text(
          'Power Consumption',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant),
        ),
        bottom: TabBar(
          indicatorSize: TabBarIndicatorSize.label, // You can also use TabBarIndicatorSize.tab for smaller indicator
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
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: Text(
                          '182',
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
                ),
              ),
              Text("25.6% INCREASE", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: kcPrimaryVariant)),
              const LineChartSample2()
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
