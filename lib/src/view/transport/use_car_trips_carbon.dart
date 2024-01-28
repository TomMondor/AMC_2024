import 'dart:convert';

import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/application/auth_service.dart';
import 'package:flutter/material.dart';

import 'package:amc_2024/src/application/carbon_footprint_service.dart';
import 'package:amc_2024/src/application/trips_service.dart';
import 'package:amc_2024/src/domain/carbon/vehicle/vehicle_model.dart';
import 'package:amc_2024/src/view/transport/use_trip_history.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../infra/account/user_repo.dart';

/* 
final carbon = useCarTripsCarbonKg();
useEffect(() => () {
      print("carbon: ${carbon.value}");
    }, [carbon.value]);
 */
ValueNotifier<double> useCarTripsCarbonKg() {
  final carbonKg = useState<double>(0.0);
  final AuthService authService = locator<AuthService>();
  final UserRepository userRepository = locator<UserRepository>();
  final CarbonFootprintService carbonFootprintService =
      locator<CarbonFootprintService>();
  final TripsService tripsService = locator<TripsService>();

  final trips = useTripHistory();

  useEffect(() {
    Future<void> getCarTripsCarbonKg() async {
      final userId = authService.currentUser!.uid;
      final userInfo = await userRepository.getUser(userId);

      int totalCarDistanceMeters = tripsService
          .computeTripsTotalLength(tripsService.getCarTrips(trips.value));

      final String carsJson =
            await rootBundle.loadString("assets/data/make_models.json");
        final Map<String, dynamic> data = await json.decode(carsJson);

      VehicleModel vehicleModel =
          await carbonFootprintService.computeVehicleCarbonFootprint(
              totalCarDistanceMeters.toDouble() / 1000, data[userInfo.carId]);
      carbonKg.value = vehicleModel.data.attributes.carbonKg;
    }

    if (trips.value.isNotEmpty) {
      getCarTripsCarbonKg();
    }
    return () {};
  }, [trips.value]);

  return carbonKg;
}
