import 'package:flutter/material.dart';
import 'package:phone_auth_assignment/core/utils/colors.dart';

class SElevatedButtonTheme {
  SElevatedButtonTheme._();

  static final ElevatedButtonThemeData lightElevatedButton =
  ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      backgroundColor: AppColors.primary,
      textStyle: const TextStyle(
          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
    ),
  );
}
