import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  textTheme: TextTheme(
      bodyText1: TextStyle(
    fontSize: 30,
    fontFamily: "Roboto",
    color: Colors.white,
    shadows: [
      Shadow(
        blurRadius: 10.0,
        color: Colors.grey,
      )
    ],
  )),
);
