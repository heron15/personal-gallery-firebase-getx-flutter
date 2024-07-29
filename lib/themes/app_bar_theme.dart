import 'package:flutter/material.dart';
import 'package:personal_gallery/utils/app_color.dart';

AppBarTheme getAppBarTheme() => const AppBarTheme(
      color: AppColor.themeColor,
      foregroundColor: AppColor.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 18,
      ),
      actionsIconTheme: IconThemeData(
        size: 25,
      ),
    );
