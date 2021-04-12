import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData getTheme(TextTheme textTheme) {
  return ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.black,
    primarySwatch: Colors.grey,
    textTheme: GoogleFonts.robotoTextTheme(textTheme).copyWith(
        headline1: GoogleFonts.rubik(
          textStyle: textTheme.headline1,
          color: Colors.black,
          fontSize: 60,
          fontWeight: FontWeight.w500,
        ),
        headline2: GoogleFonts.rubik(
          textStyle: textTheme.headline2,
          color: Colors.black,
          fontSize: 50,
          fontWeight: FontWeight.w500,
        ),
        headline3: GoogleFonts.rubik(
          textStyle: textTheme.headline3,
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),
        bodyText1: GoogleFonts.roboto(
          color: Colors.black,
          fontSize: 16,
        ),
        bodyText2:
            GoogleFonts.roboto(color: Colors.black, fontSize: 16, height: 1.8),
        subtitle1: GoogleFonts.roboto(
            color: Color(0xff4D4D4D),
            fontSize: 16,
            fontWeight: FontWeight.w300),
        button: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
            letterSpacing: 3),
        subtitle2: GoogleFonts.roboto(
            color: Colors.black,
            fontWeight: FontWeight.w300,
            fontSize: 16,
            letterSpacing: 3)),
  );
}
