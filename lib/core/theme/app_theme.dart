import 'package:chef_app/core/utils/app_colors.dart';
import 'package:chef_app/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

ThemeData getAppTheme() {
  return ThemeData(
      primaryColor: AppColors.primary,
      //scaffoldBackgroundColor
      scaffoldBackgroundColor: AppColors.whitetext,
      //appBar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.primary,
      ),
      //text theme
      textTheme: TextTheme(
        displayLarge: boldstyle(),
        displayMedium: regularstyle(),
      ),
      //button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      //text field
      inputDecorationTheme: InputDecorationTheme(
        //enabled border
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //fouced border
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //error border
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        //hint
        hintStyle: boldstyle(color: AppColors.greytext, fontSize: 16),
        //fill color
        // fillColor: AppColors.lightBlack,
        // filled: true,
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(
            AppColors.greytext,
          ),
          textStyle: WidgetStateProperty.all(
              boldstyle(color: AppColors.greytext, fontSize: 16)),
        ),
      ));
}
