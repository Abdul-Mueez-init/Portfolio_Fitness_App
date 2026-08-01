import 'package:flutter/widgets.dart';

/// Global spacing values used throughout the app.
///
/// Never write magic numbers like:
/// EdgeInsets.all(16)
///
/// Instead use:
/// EdgeInsets.all(AppSpacing.md)
class AppSpacing {
  AppSpacing._();

  static const double xs = 4;
  static const double sm = 8;
  static const double md = 16;
  static const double lg = 24;
  static const double xl = 32;
  static const double xxl = 48;

  static const EdgeInsets screen = EdgeInsets.symmetric(
    horizontal: lg,
    vertical: md,
  );

  static const BorderRadius cardRadius = BorderRadius.all(Radius.circular(24));

  static const BorderRadius buttonRadius = BorderRadius.all(
    Radius.circular(16),
  );
}
