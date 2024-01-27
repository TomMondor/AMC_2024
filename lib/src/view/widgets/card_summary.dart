import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CardSummary extends StatelessWidget {
  final IconData topIcon;
  final String titleText;
  final String descriptionText;
  final String categoryText;

  const CardSummary(
      {super.key,
      required this.topIcon,
      required this.titleText,
      required this.descriptionText,
      required this.categoryText});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.transparent,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 96,
          height: 96,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(topIcon, color: kcSecondary, size: 20),
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: kcPrimaryVariant,
                        ),
                  ),
                  Text(
                    descriptionText,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: kcPrimaryVariant,
                        ),
                  ),
                  Text(
                    categoryText,
                    style: const TextStyle(
                      color: kcLightSecondary,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
