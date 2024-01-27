import 'dart:ui';

import 'package:amc_2024/helpers/ui_helpers.dart';
import 'package:flutter/material.dart';

import '../../theme/colors.dart';

class BottomButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  final Color? color;

  const BottomButton({
    Key? key,
    required this.onPressed,
    required this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: screenWidth(context),
      height: 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: kcOnPrimary,
            backgroundColor: color ?? kcPrimary,
            minimumSize: Size(screenWidth(context), 52),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            textStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: kcOnPrimary),
          ),
          onPressed: onPressed,
          child: Text(
            title.toUpperCase(),
          )),
    );
  }
}
