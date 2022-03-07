import 'package:blog_club/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  const Color primaryColor = Color(0xFF0D253C);
  return ThemeData(
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
            fontFamily: FontFamily.avenir,
          ),
        ),
      ),
    ),
    primaryColor: primaryColor,
    primarySwatch: Colors.blue,
    primaryColorDark: const Color(0xFF083CC1),
    primaryColorLight: const Color(0xFF085CDB),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: FontFamily.avenir,
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline3: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w700,
        fontSize: 18,
      ),
      headline4: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      headline5: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline6: TextStyle(
        color: primaryColor,
        fontFamily: FontFamily.avenir,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: primaryColor,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      caption: TextStyle(
        color: Color(0xff7b8bb2),
        fontWeight: FontWeight.w700,
        fontFamily: FontFamily.avenir,
        fontSize: 10,
      ),
    ),
  );
}
