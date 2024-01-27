import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class CardCarbon extends StatelessWidget {
  final int score;
  final double _borderRadius = 20.0;

  const CardCarbon({super.key, required this.score});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(_borderRadius),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: Image.asset(
                'assets/images/carbon_score_background.png',
                // Replace with the path to your local image
                width: double.infinity,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
                top: 50.0,
                left: 16.0,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: AnimatedDigitWidget(
                        value: score,
                        textStyle: const TextStyle(
                            color: Colors.green,
                            fontSize: 75.0,
                            fontWeight: FontWeight.bold,
                            height: 0.9),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Your carbon\nprint",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
