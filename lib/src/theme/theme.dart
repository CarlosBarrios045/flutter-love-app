import 'package:flutter/material.dart';

final myTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Color(0xff201E28),
    // scaffoldBackgroundColor: Color(0xff40404C),
    iconTheme: IconThemeData(color: Colors.white.withOpacity(0.3)),
    textTheme: TextTheme(
        bodyText2: TextStyle(
            color: Colors.white.withOpacity(0.6), fontFamily: 'Abel')));
