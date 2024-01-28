import 'dart:math';

import 'package:amc_2024/injection_container.dart';
import 'package:dio/dio.dart';

import '../../domain/place/place_model.dart';
import '../http_client.dart';

class PlacesApi {
  final HttpClient httpClient = locator<HttpClient>();

  Future<List<PlaceModel>> getNearbyStores(double? latitude, double? longitude) async {
    // try { //TODO custom exception?

    const radius = 1500;
    const type = 'cafe';
    final Response response = await httpClient.get(
        "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$latitude%2C$longitude&radius=$radius&type=$type&key=AIzaSyCdpsm0p3p7HAX2B96CdyuAGblKqiB_zyk",
        '');

    Map<String, dynamic> mappedData = response.data;

    return mappedData['results'].map<PlaceModel>((place) => PlaceModel(
      name: place['name'],
      latitude: place['geometry']['location']['lat'],
      longitude: place['geometry']['location']['lng'],
      distance: double.parse(calculateDistance(latitude, longitude, place['geometry']['location']['lat'], place['geometry']['location']['lng']).toStringAsFixed(2)),
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

  double calculateDistance(lat1, lon1, lat2, lon2){
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 +
        c(lat1 * p) * c(lat2 * p) *
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a));
  }
}