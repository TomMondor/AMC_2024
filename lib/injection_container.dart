import 'dart:io';
import 'package:amc_2024/src/application/electricity_service.dart';
import 'package:amc_2024/src/infra/electricity/hydro_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:amc_2024/src/infra/electricity/hydro_http_client.dart';
import 'package:amc_2024/src/infra/http_client.dart';

import 'src/application/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => HydroService(hydroApi: locator()));

  //API
  locator.registerLazySingleton<HttpClient>(() => HttpClientHydro(locator()));
  locator.registerLazySingleton(() => HydroApi());

  // External
  locator.registerLazySingleton(() => Dio());
}
