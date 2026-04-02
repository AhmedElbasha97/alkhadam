import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Base colors from dohamaid.com branding
  static const primaryColor = Colors.deepPurple;
  static const lightBackground = Colors.white;
  static const darkBackground = Color(0xFF121212);

  // Text colors
  static const lightTextColor = Colors.black87;
  static const darkTextColor = Colors.white70;

  // Brand colors
  static const brandColor = Color(0xFF7E2670);
  static const brandLightColor = Color(0xFFA85D9B);

  // State colors
  static const selectedColorLight = brandColor;
  static const unselectedColorLight = Color(0xFF9E9E9E);

  static const selectedColorDark = brandLightColor;
  static const unselectedColorDark = Color(0xFFBDBDBD);

  static ThemeData lightTheme(Locale locale) {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      fontFamily: locale.languageCode == 'ar' ? 'ElMessiri' : 'NotoSans',
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
      tabBarTheme: const TabBarThemeData(
        labelColor: selectedColorLight,
        unselectedLabelColor: unselectedColorLight,
        indicatorColor: selectedColorLight,
      ),
    );
  }

  static ThemeData darkTheme(Locale locale) {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      fontFamily: locale.languageCode == 'ar' ? 'ElMessiri' : 'NotoSans',
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
      tabBarTheme: const TabBarThemeData(
        labelColor: selectedColorDark,
        unselectedLabelColor: unselectedColorDark,
        indicatorColor: selectedColorDark,
      ),
    );
  }
}
