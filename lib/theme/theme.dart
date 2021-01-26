import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jd_web/theme/colors.dart';

ThemeData theme = ThemeData(
    appBarTheme: AppBarTheme(
      color: JDColors.offBlue,
    ),
    primaryColor: JDColors.offBlue,
    accentColor: Colors.white,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: Colors.black,
    canvasColor: JDColors.offBlue,
    textTheme: GoogleFonts.latoTextTheme()
        .apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        )
        .copyWith(
          bodyText1: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
          bodyText2:
              TextStyle(color: Colors.white, height: 1.6, letterSpacing: 1),
        ),
    buttonTheme: ButtonThemeData(
      textTheme:
          ButtonTextTheme.accent, //  <-- this auto selects the right color
    ));
