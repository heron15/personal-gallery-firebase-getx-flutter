import 'package:flutter/material.dart';
import 'package:personal_gallery/utils/app_color.dart';

InputDecorationTheme getInputDecorationTheme() => InputDecorationTheme(
      fillColor: AppColor.editTextBg,
      filled: true,
      hintStyle: TextStyle(
        color: AppColor.textColorSecondary.withAlpha(150),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: AppColor.green,
          width: 1,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
        borderSide: const BorderSide(
          color: AppColor.grey,
          width: 1,
        ),
      ),
    );
