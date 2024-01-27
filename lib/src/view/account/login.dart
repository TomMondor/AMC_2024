import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/application/electricity_service.dart';
import 'package:amc_2024/src/domain/electricity/hydro_model.dart';
import 'package:flutter/material.dart';

import '../../../routes/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWdith = MediaQuery.of(context).size.width;
    double formWidth = screenWdith * 0.8;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "WelCum to AMC",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                height: 50,
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
            ),
            SizedBox(
              width: formWidth,
              height: 50,
              child: const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: formWidth,
                child: ElevatedButton(
                  onPressed: () => {print("Login")},
                  child: const Text('Login'),
                ),
              ),
            ),
            TextButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, Routes.register.name),
              child: const Text(
                'Don\'t have an account? Sign up here.',
                style: TextStyle(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
