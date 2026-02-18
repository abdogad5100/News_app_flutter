import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/resources/app_colors.dart';

class AppTheme {
  static ThemeData light_theme = ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.lightPrimaryColor,
      ),
    ),
    textTheme: TextTheme(
      headlineMedium: TextStyle(
        color: AppColors.lightPrimaryColor,
        fontSize: 24.sp,
        fontWeight: FontWeight.w700,
      ),
      labelMedium: TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      ),
      titleSmall: TextStyle(
        fontSize: 12.sp,
        fontWeight: FontWeight.w500,
        color: AppColors.greyColor
      ),
    ),

    colorScheme: ColorScheme.light(
      primary: AppColors.lightPrimaryColor,
      secondary: AppColors.lightSecondaryColor,
      onSecondary: AppColors.greyColor,
      primaryContainer: Colors.white,
    ),
    dividerTheme: DividerThemeData(
      color: Colors.white,
      thickness: 1.h,


    )
  );
}
