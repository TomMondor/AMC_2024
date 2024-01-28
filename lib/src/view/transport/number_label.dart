import 'package:animated_digit/animated_digit.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class NumberLabel extends StatelessWidget {
  final int score;
  final String descriptionText;

  const NumberLabel(
      {super.key, required this.score, required this.descriptionText});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            AnimatedDigitWidget(
              value: score,
              textStyle: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: kcPrimaryVariant,
                  ),
            ),
            Text(
              ' km',
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: kcPrimaryVariant,
                  ),
            ),
          ],
        ),
        Text(
          descriptionText,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: kcPrimaryVariant,
              ),
        ),
      ],
    );
  }
}
