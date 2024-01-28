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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              AppLocalizations.of(context)!.transport,
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
                Text(AppLocalizations.of(context)!.my_footprint,
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
                    Text(AppLocalizations.of(context)!.co2,
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
                                descriptionText:
                                    AppLocalizations.of(context)!.walk),
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
                                descriptionText:
                                    AppLocalizations.of(context)!.car),
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
                                descriptionText:
                                    AppLocalizations.of(context)!.public),
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(58),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        AppLocalizations.of(context)!.means,
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
                          child: TipItem(
                            iconData: Icons.directions_walk,
                            titleText: AppLocalizations.of(context)!.well_done,
                            descriptionText:
                                AppLocalizations.of(context)!.walked_more,
                            color: kcGold,
                          ),
                        ),
                      ),
                      TipItem(
                          iconData: Icons.directions_bus,
                          titleText: AppLocalizations.of(context)!.bus_title,
                          descriptionText:
                              AppLocalizations.of(context)!.bus_text),
                      TipItem(
                          iconData: Icons.directions_walk,
                          titleText:
                              AppLocalizations.of(context)!.savings_title,
                          descriptionText:
                              AppLocalizations.of(context)!.savings_text),
                      TipItem(
                          iconData: Icons.directions_bus,
                          titleText:
                              AppLocalizations.of(context)!.cheap_bus_title,
                          descriptionText:
                              AppLocalizations.of(context)!.cheap_bus_text),
                      TipItem(
                          iconData: Icons.local_taxi,
                          titleText: AppLocalizations.of(context)!
                              .carpool_montreal_title,
                          descriptionText: AppLocalizations.of(context)!
                              .carpool_montreal_text),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
