import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/domain/electricity/hydro_model.dart';
import 'package:amc_2024/src/infra/http_client.dart';
// import 'package:amc_2024/src/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'dart:convert';

class HydroApi {
  final HttpClient httpClient = locator<HttpClient>();

  Future<HydroModel> getHydroData() async {
    // try { //TODO custom exception?
    final Response response = await httpClient.get('', '');
    var mappedData = jsonDecode(response.data);

    return HydroModel.fromJson(mappedData);
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
