import 'package:amc_2024/routes/routes.dart';
import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:amc_2024/src/view/account/validators.dart';
import 'package:amc_2024/src/view/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../injection_container.dart';
import '../../application/auth_service.dart';
import '../../theme/colors.dart';
import '../widgets/bottom_button.dart';
import '../widgets/text_input.dart';

class Register extends HookWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

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
          print(email);
          await authService.register(email, password);

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, Routes.hub.name);
          }
        } on AuthenticationException catch (e) {
          print("WTF");
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "ECOHUB",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: kcPrimary,
                      ),
                ),
                verticalSpace(36),
                Text(
                  "Sign Up",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: kcPrimaryVariant,
                      ),
                ),
                verticalSpace(40),
                EchoHubTextInput(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                ),
                verticalSpace(32),
                EchoHubTextInput(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  validator: validatePassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  labelText: 'Password',
                ),
                verticalSpace(96),
                BottomButton(
                  onPressed: () => register(),
                  title: 'Sign Up',
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "You have an account?",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: kcLightSecondary),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, Routes.login.name),
                      child: Text(
                        'LOG IN',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kcPrimaryVariant),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
