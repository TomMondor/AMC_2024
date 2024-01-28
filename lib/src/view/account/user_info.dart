import 'dart:async';
import 'dart:convert';

import 'package:amc_2024/src/view/widgets/custom_raw_auto_complete.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../routes/routes.dart';
import '../../exceptions/exceptions.dart';
import '../widgets/error_dialog.dart';

class UserInfo extends HookWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final FocusNode _focusNode = FocusNode();
    final GlobalKey _autocompleteKey = GlobalKey();

    final cars = useState<List<String>>(List<String>.empty());
    final selectedCar = useState<String>("");
    final isLoading = useState(false);

    final nameController = useTextEditingController();
    final surnameController = useTextEditingController();
    final carMakeController = useTextEditingController();

    useEffect(() {
      Future<void> readJson() async {
        final String response =
            await rootBundle.loadString("assets/data/make_models.json");
        final Map<String, dynamic> data = await json.decode(response);
        cars.value = data.keys.toList();
      }

      readJson();

      return () {};
    }, const []);

    useEffect(() {
      carMakeController.addListener(() {
      });
    }, [carMakeController]);

    String? validateName(String? value) {
      if (value!.isEmpty) {
        return 'Can not be empty';
      }
      return null;
    }

    Future<void> submitInfo() async {
      final String name = nameController.text;
      final String surname = surnameController.text;
      final String car = carMakeController.text.toString();

      print(name);
      print(surname);
      print(car);

      if (formKey.currentState!.validate()) {
        isLoading.value = true;
        try {
          isLoading.value = false;

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, Routes.home.name);
          }
        } on AuthenticationException catch (e) {
          isLoading.value = false;
          showDialog(
            context: context,
            builder: (BuildContext context) => ErrorDialog(
              title: "Oops",
              message: e.message,
              buttonText: "OK",
            ),
          );
        }
      }

      if (name.isNotEmpty && surname.isNotEmpty && car.isNotEmpty) {
        Navigator.pushReplacementNamed(context, Routes.home.name);
      }
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
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
                    controller: nameController,
                    validator: validateName,
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
                    controller: surnameController,
                    validator: validateName,
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
                child: CustomAutocomplete(textEditingController: carMakeController, options: cars.value,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    child: ElevatedButton(
                        // ignore: avoid_print
                        onPressed: () => submitInfo(),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const BeveledRectangleBorder()),
                        child: const Text("Continue"))),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



