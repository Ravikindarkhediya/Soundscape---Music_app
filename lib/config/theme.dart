import 'package:flutter/material.dart';
import 'package:music_app/config/colors.dart';

final darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(surface: bgColor, primary: primaryColor),

    // define textTheme
    textTheme: const TextTheme(
        bodyLarge: TextStyle(
            fontFamily: "Poppins",
            fontSize: 16,
            color: fontColor,
            fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 14,
            color: labelColor,
            fontWeight: FontWeight.w400),
        bodySmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 12,
            color: labelColor,
            fontWeight: FontWeight.w400),
        labelMedium: TextStyle(
            fontFamily: "Poppins",
            fontSize: 10,
            color: labelColor,
            fontWeight: FontWeight.w500),
        labelSmall: TextStyle(
            fontFamily: "Poppins",
            fontSize: 10,
            color: labelColor,
            fontWeight: FontWeight.w400)));
