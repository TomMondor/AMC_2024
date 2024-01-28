import 'package:amc_2024/src/theme/colors.dart';
import 'package:amc_2024/src/view/leftover/leftover_label.dart';
import 'package:flutter/material.dart';

class LeftoverItem extends StatelessWidget {
  final double _borderRadius = 20.0;

  final String storeName;
  final double distanceToWalk;
  final double ecoScore;

  const LeftoverItem(
      {super.key, required this.storeName, required this.distanceToWalk, required this.ecoScore});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.transparent,
      elevation: 5.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius)),
      child: Container(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    storeName,
                    style: TextStyle(
                        color: kcSecondary,
                        fontSize: 25.0,
                        fontWeight: FontWeight.w800),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.directions_walk),
                          Text("$distanceToWalk Km")
                        ],
                      ),
                      VerticalDivider(),
                      Row(
                        children: [
                          Icon(Icons.energy_savings_leaf),
                          Text("$ecoScore")
                        ],
                      )
                    ],
                  )
                ],
              ),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  LeftoverLabel(productType: ProductType.meat),
                  LeftoverLabel(productType: ProductType.fruit),
                  LeftoverLabel(productType: ProductType.fish),
                ],
              ),
            ],
          )),
    );
  }
}
