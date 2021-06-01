import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum PreferredColor {
  red,
  blue,
  green,
  any,
}

class RandomColor {
  static Color defaultColor = Color.fromRGBO(110, 255, 153, 1.0);

  //generates color`s components and saves them on device
  static Future<Color> generateRandomColor(PreferredColor preferredColor) async {
    int red, green, blue;
    int maxSecondaryColorSaturation = 200;
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    switch(preferredColor){
      case PreferredColor.red:
        red = 255;
        green = _generateRandomColorComponent(maxSecondaryColorSaturation);
        blue = _generateRandomColorComponent(maxSecondaryColorSaturation);
        break;
      case PreferredColor.blue:
        red = _generateRandomColorComponent(maxSecondaryColorSaturation);
        green = _generateRandomColorComponent(maxSecondaryColorSaturation);
        blue = 255;
        break;
      case PreferredColor.green:
        red = _generateRandomColorComponent(maxSecondaryColorSaturation);
        green = 255;
        blue = _generateRandomColorComponent(maxSecondaryColorSaturation);
        break;
      case PreferredColor.any:
        red = _generateRandomColorComponent();
        green = _generateRandomColorComponent();
        blue = _generateRandomColorComponent();
        break;
    }
    await sharedPreferences.setInt('color_red', red);
    await sharedPreferences.setInt('color_green', green);
    await sharedPreferences.setInt('color_blue', blue);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  //loads saved color`s components, and uses default values instead, if it`s first start
  static Future<Color> initFirstColor() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    int red = (sharedPreferences.getInt('color_red') ?? defaultColor.red);
    int green = (sharedPreferences.getInt('color_green') ?? defaultColor.green);
    int blue = (sharedPreferences.getInt('color_blue') ?? defaultColor.blue);

    return Color.fromRGBO(red, green, blue, 1.0);
  }

  static int _generateRandomColorComponent([int max = 256]) {
    var random = new Random();
    return random.nextInt(max);
  }
}
