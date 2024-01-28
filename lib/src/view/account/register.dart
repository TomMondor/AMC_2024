import 'dart:convert';

import 'package:amc_2024/routes/routes.dart';
import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:amc_2024/src/view/account/validators.dart';
import 'package:amc_2024/src/view/widgets/custom_raw_auto_complete.dart';
import 'package:amc_2024/src/view/widgets/error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../injection_container.dart';
import '../../application/auth_service.dart';
import '../../infra/account/profile_repo.dart';
import '../../theme/colors.dart';
import '../widgets/bottom_button.dart';
import '../widgets/text_input.dart';

class Register extends HookWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final firstNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final carMakeController = useTextEditingController();

    final cars = useState<List<String>>(List<String>.empty());
    final isLoading = useState(false);

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

    Future<void> register() async {
      final email = emailController.text;
      final password = passwordController.text;
      final String name = firstNameController.text;
      final String surname = lastNameController.text;
      final String car = carMakeController.text.toString();

      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        try {
          AuthService authService = locator<AuthService>();
          await authService.register(email, password);

          try {
            isLoading.value = false;
            UserRepository profileRepository = locator<UserRepository>();
            final userId = authService.currentUser!.uid;
            await profileRepository.addUser(userId, name, surname, car);

            if (context.mounted) {
              Navigator.pushReplacementNamed(context, Routes.hub.name);
            }
          } on FirestoreException catch (e) {
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(24, 76, 24, 24),
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
                verticalSpace(36),
                EchoHubTextInput(
                  textInputAction: TextInputAction.next,
                  controller: firstNameController,
                  validator: validateName,
                  keyboardType: TextInputType.name,
                  labelText: 'First Name',
                ),
                verticalSpace(24),
                EchoHubTextInput(
                  textInputAction: TextInputAction.next,
                  controller: lastNameController,
                  validator: validateName,
                  keyboardType: TextInputType.name,
                  labelText: 'Last Name',
                ),
                verticalSpace(24),
                CustomAutocomplete(
                    textEditingController: carMakeController,
                    options: cars.value),
                verticalSpace(24),
                EchoHubTextInput(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: validateEmail,
                  keyboardType: TextInputType.emailAddress,
                  labelText: 'Email',
                ),
                verticalSpace(24),
                EchoHubTextInput(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  validator: validatePassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  labelText: 'Password',
                ),
                verticalSpace(48),
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
                          .bodySmall!
                          .copyWith(color: kcLightSecondary),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, Routes.login.name),
                      child: Text(
                        'LOG IN',
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
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
