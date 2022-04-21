import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeConstants {
  static ThemeData theme = ThemeData(
    primaryColor: primaryColor,
    backgroundColor: secondaryColor,
  ).copyWith(
    textTheme: GoogleFonts.manropeTextTheme(),
    splashFactory: NoSplash.splashFactory,
  );

  //COLORS
  static const Color primaryColor = Color.fromRGBO(216, 23, 54, 1);
  static const Color secondaryColor = Color.fromRGBO(17, 69, 129, 1);

  //SIZES
  static const double maxWidth = 1325;
  static const double iconSize = 30;

  //PADDINGS
  static const EdgeInsets headerPaddingMobile = EdgeInsets.symmetric(vertical: 15, horizontal: 20);
  static const EdgeInsets headerPaddingDesktop = EdgeInsets.symmetric(vertical: 20, horizontal: 20);
  static const EdgeInsets menuItemPadding = EdgeInsets.symmetric(vertical: 10);
  static const EdgeInsets tabRowItemPadding = EdgeInsets.only(left: 40);
  static const EdgeInsets filledButtonPadding = EdgeInsets.symmetric(horizontal: 30, vertical: 15);

  //DURATIONS
  static const Duration menuDuration = Duration(milliseconds: 200);
  static const Duration hoverDuration = Duration(milliseconds: 400);
}
