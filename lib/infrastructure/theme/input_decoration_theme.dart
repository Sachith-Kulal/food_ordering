import 'package:flutter/material.dart';
import 'package:food_ordering/infrastructure/theme/app_colors.dart';

class InputDecorationThemes {
    static InputDecorationTheme light = InputDecorationTheme(
      labelStyle: const TextStyle(
        color: Color(0xFF57636C),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      hintStyle: const TextStyle(
        color: Color(0xFF57636C),
        fontSize: 14,
        fontWeight: FontWeight.normal,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
          color: AppColors.secondaryText
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          width: 1,
            color: AppColors.tertiary
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.secondaryText,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: const BorderSide(
          color: AppColors.tertiary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.fromLTRB(20, 24, 20, 24),
    );

}