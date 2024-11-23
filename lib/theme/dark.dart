import 'package:flutter/material.dart';

Color background = const Color(0xff222222);
Color background_card = const Color(0xff444444); // Darker background card color
Color background_card_2 = const Color(0xff3e3e3e); // Darker alternative background color
Color text = Colors.white;
Color text_secondary = const Color(0xffa8a8a8); // Lighter text color for dark theme
Color accent = const Color(0xffa378ef);
Color accent_secondary = const Color(0xff5933ac);

ThemeData darkTheme = ThemeData.dark().copyWith(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: accent,
    secondary: accent_secondary,
    surface: background,
    surfaceContainer: background_card,
    onSurfaceVariant: text_secondary,
    onSurface: text,
  ),
  cardColor: background_card, // Use dark background card color
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: text),
    bodyMedium: TextStyle(color: text_secondary),
    bodySmall: TextStyle(color: text_secondary),
  ),
);
