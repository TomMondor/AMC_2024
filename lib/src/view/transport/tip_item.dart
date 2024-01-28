import 'package:amc_2024/src/theme/colors.dart';
import 'package:flutter/material.dart';

class TipItem extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final String descriptionText;
  final Color color;

  const TipItem(
      {super.key,
      required this.iconData,
      required this.titleText,
      required this.descriptionText,
      this.color = kcSecondary});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(iconData, color: color, size: 40.0),
          const SizedBox(width: 8.0),
          Flexible(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                titleText,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                descriptionText,
                style: const TextStyle(
                  color: kcLightSecondary,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
