import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppThemes {
  static final ThemeData primaryTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      elevation: 0.5,
    ),
    cardTheme: CardTheme(
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      labelStyle: TextStyle(color: AppColors.baseBlack),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.baseGrey),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColors.baseGrey),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.baseWhite,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.baseGrey,
    ),
    fontFamily: GoogleFonts.montserratAlternates().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.primaryColor),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
  );
  static final ThemeData googleTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.baseWhite,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.baseGrey,
    ),
    fontFamily: GoogleFonts.montserratAlternates().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.googleColor),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
  );
  static final ThemeData facebookTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.baseWhite,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.baseGrey,
    ),
    fontFamily: GoogleFonts.montserratAlternates().fontFamily,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.facebookColor),
      ),
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: AppColors.secondaryColor),
  );
}
