import 'dart:math';

import 'package:flutter/material.dart';

abstract class DimensionScreen {
  static double get _higthDesing => 740;
  static double get _widthDesing => 360;

  static double get width {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .size
        .width;
  }

  static double get higth {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .size
        .height;
  }

  static double get scaleFactorRealDevices {
    return MediaQueryData.fromWindow(WidgetsBinding.instance!.window)
        .textScaleFactor;
  }

  static double get scaleFactor {
    return scaleFactorRealDevices <= 1.6 ? scaleFactorRealDevices : 1.6;
  }

  static double get scaleWidth => width / _widthDesing;

  static double get scaleHigth => higth / _higthDesing;

  static double get scaleText => scaleWidth;

  static double get higthStatusBar =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.top;

  static double get higthBottomBar =>
      MediaQueryData.fromWindow(WidgetsBinding.instance!.window).padding.bottom;

  static double get lengthMix {
    return max(higth, width);
  }

  static double get lengthMax {
    return min(higth, width);
  }

  static double higthStaggered(double higthWanted) {
    return higthWanted * scaleHigth;
  }

  static double widthStaggered(double widthWanted) {
    return widthWanted * scaleWidth;
  }

  static double setFont(double fontSize, {bool autoScale = false}) {
    if (autoScale) {
      return fontSize * scaleText * scaleFactor / scaleFactorRealDevices;
    }
    return (fontSize * scaleText) / scaleFactorRealDevices;
  }

  static bool get isTelaPequena => width <= 320;
  static bool get isTelaAchatada => higth <= 600 || width <= 320;
}

extension DimensionScreenExtension on num {
  double get h => DimensionScreen.higthStaggered(toDouble());
  double get w => DimensionScreen.widthStaggered(toDouble());
  double get sp => DimensionScreen.setFont(toDouble());
  double get ssp => DimensionScreen.setFont(toDouble(), autoScale: true);
}
