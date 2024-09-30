import 'package:flutter/material.dart';

class ThemeColors {
//Primary Neutral Palette
  static MaterialColor get primary => const MaterialColor(0xFFEA7E41, {
        50: Color(0xffFFFFFF),
        100: Color(0xffFDEFD9),
        200: Color(0xffFCDBB3),
        300: Color(0xffF8C18C),
        400: Color(0xffF2A66F),
        500: Color(0xffEA7E41),
        600: Color(0xffC95D2F),
        700: Color(0xffA84020),
        800: Color(0xff872814),
        900: Color(0xff70170C)
      });

  //Success
  static MaterialColor get success => const MaterialColor(0xFF12B3A8, {
        100: Color(0xffCEFBE7),
        200: Color(0xff9EF7D9),
        300: Color(0xff6AE8C9),
        400: Color(0xff44D1BB),
        500: Color(0xff12B3A8),
        600: Color(0xff0D9699),
        700: Color(0xff097380),
        800: Color(0xff055467),
        900: Color(0xff033D55)
      });

  //Error
  static MaterialColor get error => const MaterialColor(0xFFC65468, {
        100: Color(0xffFCE4DF),
        200: Color(0xffF9C6BF),
        300: Color(0xffED9C9B),
        400: Color(0xffDC7D85),
        500: Color(0xffC65468),
        600: Color(0xffAA3D5A),
        700: Color(0xff8E2A4E),
        800: Color(0xff721A43),
        900: Color(0xff5F103B)
      });

  //Warning
  static MaterialColor get warning => const MaterialColor(0xffECAC31, {
        100: Color(0xffFEF5D5),
        200: Color(0xffFDEAAC),
        300: Color(0xffF9D982),
        400: Color(0xffF3C762),
        500: Color(0xffECAC31),
        600: Color(0xffCA8B23),
        700: Color(0xffA96E18),
        800: Color(0xff88520F),
        900: Color(0xff713F09)
      });

  //Information
  static MaterialColor get information => const MaterialColor(0xff4D81E7, {
        100: Color(0xffDBECFD),
        200: Color(0xffB9D6FC),
        300: Color(0xff94BDF7),
        400: Color(0xff78A5F0),
        500: Color(0xff4D81E7),
        600: Color(0xff3863C6),
        700: Color(0xff2A60B7),
        800: Color(0xff183285),
        900: Color(0xff0E216E)
      });

  //Secondary
  static MaterialColor get secondary => const MaterialColor(0xff1A1C1E, {
        100: Color(0xffEDF1F3),
        200: Color(0xffDCE4E8),
        300: Color(0xffACB5BB),
        400: Color(0xff6C7278),
        500: Color(0xff1A1C1E),
        600: Color(0xff131619),
        700: Color(0xff0D1015),
        800: Color(0xff080B11),
        900: Color(0xff04070E)
      });

  static const tableHeaderColor = Color(0xffF2F5F7);

  // //Error
  // static MaterialColor get success => const MaterialColor(0xFF, {
  //       100: Color(0xff),
  //       200: Color(0xff),
  //       300: Color(0xff),
  //       400: Color(0xff),
  //       500: Color(0xff),
  //       600: Color(0xff),
  //       700: Color(0xff),
  //       800: Color(0xff),
  //       900: Color(0xff)
  //     });
}
