import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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

  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Electricity',
      style: optionStyle,
    ),
    Text(
      'Index 2: Hub',
      style: optionStyle,
    ),
    Text(
      'Index 3: Alimentation',
      style: optionStyle,
    ),
    Text(
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
            icon:Icon(Icons.lightbulb),
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
