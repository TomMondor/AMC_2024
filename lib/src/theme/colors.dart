import 'package:flutter/material.dart';

const Color kcPrimary = Color(0xff0b6623);
const Color kcPrimaryVariant = Color(0xff3b4664);
const Color kcOnPrimary = Colors.white;
const Color kcSecondary = Color(0xff3bb143);
const Color kcSecondaryVariant = Color(0xff242424);
const Color kcOnSecondary = Colors.white;
const Color kcLightSecondary = Color.fromARGB(255, 160, 165, 175);
const Color kcBackground = Colors.white;
const Color kcOnBackground = kcSecondary;
const Color kcSurface = Colors.white;
const Color kcOnSurface = kcSecondary;
const Color kcError = Color(0xfffd687d);
const Color kcOnError = Colors.white;

const Color kcGold = Color(0xffEEAC14);
const Color kcPlatinum = Color(0xff7E7E7E);
Color kcShadowColor = Colors.black.withOpacity(0.15);
const Color kcPink = Color(0xffE6506C);
const Color kcRed = Color.fromARGB(255, 235, 38, 38);

const Color kcBlue = Color(0xff1338be);
const Color kcBlueLight = Color(0xff0073cf);

const ColorScheme colorScheme = ColorScheme(
  primary: kcPrimary,
  secondary: kcSecondary,
  surface: kcSurface,
  background: kcBackground,
  error: kcPrimary,
  onPrimary: kcOnPrimary,
  onSecondary: kcOnSecondary,
  onSurface: kcOnSurface,
  onBackground: kcOnBackground,
  onError: kcOnError,
  brightness: Brightness.light,
);
