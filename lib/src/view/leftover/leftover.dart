import 'dart:math';

import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/leftover/leftover_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../injection_container.dart';
import '../../application/location_service.dart';
import '../../domain/place/place_model.dart';
import '../../infra/places/places_api.dart';

class Leftover extends HookWidget{
  const Leftover({super.key});

  @override
  Widget build(BuildContext context) {

    final stores = useState(<PlaceModel>[]);

    useEffect(() {
      Future<void> getNearbyMarkets() async {
        final LocationService locationService = locator<LocationService>();
        final PlacesApi placesApi = locator<PlacesApi>();

        if (await locationService.requestPermission()) {
          final location = await locationService.getCurrentLocation();
          List<PlaceModel> places = await placesApi.getNearbyStores(location.latitude, location.longitude);
          stores.value = places.sublist(0, min(places.length, 10));
        }
      }

      getNearbyMarkets();
      return () {};
    }, []);

    if (stores.value.isNotEmpty) {
      return Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Align(
                alignment: Alignment.center,
                child: Text(
                  'Leftover',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(color: kcPrimaryVariant),
                ),
              ),
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                // child: Expanded(
                child: ListView.builder(
                  itemCount: stores.value.length,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Save on near-expiration foods and help businesses reduce their food waste!',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: kcPrimaryVariant)),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 4.0),
                      child: LeftoverItem(
                        storeName: stores.value[index].name,
                        distanceToWalk: stores.value[index].distance,
                        ecoScore: Random().nextInt(5) + 1,
                      ),
                    );
                  }
                ),
              ),
            ),
          );
    } else {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Leftover',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: kcPrimaryVariant),
            ),
          ),
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      );

    }
  }
}
