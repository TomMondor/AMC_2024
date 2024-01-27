import 'package:amc_2024/src/view/electricity/electricity.dart';
import 'package:amc_2024/src/view/home/home.dart';
import 'package:amc_2024/src/view/widgets/card_carbon.dart';
import 'package:amc_2024/src/view/widgets/card_summary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../widgets/card_tip.dart';

class MyHubPage extends StatefulWidget {
  const MyHubPage({super.key, required this.title});

  final String title;

  @override
  State<MyHubPage> createState() => _MyHubPageState();
}

class _MyHubPageState extends State<MyHubPage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static final List<Widget> _widgetOptions = <Widget>[
    const Home(name: "Clement"),
    const Electricity(),
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