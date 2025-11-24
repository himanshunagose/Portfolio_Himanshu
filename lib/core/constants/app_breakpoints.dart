/// Centralized responsive breakpoints used across the UI.
class Breakpoints {
  static const double mobile = 480;
  static const double tablet = 768;
  static const double desktop = 1100;
  static const double ultraWide = 1600;

  static bool isMobile(double width) => width < tablet;
  static bool isTablet(double width) => width >= tablet && width < desktop;
  static bool isDesktop(double width) => width >= desktop && width < ultraWide;
  static bool isUltraWide(double width) => width >= ultraWide;
}

