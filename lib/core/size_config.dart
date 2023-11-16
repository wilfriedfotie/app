import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

double dimensW(double xs, {double? sm, double? md, double? lg}) {
  if (SizeConfig.screenWidth >= 1200) return lg ?? md ?? sm ?? xs;
  if (SizeConfig.screenWidth >= 800) return md ?? sm ?? xs;
  if (SizeConfig.screenWidth >= 400) return sm ?? xs;
  return xs;
}

double dimensH(double xs, {double? sm, double? md, double? lg}) {
//  print(SizeConfig.screenHeight);
  if (SizeConfig.screenHeight >= 1800) return lg ?? md ?? sm ?? xs;
  if (SizeConfig.screenHeight >= 1200) return md ?? sm ?? xs;
  if (SizeConfig.screenHeight >= 800) return sm ?? xs;
  return xs;
}

double fontSeize(double base_font_seize) {
  return base_font_seize;
}

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static double _blockSizeHWidth = 0;
  static double _blockSizeHeight = 0;

  static late double textMultiplier;
  static late double imageSizeMultiplier;
  static late double heightMultiplier;
  static late double widthMultiplier;
  static bool isPortrait = true;
  static bool isMobilePortrait = true;

  static double calcWidth(double multiplier) {
    double tmpWidth = multiplier * widthMultiplier;
    return tmpWidth;
  }

  static double calcHeight(double multiplier) {
    double tmp = multiplier * heightMultiplier;
    return tmp;
  }

  static double calcFontSize(double multiplier) {
    double tmp = multiplier * textMultiplier;
    return tmp;
  }

  void init(BoxConstraints constraints, Orientation orientation) {
    if (orientation == Orientation.portrait) {
      screenWidth = constraints.maxWidth;
      screenHeight = constraints.maxHeight;
      isPortrait = true;
      if (screenWidth < 450) {
        isMobilePortrait = true;
      } else {
        isMobilePortrait = false;
      }
    } else {
      screenWidth = constraints.maxHeight;
      screenHeight = constraints.maxWidth;
      isPortrait = false;
      isMobilePortrait = false;
    }

    _blockSizeHWidth = screenWidth / 100;
    _blockSizeHeight = screenHeight / 100;

    textMultiplier = _blockSizeHeight;
    imageSizeMultiplier = _blockSizeHWidth;
    heightMultiplier = _blockSizeHeight;
    widthMultiplier = _blockSizeHWidth;
  }
}
