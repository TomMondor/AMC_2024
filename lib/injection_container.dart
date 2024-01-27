import 'dart:io';

import 'package:get_it/get_it.dart';

import 'src/application/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => AuthService());

  //API
  // locator.registerLazySingleton<HttpClient>(() => HttpClientImpl(locator()));
}
