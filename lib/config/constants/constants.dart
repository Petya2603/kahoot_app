import 'package:flutter/material.dart';

class Assets {
  static const String nextbutton = 'assets/images/buttonnext.png';
  static const String starttest = 'assets/images/starttest.png';
  static const String quize = 'assets/images/quize.png';
  static const String left = 'assets/images/left.png';
  static const String right = 'assets/images/right.png';
  static const String pencil = 'assets/images/pencil.png';
  static const String check = 'assets/images/check.png';
}

class Fonts {
  static const String gilroyBold = 'GilroyBold';
  static const String gilroySemiBold = 'GilroySemiBold';
  static const String gilroyMedium = 'GilroyMedium';
  static const String gilroyRegular = 'GilroyRegular';
}

class BorderRadii {
  static const BorderRadius borderRadius5 =
      BorderRadius.all(Radius.circular(5));
  static const BorderRadius borderRadius10 =
      BorderRadius.all(Radius.circular(10));
  static const BorderRadius borderRadius15 =
      BorderRadius.all(Radius.circular(15));
  static const BorderRadius borderRadius20 =
      BorderRadius.all(Radius.circular(20));
  static const BorderRadius borderRadius25 =
      BorderRadius.all(Radius.circular(25));
  static const BorderRadius borderRadius30 =
      BorderRadius.all(Radius.circular(30));
  static const BorderRadius borderRadius40 =
      BorderRadius.all(Radius.circular(35));
  static const BorderRadius borderRadius35 =
      BorderRadius.all(Radius.circular(40));

  static const BorderRadius borderRadius50 =
      BorderRadius.all(Radius.circular(50));
}

class AppColors {
  static const Color background = Color.fromRGBO(70, 23, 143, 1);
  static const Color orange = Color.fromRGBO(255, 144, 81, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);
  static const Color blue = Color.fromRGBO(170, 141, 255, 1);
  static const Color red = Color.fromRGBO(173, 38, 41, 1);
  static const Color black = Color.fromRGBO(36, 35, 35, 1);
  static const Color yellow = Color.fromRGBO(237, 248, 21, 1);
  static const Color gold = Color.fromRGBO(255, 255, 0, 1);
}

List<Color> colors = [
  const Color.fromARGB(255, 225, 13, 48),
  const Color.fromARGB(255, 9, 89, 203),
  const Color.fromARGB(255, 213, 150, 0),
  const Color.fromARGB(255, 20, 107, 4),
];

List<Widget> shapes = [
  const Icon(Icons.change_history, color: Colors.white, size: 24),
  const Icon(Icons.diamond, color: Colors.white, size: 24),
  const Icon(Icons.circle, color: Colors.white, size: 24),
  const Icon(Icons.square, color: Colors.white, size: 24),
];
