import 'package:flutter/material.dart';

class TipItem extends StatelessWidget {
  final IconData iconData;
  final String titleText;
  final String descriptionText;

  const TipItem(
      {super.key,
      required this.iconData,
      required this.titleText,
      required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(iconData, color: Colors.red, size: 40.0),
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
                color: Colors.black,
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ]),
        ),
      ],
    );
  }
}
