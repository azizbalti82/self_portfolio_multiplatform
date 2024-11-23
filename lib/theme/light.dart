import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color background = Colors.white;
Color background_card = const Color(0xfff3f3f3);
Color background_card_variation = const Color(0xffe3e3e3);
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
    surfaceContainerHigh: background_card_variation,
    onSurfaceVariant: text_secondary,
    onSurface: text,

    background: background,
  ),
  cardColor: background_card,
  useMaterial3: true,
  textTheme: GoogleFonts.openSansTextTheme(),
);
