import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color background = const Color(0xff222222);
Color background_card = const Color(0xff353535); // Darker background card color
Color background_card_variation = const Color(0xff494949);
Color text = const Color(0xffd3d3d3); // Light gray text for dark mode
Color text_secondary = const Color(0xffa8a8a8); // Secondary text color
Color accent = const Color(0xffa486e4); // Purple accent
Color accent_secondary = const Color(0xff5933ac);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    primary: accent,
    secondary: accent_secondary,
    surface: background,
    onSurface: text, // Default text color
    surfaceContainer: background_card,
    onSurfaceVariant: text_secondary,
    surfaceContainerHigh: background_card_variation,
  ),
  cardColor: background_card,
  useMaterial3: true,
  textTheme: GoogleFonts.openSansTextTheme().apply(
    bodyColor: text, // Apply your default text color
    displayColor: text, // Apply to display texts (like headlines)
  ),
);
