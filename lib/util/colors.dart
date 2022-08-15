import 'package:flutter/material.dart';

Color geemBlue = const Color.fromARGB(255, 1, 234, 255);
Color geemBlackBlue = const Color.fromRGBO(42, 45, 84, 1);
Color geemBlack = const Color.fromRGBO(35, 38, 50, 1);
Color geemLightBlue = const Color.fromRGBO(128, 225, 243, 1);
Color geemYellow = const Color.fromRGBO(247, 229, 125, 1);
Color geemPeach = const Color.fromRGBO(249, 185, 151, 1);
Color geemSkyBlue = const Color.fromARGB(255, 7, 100, 175);
Color geemSkyBlue2 = const Color.fromARGB(255, 70, 204, 248);
Color geemSnowWhite = const Color.fromARGB(255, 234, 237, 240);
Color geemSnowWhite2 = const Color.fromARGB(255, 167, 187, 196);
Color geemNightColor = const Color.fromRGBO(42, 45, 84, 1);
Color geemNightColor2 = const Color.fromRGBO(35, 38, 50, 1);

List<Color> sunnyColor = [geemYellow, geemPeach];
List<Color> rainyColor = [geemSkyBlue2, geemSkyBlue];
List<Color> cloudyColor = [geemBlue, geemLightBlue];
List<Color> snowyColor = [geemSnowWhite, geemSnowWhite2];
List<Color> nightColor = [geemNightColor, geemNightColor2];

Color appColor = Colors.white;

List<Color> appGradientColor = [Colors.white, Colors.grey];

setNightColor() {
  appGradientColor = nightColor;
  appColor = geemNightColor;
}


