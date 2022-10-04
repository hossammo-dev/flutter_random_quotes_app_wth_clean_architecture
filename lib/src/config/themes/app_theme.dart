import 'package:flutter/material.dart';

import '../../core/utils/colors/colors_manager.dart';

ThemeData get appTheme => ThemeData(
      primaryColor: ColorsManager.primaryColor,
      hintColor: ColorsManager.hintColor,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorsManager.scaffoldBackgroundColor,

      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: ColorsManager.black,
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),

      textTheme: TextTheme(
        bodyLarge: const TextStyle(
          color: ColorsManager.black,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
        bodyMedium: TextStyle(
          color: ColorsManager.hintColor,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        displayMedium: const TextStyle(
          color: ColorsManager.white,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
