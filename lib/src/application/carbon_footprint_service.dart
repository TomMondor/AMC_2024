import 'package:amc_2024/src/domain/carbon/electricity/electricity_model.dart';
import 'package:amc_2024/src/domain/carbon/vehicle/vehicle_model.dart';
import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:amc_2024/src/infra/carbon/carbon_api.dart';

class CarbonFootprintService {
  final CarbonApi carbonApi;

  CarbonFootprintService({required this.carbonApi});

  Future<VehicleModel> computeVehicleCarbonFootprint(
      double distanceValue, String vehicleModelId) async {
    try {
      return await carbonApi.postVehicleCarbonFootprint(
          distanceValue, vehicleModelId);
    } on ApiException {
      rethrow; //TODO display error message
    }
  }

  Future<ElectricityModel> computeElectricityCarbonFootprint(
      String electricityUnit, double electricityValue) async {
    try {
      return await carbonApi.postElectricityCarbonFootprint(
          electricityUnit, electricityValue);
    } on ApiException {
      rethrow; //TODO display error message
    }
  }
}
