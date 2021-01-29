import 'package:flutter/material.dart';
import 'package:flutter_base_structure/constants/font_family.dart';

ThemeData get lightTheme => ThemeData(
      fontFamily: FontFamily.productSans,
      primarySwatch: Colors.teal,
      accentColor: Colors.deepPurpleAccent,
      brightness: Brightness.light,
      scaffoldBackgroundColor: Color(0xFFecf0f1),
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

ThemeData get darkTheme => ThemeData(
      fontFamily: FontFamily.productSans,
      primarySwatch: Colors.teal,
      accentColor: Colors.tealAccent,
      brightness: Brightness.dark,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
