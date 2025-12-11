import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';

const double defaultPadding=20.0;
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
/*
class AppTheme {
  // 🌞 Light Theme
  static ThemeData light() => _base(
    brightness: Brightness.light,
    background: const Color(0xFFF7F8FA),
    surface: Colors.white,
    glass: Colors.white.withOpacity(0.7),
    textColor: const Color(0xFF0F172A),
  );

  // 🌚 Dark Theme
  static ThemeData dark() => _base(
    brightness: Brightness.dark,
    background: const Color(0xFF0B0F19),
    surface: const Color(0xFF151B28),
    glass: Colors.white.withOpacity(0.08),
    textColor: Colors.white,
  );

  static ThemeData _base({
    required Brightness brightness,
    required Color background,
    required Color surface,
    required Color glass,
    required Color textColor,
  }) {
    final colorScheme = ColorScheme(
      brightness: brightness,
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      background: background,
      surface: surface,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onBackground: textColor,
      onSurface: textColor,
      error: Colors.redAccent,
      onError: Colors.white,
    );

    final textTheme = GoogleFonts.poppinsTextTheme().apply(
      bodyColor: textColor,
      displayColor: textColor,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      scaffoldBackgroundColor: background,
      colorScheme: colorScheme,

      // Typography
      textTheme: textTheme,

      // Appbar
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: background.withOpacity(0.8),
        foregroundColor: textColor,
        surfaceTintColor: Colors.transparent,
        titleTextStyle: GoogleFonts.poppins(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),

      // Cards (Glass Effect)
      cardTheme: CardThemeData(
        color: glass,
        elevation: 6,
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),

      // Input Fields
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor:
        brightness == Brightness.dark ? Colors.white10 : Colors.black.withOpacity(0.04),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: AppColors.primary, width: 1.3),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: TextStyle(color: textColor.withOpacity(0.5)),
      ),

      // Buttons
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),

      // Elevated Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          elevation: 6,
          shadowColor: AppColors.primary.withOpacity(0.3),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        ),
      ),

      // Icon Theme
      iconTheme: IconThemeData(
        color: textColor,
        size: 22,
      ),

      // Floating Action Button
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 4,
      ),

      // Navigation bar
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: surface.withOpacity(0.6),
        elevation: 6,
        indicatorColor: AppColors.primary.withOpacity(0.2),
        iconTheme: MaterialStateProperty.all(IconThemeData(color: textColor)),
        labelTextStyle: MaterialStateProperty.all(
          GoogleFonts.poppins(fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}*/

