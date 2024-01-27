import 'package:amc_2024/routes/routes.dart';
import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:amc_2024/src/view/account/validators.dart';
import 'package:amc_2024/src/view/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../injection_container.dart';
import '../../application/auth_service.dart';

class Register extends HookWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    double formWidth = 300;

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isLoading = useState(false);

    Future<void> register() async {
      final email = emailController.text;
      final password = passwordController.text;

      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        try {
          isLoading.value = false;
          AuthService authService = locator<AuthService>();
          await authService.register(email, password);

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, Routes.userInfo.name);
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
    }

    return Scaffold(
      body: Center(
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Register",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: formWidth,
                  height: 50,
                  child: TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Email',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: SizedBox(
                  width: formWidth,
                  height: 50,
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    controller: passwordController,
                    validator: validatePassword,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                    width: formWidth,
                    child: ElevatedButton(
                        // ignore: avoid_print
                        onPressed: () => register(),
                        style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.black,
                            shape: const BeveledRectangleBorder()),
                        child: const Text("Continue"))),
              ),
              TextButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, Routes.login.name),
                child: const Text(
                  "Already have an account?",
                  style: TextStyle(color: Colors.blueAccent),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
