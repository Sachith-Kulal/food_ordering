
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'input_decoration_theme.dart';

class AppThemes {
  static ThemeData light = ThemeData(
      primaryColor: AppColors.primaryColor,
    canvasColor: AppColors.canvasColor,
      inputDecorationTheme: InputDecorationThemes.light,
      elevatedButtonTheme: ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.buttonColor,
        disabledBackgroundColor: AppColors.buttonColor,
        padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 18),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25)),
        ),
        textStyle: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        )
      )
      )
  );

}