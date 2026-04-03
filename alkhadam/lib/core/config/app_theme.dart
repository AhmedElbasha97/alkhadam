import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  // Base colors from dohamaid.com branding
  static const primaryColor = MaterialColor(0xFF6A1B9A, <int, Color>{
    50: Color(0xFFEAD8F3),
    100: Color(0xFFD3B0E7),
    200: Color(0xFFBC88DB),
    300: Color(0xFFA560CF),
    400: Color(0xFF8F38C3),
    500: Color(0xFF6A1B9A),
    600: Color(0xFF5E188A),
    700: Color(0xFF53167A),
    800: Color(0xFF47136A),
    900: Color(0xFF3B105A),
  });
  static const lightBackground = Colors.white;
  static const darkBackground = Color(0xFF121212);

  // Text colors
  static const lightTextColor = Colors.black87;
  static const darkTextColor = Colors.white70;

  // Brand colors
  static const brandColor = Color(0xFF6A1B9A);
  static const accentColor = Color(0xFF0E8982);
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
        secondary: accentColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: lightTextColor),
        bodyMedium: TextStyle(color: lightTextColor),
      ),
      iconTheme: const IconThemeData(color: accentColor),
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
        secondary: accentColor,
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: darkTextColor),
        bodyMedium: TextStyle(color: darkTextColor),
      ),
      iconTheme: const IconThemeData(color: accentColor),
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
