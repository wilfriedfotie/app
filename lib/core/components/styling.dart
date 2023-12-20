import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  static const Color primaryColor = Color(0xff58CC02);
  static const Color primaryLightColor = Color(0xffD7FFB8);
  static const Color secondaryColor = Color(0xff58A700);
  static const Color secondaryLightBg = Color(0xff84D8FF);

  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color blackColor = Color(0xff000000);
  static const Color grayColor = Color(0xffAFAFAF);
  static const Color textBlackColor = Color(0xff3C3C3C);
  static const Color textBlackV2Color = Color(0xff4B4B4B);
  static const Color borderColor = Color(0xffAFAFAF);
  static const Color textBlueColor = Color(0xff1CB0F6);
  static const Color blueColor = Color(0xff1CB1FB);
  static const Color blueLightColor = Color(0xffDDF4FF);
  static const Color scaffoldBgColor = Color(0xffFCF6F4);
  static const Color in_coming_msg = Color(0xffC9F0D8);
  static const Color out_coming_msg = Color(0xffF4F8FB);

  static const Color errorColor = Color(0xffFF4B4B);
  static const Color warningColor = Color(0xffFFD900);
  static const Color successColor = Color(0xff58CC02);
  static const Color formationCardColor = Color(0xffEBEBA1);

  // defined theme
  static final ThemeData lightTheme = ThemeData(
    fontFamily: GoogleFonts.nunito().fontFamily,
    primaryColor: primaryColor,
    textTheme: TextTheme(
      displaySmall:  TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      bodyLarge:  TextStyle(fontSize: 16, fontWeight: FontWeight.w600,color: Colors.black),
    ),
    primaryColorLight: primaryLightColor,
    primaryColorDark: secondaryColor,
    brightness: Brightness.light,
  );

  static Map<int, Color> _primarlySwatchMap = {
    50: Color(0xff1899D6),
  };
  static MaterialColor _primarlySwatch = MaterialColor(50, _primarlySwatchMap);
}
