
import 'dart:convert';

import 'package:amc_2024/injection_container.dart';
import 'package:dio/dio.dart';

import '../../domain/place/place_model.dart';
import '../http_client.dart';

class PlacesApi {
  final HttpClient httpClient = locator<HttpClient>();

  Future<List<PlaceModel>> getNearbyStores(double? latitude, double? longitude) async {
    // try { //TODO custom exception?

    const radius = 1500;
    const type = 'marketplace';
    final Response response = await httpClient.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude%2C$longitude&radius=$radius&type=$type&key=AIzaSyCdpsm0p3p7HAX2B96CdyuAGblKqiB_zyk",
        '');
    var mappedData = jsonDecode(response.data);

    return mappedData['results'].map<PlaceModel>((place) => PlaceModel(
      name: place['name'],
      latitude: place['geometry']['location']['lat'],
      longitude: place['geometry']['location']['lng'],
    )).toList();

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