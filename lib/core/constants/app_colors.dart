import 'package:flutter/material.dart';

/// Brand palette built around a dual dark/light identity.
class AppColors {
  static const Color primary = Color(0xFF4F46E5);
  static const Color secondary = Color(0xFF0EA5E9);
  static const Color accent = Color(0xFFF472B6);

  static const Color darkSurface = Color(0xFF080914);
  static const Color darkerSurface = Color(0xFF05060D);
  static const Color lightSurface = Color(0xFFF8FAFC);
  static const Color subtleWhite = Color(0xFFE2E8F0);

  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF111827), Color(0xFF0F172A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient glassGradient = LinearGradient(
    colors: [
      Color(0x66FFFFFF),
      Color(0x1FFFFFFF),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

