import 'package:flutter/material.dart';
import 'package:whats_app/utills/core/app_colors.dart';
import 'package:whats_app/utills/core/text_styles.dart';

class DarkTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarDark,
      foregroundColor: Colors.white,
      titleTextStyle: TextStyles.appBarTitle,
      elevation: 0,
      centerTitle: false,
    ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // Color scheme
    colorScheme: const ColorScheme.dark(
      primary: AppColors.accent,
      secondary: AppColors.accent,
      surface: AppColors.receivedBubbleDark,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.darkBackground,
      selectedItemColor: AppColors.accent,
      unselectedItemColor: Colors.white70,
      selectedIconTheme: IconThemeData(size: 28, color: AppColors.accent),
      unselectedIconTheme: IconThemeData(size: 24, color: Colors.white70),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),

    // Texts
    textTheme: const TextTheme(
      bodyMedium: TextStyles.chatNameDark,
      bodySmall: TextStyles.chatMessageDark,
    ),
  );
}
