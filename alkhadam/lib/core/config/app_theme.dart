import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Base colors
  static const primaryColor = Colors.indigo;
  static const lightBackground = Colors.white;
  static const darkBackground = Color(0xFF121212);

  // Text colors
  static const lightTextColor = Colors.black87;
  static const darkTextColor = Colors.white70;

  // Custom brand color (your color)
  static const brandColor = Color(0xFF7e2670);

  // 🌟 Custom state colors
  static const selectedColorLight = Color(0xFF3949AB);
  static const unselectedColorLight = Colors.grey;

  static const selectedColorDark = Color(0xFF90CAF9);
  static const unselectedColorDark = Colors.grey;

  // ⭐ LIGHT THEME
  static ThemeData lightTheme(Locale locale) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      fontFamily: 'Droid Arabic Kufi',
      fontFamilyFallback: const ['serif'],

      // 👇 Global System UI Overlay (Status + Nav bar)
      appBarTheme: const AppBarTheme(
        backgroundColor: brandColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: brandColor,
          systemNavigationBarColor: brandColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        brightness: Brightness.light,
      ).copyWith(
        surface: lightBackground,
        primary: selectedColorLight,
        secondary: unselectedColorLight,
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: lightTextColor),
        bodyMedium: TextStyle(color: lightTextColor),
      ),

      iconTheme: const IconThemeData(color: unselectedColorLight),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: selectedColorLight,
        unselectedItemColor: unselectedColorLight,
        backgroundColor: lightBackground,
      ),

      tabBarTheme:  const TabBarThemeData(
        labelColor: selectedColorLight,
        unselectedLabelColor: unselectedColorLight,
        indicatorColor: selectedColorLight,
      ),
    );
  }

  // ⭐ DARK THEME
  static ThemeData darkTheme(Locale locale) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      fontFamily: 'Droid Arabic Kufi',
      fontFamilyFallback: const ['serif'],

      // 👇 Global System UI Overlay (Status + Nav bar)
      appBarTheme: const AppBarTheme(
        backgroundColor: brandColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: brandColor,
          systemNavigationBarColor: brandColor,
          statusBarIconBrightness: Brightness.light,
          systemNavigationBarIconBrightness: Brightness.light,
        ),
      ),

      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: primaryColor,
        brightness: Brightness.dark,
      ).copyWith(
        surface: darkBackground,
        primary: selectedColorDark,
        secondary: unselectedColorDark,
      ),

      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: darkTextColor),
        bodyMedium: TextStyle(color: darkTextColor),
      ),

      iconTheme: const IconThemeData(color: unselectedColorDark),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: selectedColorDark,
        unselectedItemColor: unselectedColorDark,
        backgroundColor: darkBackground,
      ),

      tabBarTheme:  const TabBarThemeData(
        labelColor: selectedColorDark,
        unselectedLabelColor: unselectedColorDark,
        indicatorColor: selectedColorDark,
      ),
    );
  }
}
