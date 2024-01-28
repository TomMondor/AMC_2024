import 'dart:convert';

import 'package:amc_2024/src/view/transport/trip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/* Example usage :
final trips = useTripHistory();
useEffect(
  () => () {
        print("trips count: ${trips.value.length}");
        print("all trips: ${trips.value}");
      },
  [trips.value]);

 */
ValueNotifier<List<Trip>> useTripHistory([String timePeriod = "sept_2022"]) {
  final trips = useState<List<Trip>>(List<Trip>.empty());

  useEffect(() {
    Future<void> readJson() async {
      final String response =
          await rootBundle.loadString("assets/data/segments_$timePeriod.json");
      final List<dynamic> data = await json.decode(response);

      List<Trip> temp = [];
      for (var element in data) {
        Trip trip = Trip.fromJson(element);
        temp.add(trip);
      }

      trips.value = temp;
    }

    readJson();

    return () {};
  }, const []);

  return trips;
}
