import 'package:amc_2024/src/view/transport/trip.dart';

class TripsService {
  TripsService();

  List<Trip> getWalkTrips(List<Trip> trips) {
    List<Trip> walkTrips = [];
    for (Trip trip in trips) {
      if (trip.activityType == "WALKING") {
        walkTrips.add(trip);
      }
    }
    return walkTrips;
  }

  List<Trip> getBusTrips(List<Trip> trips) {
    List<Trip> busTrips = [];
    for (Trip trip in trips) {
      if (trip.activityType == "IN_BUS") {
        busTrips.add(trip);
      }
    }
    return busTrips;
  }

  List<Trip> getCarTrips(List<Trip> trips) {
    List<Trip> carTrips = [];
    for (Trip trip in trips) {
      if (trip.activityType == "VEHICLE") {
        carTrips.add(trip);
      }
    }
    return carTrips;
  }

  int computeTripsTotalLength(List<Trip> trips) {
    /* RETURNED DISTANCE IS IN METERS */
    int totalLength = 0;
    for (Trip trip in trips) {
      totalLength += trip.distanceMeters;
    }
    return totalLength;
  }

  int computeTripsTotalLengthInKm(List<Trip> trips) {
    /* RETURNED DISTANCE IS IN KILOMETERS */
    int totalLength = 0;
    for (Trip trip in trips) {
      totalLength += trip.distanceMeters;
    }
    return totalLength ~/ 1000;
  }
}
