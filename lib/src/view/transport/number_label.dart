import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

class NumberLabel extends StatelessWidget {
  final int score;
  final String descriptionText;

  const NumberLabel(
      {super.key, required this.score, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedDigitWidget(
          value: score,
          textStyle: const TextStyle(
              color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        Text(
          descriptionText,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
