import 'package:amc_2024/src/view/widgets/card_carbon.dart';
import 'package:amc_2024/src/view/widgets/card_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/card_tip.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Hi Clement!",
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
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
                    topIcon: Icons.pie_chart,
                    descriptionText: "You can wash your clothes"),
                CardTip(
                    topIcon: Icons.pie_chart,
                    descriptionText: "You can wash your clothes"),
                CardTip(
                    topIcon: Icons.pie_chart,
                    descriptionText: "You can wash your clothes"),
                CardTip(
                    topIcon: Icons.pie_chart,
                    descriptionText: "You can wash your clothes"),
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
              CardSummary(
                  topIcon: Icons.lightbulb,
                  titleText: '27°C',
                  descriptionText: "Sunny",
                  categoryText: "Temp."),
              CardSummary(
                  topIcon: Icons.lightbulb,
                  titleText: '370',
                  descriptionText: "KW",
                  categoryText: "Consumption"),
              CardSummary(
                  topIcon: Icons.lightbulb,
                  titleText: '1-10',
                  descriptionText: "Good",
                  categoryText: "Air Quality"),
            ],
          )
        ],
      ),
    ),
    const Text(
      'Index 3: Alimentation',
      style: optionStyle,
    ),
    const Text(
      'Index 4: Transport',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.amber,
        selectedIndex: _selectedIndex,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.home),
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.lightbulb),
            label: 'Electricity',
          ),
          NavigationDestination(
            icon: Icon(Icons.hub),
            label: 'Hub',
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_basket),
            label: 'Alimentation',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_car_filled),
            label: 'Transport',
          ),
        ],
      ),
    );
  }
}
