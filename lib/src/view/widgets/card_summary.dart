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
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Container(
          width: 100,
          height: 90,
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(topIcon, color: Colors.green, size: 21),
              const SizedBox(height: 8.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                  ),
                  Text(
                    descriptionText,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      height: 1,
                    ),
                  ),
                  Text(
                    categoryText,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0,
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
