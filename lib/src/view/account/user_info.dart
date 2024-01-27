import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserInfo extends HookWidget {
  const UserInfo({super.key});

  static const List<String> _fruitOptions = <String>[
    'apple',
    'banana',
    'orange',
    'mango',
    'grapes',
    'watermelon',
    'kiwi',
    'strawberry',
    'sugarcane',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("enter Fruit name:"),

            // Auto complete widget
            Autocomplete<String>(

              optionsBuilder: (TextEditingValue fruitTextEditingValue) {

                // if user is input nothing
                if (fruitTextEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }

                // if user is input something the build
                // suggestion based on the user input
                return _fruitOptions.where((String option) {
                  return option
                      .contains(fruitTextEditingValue.text.toLowerCase());
                });
              },

              // when user click on the suggested
              // item this function calls
              onSelected: (String value) {
                debugPrint('You just selected $value');
              },
            ),
          ],
        ),

        ),
      ),
    );
  }
}
