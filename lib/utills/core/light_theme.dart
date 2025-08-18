import 'package:flutter/material.dart';
import 'package:whats_app/utills/core/app_colors.dart';
import 'package:whats_app/utills/core/text_styles.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.appBarLight,
      foregroundColor: AppColors.secondaryColor,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyles.appBarTitleLight,
      iconTheme: IconThemeData(color: AppColors.secondaryColor),
    ),

    // FAB
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.secondaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
    ),

    // ColorScheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      surface: AppColors.recieveBubbleLight,
    ),

    // Bottom Navigation Bar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.appBarLight,
      selectedItemColor: AppColors.secondaryColor,
      unselectedItemColor: Colors.black45,
      selectedIconTheme: IconThemeData(
        size: 28,
        color: AppColors.secondaryColor,
      ),
      unselectedIconTheme: IconThemeData(size: 24, color: Colors.black45),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w400),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      elevation: 7,
    ),

    // Progress indicator
    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.secondaryColor,
    ),

    // Texts
    textTheme: const TextTheme(
      bodyMedium: TextStyles.chatNameLight,
      bodySmall: TextStyles.chatMessageLight,
    ),
  );
}
