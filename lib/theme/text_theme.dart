import 'package:flutter/material.dart';
import 'package:st_peters_jacobite_church_flutter/config/constants.dart';
import 'package:st_peters_jacobite_church_flutter/theme/color.dart';

TextTheme get textTheme => const TextTheme(
      displayLarge: TextStyle(
        fontSize: 99,
        fontWeight: FontWeight.w300,
        letterSpacing: -1.5,
        color: AppColors.brown41210A,
        fontFamily: AppConstants.fontBrighton,
      ),
      displayMedium: TextStyle(
        fontSize: 62,
        fontWeight: FontWeight.w300,
        letterSpacing: -0.5,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      displaySmall: TextStyle(
        fontSize: 49,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      headlineMedium: TextStyle(
        fontSize: 35,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      headlineSmall: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w400,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      titleLarge: TextStyle(
        fontSize: 21,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.15,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      titleMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.15,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.1,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      labelLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.36,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.4,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
      labelSmall: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.18,
        fontFamily: AppConstants.fontBrighton,
        color: AppColors.brown41210A,
      ),
    );

// To add custom text theme name
extension CustomStyles on TextTheme {
  TextStyle get buttonStyle {
    return const TextStyle(
      fontSize: 20,
      color: AppColors.brown41210A,
      fontFamily: AppConstants.fontBrighton,
      fontWeight: FontWeight.w700,
    );
  }

  TextStyle get error {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.red,
      fontFamily: AppConstants.fontBrighton,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get success {
    return const TextStyle(
      fontSize: 18.0,
      color: Colors.green,
      fontFamily: AppConstants.fontBrighton,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle get phoneInput {
    return const TextStyle(
      fontSize: 13,
      color: AppColors.brown41210A,
      fontFamily: AppConstants.fontBrighton,
      fontWeight: FontWeight.w500,
    );
  }
}
