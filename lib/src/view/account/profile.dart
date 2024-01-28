import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../injection_container.dart';
import '../../application/auth_service.dart';
import '../../domain/user/user.dart';
import '../../infra/account/user_repo.dart';
import '../../theme/colors.dart';

class Profile extends HookWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService authService = locator<AuthService>();
    final UserRepository userRepository = locator<UserRepository>();

    final profile = useState<User?>(null);

    useEffect(() {
      Future<void> getProfile() async {
        final userId = authService.currentUser!.uid;
        final userInfo = await userRepository.getUser(userId);
        profile.value = userInfo;
      }

      getProfile();
      return () {};
    }, []);

    Future<void> logout() async {
      await authService.logout();
      Navigator.pushReplacementNamed(context, '/login');
    }
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Align(
          alignment: Alignment.center,
          child: Text(
            'Profile',
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(color: kcPrimaryVariant),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: screenHeightFraction(context, dividedBy: 10),
                backgroundColor: kcSecondary,
                foregroundColor: kcOnSecondary,
                child: Text(profile.value != null
                    ? '${profile.value!.name[0]}${profile.value!.surname[0]}'
                    : ""),
              ),
              verticalSpace(16),
              Text(
                profile.value != null
                    ? '${profile.value!.name} ${profile.value!.surname}'
                    : "",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kcPrimaryVariant),
              ),
              verticalSpace(48),
              Expanded(
                  child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Text(
                    'PERSONAL INFO',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kcLightSecondary),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'First Name',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcPrimaryVariant,
                                  ),
                        ),
                        Text(
                          profile.value != null ? profile.value!.name : "",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: kcLightSecondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Last Name',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcPrimaryVariant,
                                  ),
                        ),
                        Text(
                          profile.value != null ? profile.value!.surname : "",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: kcLightSecondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Car',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcPrimaryVariant,
                                  ),
                        ),
                        Text(
                          profile.value != null ? profile.value!.carId : "",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: kcSecondary,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    color: kcLightSecondary,
                  ),
                  verticalSpace(16),
                  Text(
                    'OTHER',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: kcLightSecondary),
                  ),
                  GestureDetector(
                    onTap: () => logout(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: kcSecondary,
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              Text(
                                'Logout',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: kcPrimaryVariant,
                                    ),
                              ),
                            ],
                          ),
                          Text(
                            '>',
                            style:
                                Theme.of(context).textTheme.bodyMedium!.copyWith(
                                      color: kcSecondary,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Divider(
                    color: kcLightSecondary,
                  ),
                ],
              )),
            ],
          ),
        ),
      )),
    );
  }
}
