import 'package:flutter/material.dart';
import 'package:personal_gallery/utils/app_color.dart';

ElevatedButtonThemeData getElevatedButtonTheme() => ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.themeColor,
        foregroundColor: AppColor.white,
        padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
