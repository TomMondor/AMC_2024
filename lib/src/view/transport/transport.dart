import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:amc_2024/injection_container.dart';
import 'package:amc_2024/src/application/trips_service.dart';
import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/transport/number_label.dart';
import 'package:amc_2024/src/view/transport/tip_item.dart';
import 'package:amc_2024/src/view/transport/use_car_trips_carbon.dart';
import 'package:amc_2024/src/view/transport/use_trip_history.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Transport extends HookWidget {
  const Transport({super.key});

  @override
  Widget build(BuildContext context) {
    final carbonKgLastMonth = useCarTripsCarbonKg();

    final trips = useTripHistory();
    TripsService tripsService = locator<TripsService>();
    final walkDistance = useState(0);
    final publicDistance = useState(0);
    final carDistance = useState(0);

    useEffect(() {
      walkDistance.value = tripsService
          .computeTripsTotalLengthInKm(tripsService.getWalkTrips(trips.value));
      publicDistance.value = tripsService
          .computeTripsTotalLengthInKm(tripsService.getBusTrips(trips.value));
      carDistance.value = tripsService
          .computeTripsTotalLengthInKm(tripsService.getCarTrips(trips.value));
    }, [trips.value]);

    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Align(
            alignment: Alignment.center,
            child: Text(
              'Transport',
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
            child: Column(
              children: [
                verticalSpace(24),
                Text('My Footprint',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: kcPrimaryVariant)),
                verticalSpace(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 12.0),
                      child: AnimatedDigitWidget(
                        value: carbonKgLastMonth.value,
                        textStyle: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: kcPrimaryVariant),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.expand_less,
                          color: kcPrimary,
                          size: 40.0,
                        ),
                        Text(
                          'kg',
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: kcPrimaryVariant, fontSize: 30),
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                  child: Column(children: [
                    Text("CO2 in the last month",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: kcPrimaryVariant)),
                    verticalSpace(32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          height: 82,
                          decoration: BoxDecoration(
                            color: kcSecondary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: NumberLabel(
                                score: walkDistance.value,
                                descriptionText: 'Walk'),
                          ),
                        ),
                        Container(
                          height: 82,
                          decoration: BoxDecoration(
                            color: kcSecondary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: NumberLabel(
                                score: carDistance.value,
                                descriptionText: 'Car'),
                          ),
                        ),
                        Container(
                          height: 82,
                          decoration: BoxDecoration(
                            color: kcSecondary.withOpacity(0.8),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: NumberLabel(
                                score: publicDistance.value,
                                descriptionText: 'Public'),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(58),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'What does it mean?',
                        style: Theme.of(context).textTheme.labelLarge!.copyWith(
                              color: kcPrimaryVariant,
                            ),
                      ),
                    ),
                    verticalSpace(16),
                  ]),
                ),
                Expanded(
                  child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: kcGold,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const TipItem(
                            iconData: Icons.directions_walk,
                            titleText: 'Well done!',
                            descriptionText: 'You walked 10% more this month!',
                            color: kcGold,
                          ),
                        ),
                      ),
                      const TipItem(
                          iconData: Icons.directions_bus,
                          titleText: '38km of car to do by bus',
                          descriptionText:
                              'Some of your car trips would have been quicker by bus!'),
                      const TipItem(
                          iconData: Icons.directions_walk,
                          titleText: 'Missed \$11.50 savings!',
                          descriptionText:
                              'In the last month, these are your car trips of 2km or less, which you could have made on foot.'),
                      const TipItem(
                          iconData: Icons.directions_bus,
                          titleText: 'Cheap bus tickets',
                          descriptionText:
                              'There is a sale on the annual bus pass for students. You can save up to 50% on your bus tickets.'),
                      const TipItem(
                          iconData: Icons.local_taxi,
                          titleText: 'Carpool to Montreal',
                          descriptionText:
                              'Your calendar suggests that you are going to Montreal for AMC 2024. You can carpool with other students and save up to 275kg of CO2.'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
