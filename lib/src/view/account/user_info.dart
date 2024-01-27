import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class UserInfo extends HookWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cars = useState<List<String>>(List<String>.empty());

    useEffect(() {
      Future<void> readJson() async {
        final String response =
            await rootBundle.loadString("assets/data/make_models.json");
        final Map<String, dynamic> data = await json.decode(response);
        cars.value = data.keys.toList();
      }

      readJson();

      return () {
      };
    }, const []);

    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Text(
                  "User Info",
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name',
                    ),
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name',
                    ),
                  ),
                ),
              ),
              const Center(
                child: Text("Enter your car model"),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Autocomplete<String>(
                  optionsBuilder: (TextEditingValue carTextEditingValue) {
                    return cars.value.where(
                      (String option) {
                        return option
                            .toLowerCase()
                            .contains(carTextEditingValue.text.toLowerCase());
                      },
                    );
                  },
                  onSelected: (String value) {
                    debugPrint('You just selected $value');
                    FocusScope.of(context).requestFocus(FocusNode());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
