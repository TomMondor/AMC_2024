import 'package:amc_2024/src/application/carbon_footprint_service.dart';
import 'package:amc_2024/src/application/electricity_service.dart';
import 'package:amc_2024/src/application/location_service.dart';
import 'package:amc_2024/src/infra/account/user_repo.dart';
import 'package:amc_2024/src/application/trips_service.dart';
import 'package:amc_2024/src/infra/carbon/carbon_api.dart';
import 'package:amc_2024/src/infra/electricity/hydro_api.dart';
import 'package:amc_2024/src/infra/places/places_api.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:amc_2024/src/infra/http_client.dart';

import 'src/application/auth_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => HydroService(hydroApi: locator()));
  locator.registerLazySingleton(
      () => CarbonFootprintService(carbonApi: locator()));
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => TripsService());

  //API
  locator.registerLazySingleton<HttpClient>(() => HttpClientImpl(locator()));
  locator.registerLazySingleton(() => HydroApi());
  locator.registerLazySingleton(() => CarbonApi());
  locator.registerLazySingleton(() => PlacesApi());

  // External
  locator.registerLazySingleton(() => Dio());

  // Repository
  locator.registerLazySingleton(() => UserRepository());
}
