import 'package:blog_club/gen/fonts.gen.dart';
import 'package:flutter/material.dart';

ThemeData theme() {
  const Color primaryTextColor = Color(0xFF0D253C);
  const Color primaryColor = Color(0xFF376aed);
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
    colorScheme: const ColorScheme.light(
      primary: primaryColor,
      onPrimary: Colors.white,
      onSurface: primaryTextColor,
      onBackground: primaryTextColor,
      background: Color(0xfffbfcff),
      surface: Colors.white,
    ),
    primarySwatch: Colors.blue,
    primaryColorDark: const Color(0xFF083CC1),
    primaryColorLight: const Color(0xFF085CDB),
    scaffoldBackgroundColor: Colors.white,
    backgroundColor: const Color(0xFFF5F5F5),
    fontFamily: FontFamily.avenir,
    appBarTheme:const AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primaryTextColor,
      elevation: 0,
      titleSpacing: 32,
    ),
    snackBarTheme: const SnackBarThemeData(
      backgroundColor: primaryColor,
    ),
    textTheme: const TextTheme(
      headline1: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 36,
      ),
      headline2: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 32,
      ),
      headline3: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
      headline4: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
      headline5: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      headline6: TextStyle(
        color: primaryTextColor,
        fontFamily: FontFamily.avenir,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      bodyText1: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      bodyText2: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.normal,
        fontSize: 12,
      ),
      subtitle1: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: 14,
      ),
      subtitle2: TextStyle(
        color: primaryTextColor,
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
