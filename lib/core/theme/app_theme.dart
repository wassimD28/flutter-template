import 'package:flutter/material.dart';
import '../constant/theme_constants.dart';
import 'color_extension.dart';

class AppTheme {
  // Light theme colors
  static const lightColors = AppColorsData(
    background: Color(0xFFFFFFFF),
    foreground: Color(0xFF000000),
    primary: Color(0xFF0070F3),
    primaryForeground: Color(0xFFFFFFFF),
    secondary: Color(0xFFF5F5F5),
    secondaryForeground: Color(0xFF111111),
    accent: Color(0xFFEC4899),
    accentForeground: Color(0xFFFFFFFF),
    muted: Color(0xFFF5F5F5),
    mutedForeground: Color(0xFF737373),
    card: Color(0xFFFFFFFF),
    cardForeground: Color(0xFF000000),
    border: Color(0xFFE5E5E5),
    input: Color(0xFFE5E5E5),
    destructive: Color(0xFFFF0000),
    destructiveForeground: Color(0xFFFFFFFF),
  );

  // Dark theme colors
  static const darkColors = AppColorsData(
    background: Color(0xFF121212),
    foreground: Color(0xFFFFFFFF),
    primary: Color(0xFF0070F3),
    primaryForeground: Color(0xFFFFFFFF),
    secondary: Color(0xFF2A2A2A),
    secondaryForeground: Color(0xFFFFFFFF),
    accent: Color(0xFFEC4899),
    accentForeground: Color(0xFFFFFFFF),
    muted: Color(0xFF2A2A2A),
    mutedForeground: Color(0xFF999999),
    card: Color(0xFF1E1E1E),
    cardForeground: Color(0xFFFFFFFF),
    border: Color(0xFF333333),
    input: Color(0xFF333333),
    destructive: Color(0xFFFF0000),
    destructiveForeground: Color(0xFFFFFFFF),
  );
  
  // Light theme
  static ThemeData light() {
    return _createTheme(lightColors);
  }
  
  // Dark theme
  static ThemeData dark() {
    return _createTheme(darkColors);
  }
  
  // Helper method to create ThemeData
  static ThemeData _createTheme(AppColorsData colors) {
    return ThemeData(
      brightness: colors.background.computeLuminance() > 0.5 
          ? Brightness.light 
          : Brightness.dark,
      primaryColor: colors.primary,
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.card,
      dividerColor: colors.border,
      colorScheme: ColorScheme(
        primary: colors.primary,
        secondary: colors.secondary,
        surface: colors.background,
        error: colors.destructive,
        onPrimary: colors.primaryForeground,
        onSecondary: colors.secondaryForeground,
        onSurface: colors.foreground,
        onError: colors.destructiveForeground,
        brightness: colors.background.computeLuminance() > 0.5 
            ? Brightness.light 
            : Brightness.dark,
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: colors.input,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: colors.border),
        ),
      ),
      extensions: [
        AppColorExtension.fromAppColorsData(colors),
      ],
    );
  }
}