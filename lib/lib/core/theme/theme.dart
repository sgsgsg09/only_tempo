import 'package:flutter/material.dart';
import 'package:only_tempo/core/theme/rotataing_ring_theme_data.dart';

class AppTheme {
  // 공통 텍스트 스타일
  static const TextTheme _commonTextTheme = TextTheme(
    bodyLarge: TextStyle(
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  );

  // 공통 AppBar 스타일
  static AppBarTheme _appBarTheme(
      {required Color backgroundColor,
      required Color iconColor,
      required Color titleColor}) {
    return AppBarTheme(
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: iconColor),
      titleTextStyle: TextStyle(
        color: titleColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // 공통 ElevatedButton 스타일
  static ElevatedButtonThemeData _elevatedButtonTheme(
      Color backgroundColor, Color foregroundColor) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Light Theme
  static final ThemeData lightTheme = ThemeData(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    secondaryHeaderColor: Colors.orange,
    appBarTheme: _appBarTheme(
      backgroundColor: Colors.white,
      iconColor: Colors.orange,
      titleColor: Colors.orange,
    ),
    textTheme: _commonTextTheme.copyWith(
      displayLarge: TextStyle(
        fontSize: 50,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      bodyLarge: _commonTextTheme.bodyLarge?.copyWith(color: Colors.black),
    ),
    elevatedButtonTheme: _elevatedButtonTheme(Colors.orange, Colors.white),
    extensions: <ThemeExtension<dynamic>>[
      RotatingRingThemeData(ringColor: Colors.orange, ringThickness: 5.0),
    ],
  );

  // Dark Theme
  static final ThemeData darkTheme = ThemeData(
    primaryColor: Colors.black,
    scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
    secondaryHeaderColor: Colors.orange,
    appBarTheme: _appBarTheme(
      backgroundColor: Colors.black,
      iconColor: Colors.orange,
      titleColor: Colors.orange,
    ),
    textTheme: _commonTextTheme.copyWith(
      displayLarge: TextStyle(
        fontSize: 51,
        fontWeight: FontWeight.bold,
        color: Colors.orange,
      ),
      bodyLarge: _commonTextTheme.bodyLarge?.copyWith(color: Colors.orange),
    ),
    elevatedButtonTheme: _elevatedButtonTheme(Colors.orange, Colors.black),
    extensions: <ThemeExtension<dynamic>>[
      RotatingRingThemeData(ringColor: Colors.orange, ringThickness: 5.0),
    ],
  );
}
