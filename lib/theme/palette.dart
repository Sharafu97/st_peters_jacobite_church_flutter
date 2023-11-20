import 'package:flutter/material.dart';

class Palette {
  static MaterialColor kToDark = const MaterialColor(
    0XFF42210B, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xff553723), //10%
      100: Color(0xff684d3c), //20%
      200: Color(0xff7b6454), //30%
      300: Color(0xff8e7a6d), //40%
      400: Color(0xffa19085), //50%
      500: Color(0xffb3a69d), //60%
      600: Color(0xffc6bcb6), //70%
      700: Color(0xffd9d3ce), //80%
      800: Color(0xffece9e7), //90%
      900: Color(0xffffffff), //100%
    },
  );
}
