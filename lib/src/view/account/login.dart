import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/account/validators.dart';
import 'package:amc_2024/src/view/widgets/bottom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../helpers/ui_helpers.dart';
import '../../../injection_container.dart';
import '../../../routes/routes.dart';
import '../../application/auth_service.dart';
import '../../exceptions/exceptions.dart';
import '../widgets/error_dialog.dart';
import '../widgets/text_input.dart';

class Login extends HookWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    final isLoading = useState(false);

    Future<void> login() async {
      final email = emailController.text;
      final password = passwordController.text;

      if (formKey.currentState!.validate()) {
        isLoading.value = true;

        try {
          isLoading.value = false;
          AuthService authService = locator<AuthService>();
          await authService.login(email, password);

          if (context.mounted) {
            Navigator.pushReplacementNamed(context, Routes.hub.name);
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
          padding: const EdgeInsets.fromLTRB(20, 76, 20, 24),
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
                  AppLocalizations.of(context)!.login,
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
                  labelText: AppLocalizations.of(context)!.email,
                ),
                verticalSpace(32),
                EchoHubTextInput(
                  textInputAction: TextInputAction.done,
                  controller: passwordController,
                  validator: validatePassword,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  labelText: AppLocalizations.of(context)!.password,
                ),
                verticalSpace(96),
                BottomButton(
                  onPressed: () => login(),
                  title: AppLocalizations.of(context)!.login,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.dont_have_account,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: kcLightSecondary),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, Routes.register.name),
                      child: Text(
                        AppLocalizations.of(context)!.signup.toUpperCase(),
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
