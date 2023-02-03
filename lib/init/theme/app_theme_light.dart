// ignore_for_file: unnecessary_null_comparison, prefer_conditional_assignment

import 'package:flutter/material.dart';
import 'package:etimology/core/utils/colors.dart';

mixin AppThemeLight implements ThemeData {
  //ackgroundColor: Colors.grey.shade100,
  static ThemeData theme = ThemeData(
    backgroundColor: UIColor.backgroundColor,
    appBarTheme: const AppBarTheme(
      toolbarHeight: 100,
      backgroundColor: UIColor.mainTheme,
      elevation: 0,
      centerTitle: true,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      elevation: 0,
    ),
    scaffoldBackgroundColor: Colors.grey.shade200,
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.normal,
        color: UIColor.black,
      ),
      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: UIColor.black,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: UIColor.black,
      ),
      displaySmall: TextStyle(
        fontSize: 16,
        color: UIColor.textWhite,
        fontWeight: FontWeight.w400,
      ),
      displayMedium: TextStyle(
          color: UIColor.textWhite,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      displayLarge: TextStyle(
          color: UIColor.textWhite,
          fontSize: 24,
          fontWeight: FontWeight.w900),
    ),
  );
}
