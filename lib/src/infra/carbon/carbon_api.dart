import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/domain/carbon/electricity/electricity_model.dart';
import 'package:amc_2024/src/domain/carbon/electricity/electricity_query.dart';
import 'package:amc_2024/src/domain/carbon/vehicle/vehicle_model.dart';
import 'package:amc_2024/src/domain/carbon/vehicle/vehicle_query.dart';
import 'package:amc_2024/src/infra/http_client.dart';
// import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:dio/dio.dart';

class CarbonApi {
  final String url = "https://www.carboninterface.com/api/v1/estimates";
  final String apiKey = "Su6jWWqaEwSUBszEgNXpYA";
  final HttpClient httpClient = locator<HttpClient>();

  Future<VehicleModel> postVehicleCarbonFootprint(
      double distanceValue, String vehicleModelId) async {
    // try { //TODO custom exception?
    Map<String, dynamic> payload = VehicleQuery(
            distanceValue: distanceValue, vehicleModelId: vehicleModelId)
        .toJson();
    final Response response = await httpClient.post(url, apiKey, data: payload);

    return VehicleModel.fromJson(response.data);
    // } on ApiException catch (e) {
    //   if (e.errorCode == 404) {
    //     throw const UserException(
    //       message: 'Hydro data not found',
    //     );
    //   }
    //   throw const UserException(
    //     message: 'Failed to fetch hydro data. Please try again.',
    //   );
    // } catch (e) {
    //   throw const UserException(
    //     message: 'Failed to retrieve the hydro data.',
    //   );
    // }
  }

  Future<ElectricityModel> postElectricityCarbonFootprint(
      String electricityUnit, double electricityValue) async {
    // try { //TODO custom exception?
    Map<String, dynamic> payload = ElectricityQuery(
            electricityUnit: electricityUnit,
            electricityValue: electricityValue)
        .toJson();
    final Response response = await httpClient.post(url, apiKey, data: payload);

    return ElectricityModel.fromJson(response.data);
    // } on ApiException catch (e) {
    //   if (e.errorCode == 404) {
    //     throw const UserException(
    //       message: 'Hydro data not found',
    //     );
    //   }
    //   throw const UserException(
    //     message: 'Failed to fetch hydro data. Please try again.',
    //   );
    // } catch (e) {
    //   throw const UserException(
    //     message: 'Failed to retrieve the hydro data.',
    //   );
    // }
  }
}
