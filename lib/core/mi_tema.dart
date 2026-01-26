import 'package:flutter/material.dart';
import 'package:material/core/colores_app.dart';
import 'package:google_fonts/google_fonts.dart';

final miTema = ThemeData(
  primaryColor: ColoresApp.primaryColor,
  primaryColorLight: ColoresApp.primaryLightColor,
  primaryColorDark: ColoresApp.primaryDarkColor,
  scaffoldBackgroundColor: ColoresApp.backgroundColor,

  colorScheme: ColorScheme.light(
    primary: ColoresApp.primaryColor,
    onPrimary: ColoresApp.onPrimaryColor,
    secondary: ColoresApp.accentColor,
    onSecondary: ColoresApp.onSecondaryColor,
    surface: ColoresApp.surfaceColor,
    onSurface: ColoresApp.onSurfaceColor,
    error: ColoresApp.errorColor,
    onError: ColoresApp.onErrorColor,
  ),

  textTheme: GoogleFonts.interTextTheme(
    ThemeData.light().textTheme.copyWith(
      bodyMedium: TextStyle(color: ColoresApp.primaryTextColor),
      bodyLarge: TextStyle(color: ColoresApp.primaryTextColor),
    ),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: ColoresApp.primaryColor,
      foregroundColor: ColoresApp.onPrimaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.symmetric(vertical: 16),
      textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    ),
  ),
  visualDensity: VisualDensity.adaptivePlatformDensity,
);
