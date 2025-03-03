// theme_constants.dart
// This file contains all UI-related constants to maintain consistent branding throughout the app

import 'package:flutter/material.dart';

class AppTheme {
  // Primary brand colors
  static const Color primaryColor = Color(0xFFFFFFFF); // Main brand color
  static const Color secondaryColor = Color(0xFF191919); // Accent color
  static const Color backgroundColor = Color(0xFF000000); // Background color

  // Text colors
  static const Color textPrimaryColor = Color(0xFFFFFFFF); // Primary text
  static const Color textSecondaryColor = Color(0xFFC2C2C2); // Secondary text
  static const Color textLightColor =
      Color(0xFF000000); // Light text (for dark backgrounds)

  // Success, warning, error colors
  static const Color successColor = Color(0xFF4CAF50);
  static const Color warningColor = Color(0xFFFFC107);
  static const Color errorColor = Color(0xFFE53935);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF191919), Color(0xFF000000)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Text styles
  // Heading styles - large
  static const TextStyle headingLarge = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: textPrimaryColor,
    fontFamily: 'RedditSans',
  );
  
  // Heading styles - medium
  static const TextStyle headingMedium = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    fontFamily: 'RedditSans',
  );
  
  // Heading styles - small
  static const TextStyle headingSmall = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: textPrimaryColor,
    fontFamily: 'RedditSans',
  );

  // Body styles - large
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    color: textPrimaryColor,
    fontFamily: 'RedditSans',
  );
  
  // Body styles - medium
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    color: textPrimaryColor,
    fontFamily: 'RedditSans',
  );
  
  // Body styles - small
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12.0,
    color: textSecondaryColor,
    fontFamily: 'RedditSans',
  );

  // Button styles
  static const ButtonStyle primaryButtonStyle = ButtonStyle(
    padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
    backgroundColor: WidgetStatePropertyAll<Color>(primaryColor),
    foregroundColor: WidgetStatePropertyAll<Color>(textLightColor),
    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)))),
  );

  static const ButtonStyle secondaryButtonStyle = ButtonStyle(
    padding: WidgetStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 24, vertical: 12)),
    backgroundColor: WidgetStatePropertyAll<Color>(Colors.transparent),
    foregroundColor: WidgetStatePropertyAll<Color>(primaryColor),
    shape:
        WidgetStatePropertyAll<RoundedRectangleBorder>(RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8)),
      side: BorderSide(color: primaryColor, width: 1.5),
    )),
  );

  // Spacing constants
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border radius
  static const double borderRadiusSmall = 4.0;
  static const double borderRadiusMedium = 8.0;
  static const double borderRadiusLarge = 16.0;

  // Shadow
  static const List<BoxShadow> lightShadow = [
    BoxShadow(
      color: Color(0x1A000000),
      blurRadius: 4,
      offset: Offset(0, 2),
    ),
  ];

  static const List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Color(0x1F000000),
      blurRadius: 8,
      offset: Offset(0, 4),
    ),
  ];

  // Theme data that can be used directly with MaterialApp
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: secondaryColor,
        error: errorColor,
        surface: backgroundColor,
      ),
      scaffoldBackgroundColor: backgroundColor,
      fontFamily: 'RedditSans',
      textTheme: const TextTheme(
        displayLarge: headingLarge,
        displayMedium: headingMedium,
        displaySmall: headingSmall,
        bodyLarge: bodyLarge,
        bodyMedium: bodyMedium,
        bodySmall: bodySmall,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryColor,
        foregroundColor: textLightColor,
      ),
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: primaryButtonStyle,
      ),
      outlinedButtonTheme: const OutlinedButtonThemeData(
        style: secondaryButtonStyle,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusMedium)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(borderRadiusMedium)),
          borderSide: BorderSide(color: primaryColor, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}
