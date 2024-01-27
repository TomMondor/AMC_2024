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
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          width: 110,
          height: 110,
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(topIcon, color: Colors.green, size: 25),
              const SizedBox(height: 16.0),
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
                      height: 1.2,
                    ),
                  ),
                  // SizedBox(height: 2.0),
                  Text(
                    descriptionText,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      height: 1.2,
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
