import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simplesnacional_vs2/themes/theme_colors.dart';

ThemeData MyTheme = ThemeData(
  primarySwatch: ThemeColors.primaryColor,
  primaryColor: ThemeColors.primaryColor,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
    bodyLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.normal)
  ),

  splashColor: Colors.yellowAccent,
  brightness: Brightness.dark,
);
