import 'package:flutter/material.dart';

Color background = Colors.white;
Color background_card = const Color(0xfff9f4fb);
Color background_card_2 = const Color(0xffefefef);
Color text = Colors.black;
Color text_secondary = const Color(0xff4e4e4e);
Color accent = const Color(0xFF4a3898);
Color accent_secondary = const Color(0xff5933ac);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    primary: accent,
    secondary: accent_secondary,
    surface: background,
    surfaceContainer: background_card,
    onSurfaceVariant: text_secondary,
    onSurface: text,
    background: background,
  ),
  cardColor: background_card,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: text),
    bodyMedium: TextStyle(color: text_secondary),
  ),
  fontFamily: 'Ingra',
  useMaterial3: true,
);
