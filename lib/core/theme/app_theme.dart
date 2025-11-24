import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

class AppTheme {
  static ThemeData light() => _base(
        brightness: Brightness.light,
        background: AppColors.lightSurface,
        card: Colors.white.withOpacity(0.8),
        textColor: const Color(0xFF0F172A),
      );

  static ThemeData dark() => _base(
        brightness: Brightness.dark,
        background: AppColors.darkSurface,
        card: const Color(0x66111827),
        textColor: Colors.white,
      );

  static ThemeData _base({
    required Brightness brightness,
    required Color background,
    required Color card,
    required Color textColor,
  }) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: background,
    );

    final textTheme = GoogleFonts.interTextTheme().apply(
      bodyColor: textColor,
      displayColor: textColor,
    );

    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: background,
      fontFamily: GoogleFonts.inter().fontFamily,
      textTheme: textTheme,
      useMaterial3: true,
      appBarTheme: AppBarTheme(
        backgroundColor: background.withOpacity(0.9),
        elevation: 0,
        foregroundColor: textColor,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: card,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: brightness == Brightness.dark
            ? Colors.white.withOpacity(0.06)
            : Colors.black.withOpacity(0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        ),
      ),
    );
  }
}

