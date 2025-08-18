import 'package:flutter/material.dart';
import 'package:whats_app/utills/core/app_colors.dart';

class TextStyles {
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle appBarTitleLight = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.secondaryColor,
  );
  static const TextStyle chatNameLight = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.primaryColor,
  );

  static const TextStyle chatNameDark = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.lightBackground,
  );

  static const TextStyle chatMessageDark = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.recieveBubbleLight,
  );

  static const TextStyle chatMessageLight = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.receivedBubbleDark,
  );

  static const TextStyle time = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.grey,
  );

  static const TextStyle message = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
  );
}
